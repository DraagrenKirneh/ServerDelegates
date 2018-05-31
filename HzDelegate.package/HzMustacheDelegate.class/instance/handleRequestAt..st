public
handleRequestAt: aRequestIterator
	
	| association result |
	
	[ 
		association := self objectAt: aRequestIterator remainingPath.
	] on: KeyNotFound do: [ 
		^ aRequestIterator asResponseNotFound
	].

	result := templates generate: association key for: association value.
	
	^ ZnResponse ok: (ZnEntity html: result)
