*HzDelegate
handleRequestAt: anIterator

	| file |
	
	( #(#GET #HEAD) includes: anIterator method) ifFalse: [ 
		^ anIterator asResponseMethodNotAllowed
	].

	file := directory resolvePath: anIterator remainingRelativePath.
	
	file exists ifFalse: [ ^ anIterator asResponseNotFound ].
	
	(file isDirectory and: [ anIterator isDirectoryPath not ]) 	ifTrue: [ 
		^ ZnResponse redirect: (anIterator url / #/)		
	].
	
	file isDirectory ifTrue: [ 
		(self indexFileIn: file) 
			ifNotNil: [ :indexFile | file := indexFile ] 
			ifNil: [ ^ anIterator asResponseNotFound ]
	].

	^ self responseForFile: file fromRequest: anIterator request  