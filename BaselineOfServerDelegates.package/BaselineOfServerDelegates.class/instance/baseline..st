baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		
		spec baseline: 'Mustache' with: [ 
			spec repository: 'github://DraagrenKirneh/mustache/repository'
		].
	
		spec configuration: 'ZincHTTPComponents' with: [ 
			spec 
				versionString: #bleedingEdge;
				loads: #('Zinc-WebSocket-Core');
             repository: 'http://mc.stfx.eu/ZincHTTPComponents'
		].
		
		spec 
			package: #'HzDelegate' with: [ spec requires: #(Mustache ZincHTTPComponents) ];
			package: #'HzDelegate-Image';
			package: #'HzDelegate-Tests'.
		
		spec 
			group: 'default' with: #('core' 'tests');
			group: 'core' with: #('HzDelegate' 'HzDelegate-Image');
			group: 'tests' with: #('HzDelegate-Tests') 
	
	]