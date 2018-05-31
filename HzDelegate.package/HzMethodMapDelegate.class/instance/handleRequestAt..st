public
handleRequestAt: aRequestIterator

	^ map at: aRequestIterator method 
		ifPresent: [ :delegate | delegate handleRequestAt: aRequestIterator ]
		ifAbsent: [ aRequestIterator asResponseMethodNotAllowed ]