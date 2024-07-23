
component displayname="authentication" {
	
	public boolean function authenticateUser(required string username, required string password) {
		var f ={};
		f.qResult=queryExecute(
			"SELECT * 
			FROM account
			WHERE username= :username AND password = :password",
			{username={value=arguments.username, cfsqltype="varchar"},
			password={value=arguments.password, cfsqltype="varchar"}
			},{datasource = application.datasource}
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
			},{datasource = application.datasource}
		);
		return f.qResult;
	}

	
	public query function isUserAdmin(required numeric id) {
		
		f.qResult = queryExecute(
			"SQL Query",
			{params},
			{ datasource=request.datasource, timeOut=application.queryTimeOut }
		);
	}

	
	public boolean function checkIfUserExists(required string username, required string password, required string email) {
		var f = {};
		f.qResult = queryExecute(
			"SELECT * 
			FROM account
			WHERE username = :username AND password = :password AND email = :email ",
			{
				username={value=arguments.username},
				password={value=arguments.password},
				email={value=arguments.email}
			},
			{ datasource=application.datasource}
		);	
		return f.qResult.recordCount;
	}

	public function addUser(required string username, required string password, required string email) {
		var f = {};
		f.qResult = queryExecute(
			"INSERT INTO account (username, password, email, dateCreated)
			VALUES (:username, :password, :email, :dateCreated)",
			{
				username={value=arguments.username, cfsqltype="varchar"},
				password={value=arguments.password, cfsqltype="varchar"},
				email={value=arguments.email, cfsqltype="varchar"},
				dateCreated={value=now(), cfsqltype="timestamp"}
			},
			{datasource=application.datasource}
		);
	}
	public function logoutUser() {
		structDelete(session, "isUserLoggedIn");
		structDelete(session, "userId");
	}
}
