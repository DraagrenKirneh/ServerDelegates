initialization
request: aRequest

	request := aRequest.
	segments := aRequest url pathSegments ifEmpty: [ #(/) ].