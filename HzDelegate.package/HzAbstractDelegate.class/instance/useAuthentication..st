public
useAuthentication: anAuthenticator

	^ HzAuthenticationDelegate new 
		delegate: self;
		authenticator: anAuthenticator