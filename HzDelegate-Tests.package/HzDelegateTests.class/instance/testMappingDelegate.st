tests
testMappingDelegate

	| delegate |
	
	delegate := HzMappingDelegate new.
	delegate 
		map: '/' toRedirect: 'page';
		map: 'page' toDelegate: self helloResponseDelegate;
		map: 'item' toCallback: [ :req | ZnResponse ok: (ZnEntity text: 'test') ].
	
	self serveDelegate: delegate clientDo: [ :client | 
		self assert: client get equals: 'Hello'.	
	].

	self serveDelegate: delegate clientDo: [ :client | 
		client addPath: 'stuff'; get.
			
		self assert: client response statusLine 
			equals: ZnStatusLine notFound.
	].

	self serveDelegate: delegate clientDo: [ :client | 
		client addPath: 'item'.
		
		self assert: client get equals: 'test'
	].