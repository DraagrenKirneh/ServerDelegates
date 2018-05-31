enumerating
serveDelegate: aDelegate clientDo: block

	| server |
	
	server := ZnServer on: 2700 + 32 atRandom.
	server delegate: aDelegate.

	[ | client | 
	
		server start.
		
		self assert: server isRunning & server isListening
			description: (self failedServerDescription format: { server port }).
	
		client := ZnClient new.
		client beOneShot
			url: server localUrl.
			
		block cull: client
		
	] ensure: [ server stop ]