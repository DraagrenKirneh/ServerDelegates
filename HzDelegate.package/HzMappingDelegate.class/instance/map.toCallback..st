accessing
map: aString toCallback: aBlock

	| delegate |
	
	delegate := HzDynamicDelegate action: aBlock.
	
	self map: aString toDelegate: delegate