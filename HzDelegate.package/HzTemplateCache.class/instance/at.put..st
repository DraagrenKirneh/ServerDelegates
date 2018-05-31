accessing
at: aPath put: aTemplate

	| path |
	
	path := aPath isString 
		ifTrue: [ ($/ split: aPath) ]
		ifFalse: [ aPath ].
		
	^ self atPath: path put: aTemplate 