accessing
remainingPath

	| col |
	
	col := self remainingSegments reject: [ :s | 
		s isEmpty or: [ s = #/ ] 
	].

	^ col ifEmpty: [ '' ]