baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			package: #'HzDelegate';
			package: #'HzDelegate-Tests'.
		
		spec 
			group: 'default' with: #('core' 'tests');
			group: 'core' with: #('HzDelegate');
			group: 'tests' with: #('HzDelegate-Tests') ]