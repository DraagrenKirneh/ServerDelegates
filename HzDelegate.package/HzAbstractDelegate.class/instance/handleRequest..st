public
handleRequest: aRequest

	| iterator |
	
	iterator := HzRequestIterator request: aRequest.
	
	^ self handleRequestAt: iterator
	