*HzDelegate
handleRequest: aRequest at: anIterator

	| file |
	
	( #(#GET #HEAD) includes: aRequest method) ifFalse: [ 
		^ ZnResponse methodNotAllowed: aRequest 
	].

	file := directory resolvePath: anIterator remainingRelativePath.
	
	file exists ifFalse: [ ^ ZnResponse notFound: aRequest uri ].
	
	(file isDirectory and: [ anIterator isDirectory not ]) 	ifTrue: [ 
		^ ZnResponse redirect: (aRequest uri / #/)		
	].
	
	file isDirectory ifTrue: [ 
		(self indexFileIn: file) ifNotNil: [ :indexFile | 
			self responseForFile: indexFile fromRequest: aRequest 
		] ifNil: [ ^ ZnResponse notFound: aRequest uri ]
	].

	^ self responseForFile: file fromRequest: aRequest 