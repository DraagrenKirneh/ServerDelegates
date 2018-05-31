adding
addFile: aFile atPath: aCollection
	
	| template |
	
	template := super addFile: aFile atPath: aCollection.
	timestampDict at: template put: { aFile modificationTime . aFile fullName }.
	
	^ template 