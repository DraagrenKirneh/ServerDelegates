public
imageAt: anIterator crop: crop
	
	| seg path cropFile rawFile |
	
	seg := anIterator remainingPath.
	path := RelativePath withAll: seg allButLast.
	path := path / '.crops' / (crop name , '-' , seg last).
	path := path withExtension: 'jpeg'.	 
	
	cropFile := directory resolvePath: path.
	cropFile exists ifTrue: [ ^ self responseForFile: cropFile fromRequest: anIterator request ].

	rawFile := directory resolvePath: anIterator remainingRelativePath.
	rawFile exists ifFalse: [ ^ anIterator asResponseNotFound ].
	
	crop cropImage: rawFile into: cropFile.
	
	^ self responseForFile: cropFile fromRequest: anIterator request 