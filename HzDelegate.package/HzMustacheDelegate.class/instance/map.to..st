private
map: aPath to: aTemplateAssociation

	aPath isString 
		ifTrue: [ objects at: aPath put: aTemplateAssociation ]
		ifFalse: [ objects atPath: aPath put: aTemplateAssociation ]