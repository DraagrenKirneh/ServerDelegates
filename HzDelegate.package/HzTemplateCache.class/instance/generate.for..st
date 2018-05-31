public
generate: aTemplateName for: anObject

	| template |
	
	template := self at: aTemplateName.
	
	^ template value: anObject partials: self