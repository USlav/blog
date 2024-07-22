
component displayname="authentication" {
	
	public boolean function authenticateUser(required string username, required string password) {
		var f ={};
		f.qResult=queryExecute(
			"SELECT * 
			FROM account
			WHERE username= :username AND password = :password",
			{username={value=arguments.username, cfsqltype="varchar"},
			password={value=arguments.password, cfsqltype="varchar"}
			}
		);
		return f.qResult.recordCount EQ 1;
	}
	
	public query function getUserId(required string username, required string password) {
		var f = {};
		f.qResult = queryExecute(
			"SELECT id 
			FROM account
			WHERE username = :username AND password = :password",
			{username={value=arguments.username, cfsqltype="varchar"},
			password={value=arguments.password, cfsqltype="varchar"}
			}
		);
		return f.qResult;
	}
	public function logoutUser() {
		structDelete(session, "isUserLoggedIn");
		structDelete(session, "userId");
	}
}
