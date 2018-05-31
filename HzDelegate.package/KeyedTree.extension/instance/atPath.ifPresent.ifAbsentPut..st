*HzDelegate
atPath: anArray ifPresent: aPresentBlock ifAbsentPut: aBlock

	|element|
	anArray ifEmpty: [ ^ self ].
	
	element := self.
	anArray allButLastDo: [:key |
		element := element at: key ifAbsentPut: [ self species new ]
	].

	^ element at: anArray last ifPresent: aPresentBlock ifAbsentPut: aBlock