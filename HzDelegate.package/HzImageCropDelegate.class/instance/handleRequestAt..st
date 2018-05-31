public
handleRequestAt: aRequestIterator

	| cropType crop |
	
	aRequestIterator method == #GET ifFalse: [ 
		^ aRequestIterator asResponseMethodNotAllowed
	].

	cropType := aRequestIterator url 
		queryAt: 'crop' 
		ifAbsent: [ ^ self rawImage: aRequestIterator ].
		
	crop := crops at: cropType ifAbsent: [ 
		^ aRequestIterator	asResponseBadRequest
	].

	^ self imageAt: aRequestIterator crop: crop
	
	

	