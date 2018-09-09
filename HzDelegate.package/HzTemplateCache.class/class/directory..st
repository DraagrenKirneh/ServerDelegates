accessing
directory: aDirectory

	^ self new 
		fromDirectory: aDirectory asFileReference;
		yourself