
component displayname="comments" {
	public query function getCommentsByPostId(required numeric postId) {
		var f = {};
		f.qResult = queryExecute(
			"SELECT c.id, c.comment, c.datePublished, c.accountId, a.username 
			 FROM comment c
			 JOIN account a ON c.accountId = a.id
			 WHERE c.postId = :id",
			{
				id={value=arguments.postId, cfsqltype="integer"}
			},{datasource = application.datasource}
		);
		return f.qResult;
	}

	public function addComment(required string comment, required numeric postId, required date datePublished, required numeric userId) {
		queryExecute(
			"INSERT INTO comment (postId, comment, datePublished, accountId)
			VALUES (:postId, :comment,:datePublished, :userId)",
			{
				postId={value=arguments.postId, cfsqltype="integer"},
				comment={value=arguments.comment, cfsqltype="varchar"},
				datePublished={value=arguments.datePublished, cfsqltype="timestamp"},
				userId={value=arguments.userId, cfsqltype="integer"}
			},{datasource = application.datasource}
		);
	}

	
	remote struct function deleteComment(required numeric commentId) {
		var result = {};
		try {
			queryExecute(
				"DELETE FROM comment WHERE id = :commentId",
				{ 
					commentId: { value: arguments.commentId, cfsqltype: "integer" } 
				},
				{datasource = application.datasource}
			);

			result["status"] = "success";
			result["message"] = "Comment deleted successfully.";
		} catch (any e) {
			// Log the error details
			writeLog(
				text="Error in deleteComment function: #e.message# - #e.detail#",
				type="error"
			);
			result["status"] = "error";
			result["message"] = "Failed to delete comment: " & e.message;
		}
		return result;
	} 
	
	
	
}
