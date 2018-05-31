accessing
templateAt: aPath
	
	| template meta ref |
	
	template := [ super templateAt: aPath ] 
		on: KeyNotFound 
		do: [ self lookupMissing: aPath ].
		
	meta := timestampDict at: template.
	ref := meta second asFileReference.
	meta first = ref modificationTime ifTrue: [ ^ template ].
	
	timestampDict removeKey: template.
	templates removePath: aPath.
	
	^ self addFile: ref atPath: aPath
	
	
