accessing
templateAt: aPath
	
	^ aPath isString 
		ifTrue: [ templates at: aPath ]
		ifFalse: [ templates atPath: aPath ]