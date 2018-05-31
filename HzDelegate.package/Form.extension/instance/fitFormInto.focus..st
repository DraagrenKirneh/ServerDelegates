*HzDelegate
fitFormInto: anExtent focus: aFocusPoint 
	"Scale and center the receiver into a form of a given size"

	| scale scaledForm result |

	anExtent = self extent ifTrue: [ ^ self ].

	(self height isZero or: [self width isZero]) ifTrue: [ 
		^ Form extent: anExtent depth: self depth
	].

	scale := anExtent y / self height max: anExtent x / self width.
	scaledForm := self magnify: self boundingBox by: scale smoothing: 8.

	result := Form extent: anExtent depth: 32.
	result getCanvas
		translucentImage: scaledForm
		at: anExtent - scaledForm extent * aFocusPoint.

	^ result
