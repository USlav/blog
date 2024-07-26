
component displayname="authentication" {
	
	public boolean function authenticateUser(required string username, required string password) {
		var f ={};
		f.qResult=queryExecute(
			"SELECT id
			FROM account
			WHERE username= :username AND password = :password",
			{username={value=arguments.username, cfsqltype="varchar"},
			password={value=arguments.password, cfsqltype="varchar"}
			},{datasource = application.datasource}
		);
		return f.qResult.recordCount == 1;
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

	
	public boolean function isUserAdmin(required numeric id) {
		
		f.qResult = queryExecute(
			"SELECT isAdmin
			FROM account
			WHERE id = :id",
			{id={value=arguments.id, cfsqltype="integer"}},
			{ datasource=application.datasource}
		);
		return f.qResult.isAdmin;
	}

	
	public boolean function checkIfUserExists(required string username, required string password, required string email) {
		var f = {};
		f.qResult = queryExecute(
			"SELECT id
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

	
	public query function getAllUsers() {
		
		var f = {};
		f.qResult = queryExecute(
			"SELECT * 
			FROM account",
			{},
			{ datasource=application.datasource }
		);
		return f.qResult;
	}

	
	public query function getSingleUser(required numeric id) {
		var f = {};
		f.qResult = queryExecute(
			"SELECT *
			FROM account
			WHERE id = :id",
			{id={value=arguments.id, cfsqltype="integer"}},
			{ datasource=application.datasource }
		);
		return f.qResult;
	}

	public void function logoutUser() {
		structDelete(session, "isUserLoggedIn");
		structDelete(session, "userId");
		structDelete(session, "isAdmin");
	}

	
	remote struct function deleteUser(required numeric userId) {
		var result = {};
		try {
			queryExecute(
				"DELETE FROM account WHERE id = :userId",
				{ userId: { value: arguments.userId, cfsqltype: "integer" } 
				},{datasource = application.datasource}
			);

			result["status"] = "success";
			result["message"] = "User deleted successfully.";
		} catch (any e) {
			// Log the error details
			writeLog(
				text="Error in deleteUser function: #e.message# - #e.detail#",
				type="error"
			);
			result["status"] = "error";
			result["message"] = "Failed to delete user: " & e.message &e.detail;
		}

		return result;
	}
	
}
