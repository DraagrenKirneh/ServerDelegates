private
responseForFile: filename fromRequest: aRequest

	| file entry size time mimeType fileStream entity response |
	
	file := filename asFileReference.
	entry := file entry.
	size := entry size.
	time := entry modificationTime.
	
	aRequest headers at: 'If-Modified-Since' ifPresent: [ :header | 
		time < (ZnUtils parseHttpDate: header) ifTrue: [ 
			^ ZnResponse notModified
		]		
	].

	mimeType := ZnMimeType forFilenameExtension: file extension.
	fileStream := file readStream.
	fileStream binary.
	entity := ZnStreamingEntity type: mimeType length: size.
	entity stream: fileStream.
	
	response := ZnResponse ok: entity.
	response	headers at: 'Modification-Date' put: (ZnUtils httpDate: time).
	
	^ response