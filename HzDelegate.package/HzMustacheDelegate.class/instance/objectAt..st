private
objectAt: aPath

	^ aPath isString 
		ifTrue: [ objects at: aPath ]
		ifFalse: [ objects atPath: aPath ]