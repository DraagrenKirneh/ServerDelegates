accessing
remainingRelativePath

	| col |
	
	col := self remainingSegments reject: [ :s | 
		s isEmpty or: [ s = #/ ] 
	].

	^ RelativePath withAll: col