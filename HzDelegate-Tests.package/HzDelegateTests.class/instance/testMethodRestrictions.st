tests
testMethodRestrictions

	| delegate wrapper |
	
	delegate := self basicResponseDelegate.
	wrapper := HzMethodRestrictionDelegate new 
		delegate: delegate;
		postOnly.
		
	self serveDelegate: wrapper clientDo: [ :client |
		client get.
		
		self assert: client response statusLine 
			equals: ZnStatusLine methodNotAllowed.
	].

	self serveDelegate: wrapper clientDo: [ :client |
		client entity: (ZnEntity text: '42').
			
		self assert: client post 
			equals: '42'
	].