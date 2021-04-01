initialization
initializePackgesFromJSON
	| jsonFile packageInfo numberOfPackages |
	jsonFile := self packageInfoFile.
	jsonFile isFile ifFalse: [ self buildPackageInfo ].
	packageInfo := (NeoJSONReader on: jsonFile readStream) next.
	numberOfPackages := packageInfo size.
	packages := Array new: numberOfPackages.
	numberOfPackages to: 1 by: -1 do: [ :index |
		packages at: index put:
			(GxPackage new guix: self; packageDataJSON: (packageInfo at: numberOfPackages - index + 1))]