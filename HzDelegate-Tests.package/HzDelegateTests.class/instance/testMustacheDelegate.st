tests
testMustacheDelegate
	
	| delegate |
	
	delegate := self mustacheDelegate.
	
	self serveDelegate: delegate clientDo: [ :client |
		self assert: client get equals: 'Hello, World!'
	].

	self serveDelegate: delegate clientDo: [ :client |
		client addPath: 'abc'.
		
		self assert: client get equals: 'value is 42'
	].

	self serveDelegate: delegate clientDo: [ :client |
		client addPath: 'api/stuff'.
		self assert: client get equals: '1 4 16 9 '
	]  