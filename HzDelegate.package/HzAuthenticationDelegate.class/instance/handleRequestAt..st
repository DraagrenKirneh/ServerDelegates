public
handleRequestAt: aPathIterator

	^ authenticator authenticateRequest: aPathIterator request do: [ 
		delegate handleRequestAt: aPathIterator  
	]