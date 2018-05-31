delegates
basicResponseDelegate

	^ HzDynamicDelegate action: [ :it |
		ZnResponse ok: (ZnEntity text: it request contents)
	]