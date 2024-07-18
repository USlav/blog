

component displayname="posts"{
	public query function getPostById(required numeric postId){
		var f = {};
		f.qResult = queryExecute(
			"SELECT title, description, datePublished, id 
			FROM post 
			WHERE id = :id"
			,{id={value=arguments.postId, cfsqltype="integer"}}
		);
		return f.qResult;
	}

	public query function renderRecentPosts(numeric numOfPosts=0){
		var f = {};
		if (numOfPosts EQ 0) {
			f.qResult = queryExecute(
			"SELECT title, description, datePublished, id 
			FROM post
			ORDER BY datePublished DESC"
			,{}
			);
		}else{
			f.qResult = queryExecute(
			"SELECT title, description, datePublished, id 
			FROM post
			ORDER BY datePublished DESC
			LIMIT (:num)"
			,{
				num={value=arguments.numOfPosts, cfsqltype="integer"}
			}
			);
		}
		return f.qResult;
	}
	
	public function addPost(required string title, required date datePublished, required string description) {
		
		queryExecute(
			"INSERT INTO post (title, description, accountId, isPublished, datePublished) 
			VALUES (:title, :description, 1, 0, :datePublished)"
			,{
				title={value=arguments.title, cfsqltype="varchar"},
				datePublished={value=arguments.datePublished, cfsqltype="timestamp"},
				description={value=arguments.description, cfsqltype="varchar" }
			}
		);
		
	}

	public function deletePostbyId(required numeric postId) {
		queryExecute(
			"DELETE FROM post 
			WHERE id = :id",
			{id={value=arguments.postId, cfsqltype="integer"}}
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
			}
		);
	}

}


