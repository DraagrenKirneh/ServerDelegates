initialization
fromDirectory: aDirectory
	
	| files |
	
	files := aDirectory allChildrenMatching: '*.mu' .
	files do: [ :file | | seg |
		seg := (file withoutExtension relativeTo: aDirectory ) segments.
		self addFile: file atPath: seg
	].
	