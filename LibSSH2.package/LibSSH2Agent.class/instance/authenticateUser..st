API
authenticateUser: userName
	| key error |

	error := self primConnect.
	error = 0 ifFalse: [ self primError: error].
	
	key := self findFirstKey.
	[
		[error := self primAuthUser: userName with: key] doWhileTrue: [error = -9].
		error = 0 | (error = -18) ifFalse: [ self primError: error ].
		error = -18
	] whileTrue: [ self loadNextKey: key ]