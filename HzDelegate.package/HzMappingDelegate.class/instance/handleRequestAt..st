public
handleRequestAt: aRequestIterator

	^ map at: aRequestIterator next 
		ifPresent: [ :delegate | delegate handleRequestAt: aRequestIterator ]
		ifAbsent: [ 
			default 
				ifNil: [ 	aRequestIterator asResponseNotFound ]
				ifNotNil: [ 
					aRequestIterator stepBack.
					default handleRequestAt: aRequestIterator 
				]
 		]
	