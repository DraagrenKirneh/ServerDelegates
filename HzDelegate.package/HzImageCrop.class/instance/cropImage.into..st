as yet unclassified
cropImage: imageFile into: outputFile

	| form fitttedForm |
	
	form := Form fromFileNamed: imageFile.
	fitttedForm := form fitFormInto: extent focus: focus.
	
	PluginBasedJPEGReadWriter 
		putForm: fitttedForm 
		quality: (quality ifNil: [ -1 ])
		progressiveJPEG: true 
		onFileNamed: outputFile fullName
		

	