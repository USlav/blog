
component displayname="comments" {
	public query function renderCommentsByPostId(required numeric postId) {
		var f = {};
		f.qResult = queryExecute(
			"SELECT comment 
			 FROM comment
			 WHERE postId = :id",
			{id={value=arguments.postId, cfsqltype="integer"}}
		);
		return f.qResult;
	}
	
	public function addComment(required string comment, required numeric postId, required date datePublished) {
		queryExecute(
			"INSERT INTO comment (postId, comment, datePublished, accountId)
			VALUES (:postId, :comment,:datePublished, 1)",
			{
				postId={value=arguments.postId, cfsqltype="integer"},
				comment={value=arguments.comment, cfsqltype="varchar"},
				datePublished={value=arguments.datePublished, cfsqltype="timestamp"}
			}
		);
	}
	
	public query function deleteComment(required numeric commentId) {
		
	}
}
