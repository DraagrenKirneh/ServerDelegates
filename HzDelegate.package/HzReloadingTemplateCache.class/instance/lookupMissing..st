private
lookupMissing: aPath

	| file relative |
	
	relative := RelativePath withAll: aPath.
	relative withExtension: 'mu'.
	file := directory asFileReference / relative.
	file exists ifFalse: [ self error ].
	
	^ self addFile: file atPath: aPath