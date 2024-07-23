

component displayname="posts"{
	public query function getPostById(required numeric postId){
		var f = {};
		f.qResult = queryExecute(
			"SELECT title, description, datePublished, id 
			FROM post 
			WHERE id = :id"
			,{
				id={value=arguments.postId, cfsqltype="integer"}
			},{datasource = application.datasource}
		);
		return f.qResult;
	}

	public query function renderRecentPosts(numeric numOfPosts=0){
		var f = {};
		if (numOfPosts == 0) {
			f.qResult = queryExecute(
			"SELECT title, description, datePublished, id 
			FROM post
			ORDER BY datePublished DESC"
			,{},{datasource = application.datasource}
			);
		}else{
			f.qResult = queryExecute(
			"SELECT TOP (:num) title, description, datePublished, id 
			FROM post
			ORDER BY datePublished DESC"
			,{
				num={value=arguments.numOfPosts, cfsqltype="integer"}
			},{datasource = application.datasource}
			);
		}
		return f.qResult;
	}
	
	public function addPost(required string title, required date datePublished, required string description) {
		
		queryExecute(
			"INSERT INTO post (title, description, accountId, isPublished, datePublished) 
			VALUES (:title, :description, :accountId, :isPublished, :datePublished)"
			,{
				title={value=arguments.title, cfsqltype="varchar"},
				datePublished={value=arguments.datePublished, cfsqltype="timestamp"},
				description={value=arguments.description, cfsqltype="varchar" },
				accountId={value=1, cfsqltype="numeric"},
				isPublished={value=0, cfsqltype="numeric"}
			},{datasource = application.datasource}
		);
		
	}

	public function deletePostbyId(required numeric postId) {
		queryExecute(
			"DELETE FROM post 
			WHERE id = :id",
			{id={value=arguments.postId, cfsqltype="integer"}
			},{datasource = application.datasource}
		);
	}

	public function updatePost(required string title, required date datePublished, required string description, required numeric id){
		queryExecute(
			"UPDATE post 
			SET title = :title, description = :description, datePublished = :datePublished 
			WHERE id = :id",
			{
				title={value=arguments.title, cfsqltype="varchar"},
				datePublished={value=arguments.datePublished, cfsqltype="timestamp"},
				description={value=arguments.description, cfsqltype="varchar" },
				id = {value=arguments.id, cfsqltype="integer"}
			},{datasource = application.datasource}
		);
	}

}


