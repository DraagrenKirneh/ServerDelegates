delegates
helloResponseDelegate

	^ HzDynamicDelegate action: [ :req |
		ZnResponse ok: (ZnEntity text: 'Hello')
	]