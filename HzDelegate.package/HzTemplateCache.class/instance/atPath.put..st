accessing
atPath: aPath put: aTemplate
	
	^ templates atPath: aPath
		ifPresent: [ :x | self error ] 
		ifAbsentPut: [ aTemplate ]