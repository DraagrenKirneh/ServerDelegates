public
rawImage: anIterator

	| file |
	
	file := directory resolvePath: anIterator remainingRelativePath.	
	
	^ file exists 
		ifTrue:  [ self responseForFile: file fromRequest: anIterator request ]
		ifFalse: [ anIterator asResponseNotFound ]