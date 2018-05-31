adding
emplaceCrop: aBlock 

	| crop |
	
	crop := HzImageCrop new.
	aBlock value: crop.
	
	self addCrop: crop