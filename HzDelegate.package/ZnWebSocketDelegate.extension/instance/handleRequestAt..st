*HzDelegate
handleRequestAt: aRequestIterator
	
	aRequestIterator atEnd ifFalse: [ ^ aRequestIterator asResponseNotFound ].

	^ (self isValidWebSocketRequest: aRequestIterator request)
		ifTrue: [ self webSocketResponseForRequest: aRequestIterator request ]
		ifFalse: [ aRequestIterator asResponseBadRequest ]
