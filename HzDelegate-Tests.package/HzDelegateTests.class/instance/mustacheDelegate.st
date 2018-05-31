delegates
mustacheDelegate

	| cache objects |
	
	cache := HzTemplateCache new
		at: '' put: '{{yourself}}, World!' asMustacheTemplate;
		at: 'item' put: 'value is {{value}}' asMustacheTemplate;
		at: 'api/stuff' put: '{{#yourself}}{{squared}} {{/yourself}}' asMustacheTemplate;
		yourself.
				
	^ HzMustacheDelegate new 
		templates: cache;
		objectAt: '' put: 'Hello';
		objectAt: 'abc' put: 42 template: 'item'; 
		objectAt: 'api/stuff' put: { 1 . 2 . 4 . 3 };
		yourself 
		
	
		
	