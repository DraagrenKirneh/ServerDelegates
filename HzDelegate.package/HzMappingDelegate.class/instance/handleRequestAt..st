public
handleRequestAt: aRequestIterator

	^ map at: aRequestIterator next 
		ifPresent: [ :delegate | delegate handleRequestAt: aRequestIterator ]
		ifAbsent: [ aRequestIterator asResponseNotFound ]
	