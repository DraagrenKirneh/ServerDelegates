tests
testAuthentication

	| delegate wrapper auth |
	
	auth := ZnBasicAuthenticator new.
	auth atUsername: 'password' putPassword: 'username'.
	 
	delegate := self helloResponseDelegate.
	wrapper := HzAuthenticationDelegate new 
		delegate: delegate;
		authenticator: auth.
		
	self serveDelegate: wrapper clientDo: [ :client |

		client get.
		self assert: client response statusLine equals: ZnStatusLine unauthorized.
		client setBasicAuthenticationUsername: 'password' password: 'username'.
		self 
			assert: client get equals: 'Hello';
			assert: client response statusLine equals: ZnStatusLine ok.
		
		client 
			setBasicAuthenticationUsername: 'password' password: 'abc';
		 	get.
		
		self assert: client response statusLine equals: ZnStatusLine unauthorized.
	].