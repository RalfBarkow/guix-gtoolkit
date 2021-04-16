inspecting
gtPackageOutputsFor: aView
	<gtView>
	^ aView columnedList
		title: 'Package Outputs';
		priority: 1;
		items: [ packageOutputs ];
		column: 'Name' text: [ :each | each package name ];
		column: 'Version' text: [ :each | each package version ];
		column: 'Output' text: #output;
		actionStencil: [ :anElement |
			GtSpotterDropdownButtonStencil new
				object: self guix packageOutputs;
				tooltip: 'Add Package Output';
				icon: BrGlamorousVectorIcons add;
				actOn: [ :anActOnEvent :anItem | 
					self addPackageOutput: anItem.
					anActOnEvent beActed ] ]
		tooltip: 'Add Package';
		updateWhen: GxEnvironmentModified in: guix announcer;
		yourself