public
handleRequestAt: aRequestIterator
	
	 ^ (methods includes: aRequestIterator method) 
		ifTrue: [ delegate handleRequestAt: aRequestIterator ]
		ifFalse: [ aRequestIterator asResponseMethodNotAllowed ]
	