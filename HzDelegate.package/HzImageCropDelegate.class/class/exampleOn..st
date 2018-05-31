as yet unclassified
exampleOn: aDirectory
	
	^ self new 
		directory: aDirectory;
		emplaceCrop: [ :crop | 
			crop name: 'topImageLarge';
				extent: 1200@600;
				focus: 0.5 @ 0
		];
		emplaceCrop: [ :crop | 
			crop name: 'centerHigh';
				extent: 400@700
		]

	