baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		
		spec baseline: 'Mustache' with: [ 
			spec repository: 'github://DraagrenKirneh/mustache/repository'
		].
		
		spec 
			package: #'HzDelegate' with: [ spec requires: #(Mustache) ];
			package: #'HzDelegate-Tests'.
		
		spec 
			group: 'default' with: #('core' 'tests');
			group: 'core' with: #('HzDelegate');
			group: 'tests' with: #('HzDelegate-Tests') 
	
	]