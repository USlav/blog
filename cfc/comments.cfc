
component displayname="comments" {
	public query function renderCommentsByPostId(required numeric postId) {
		var f = {};
		f.qResult = queryExecute(
			"SELECT id, comment 
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

	remote struct function deleteComment() {
		var result = {};
		var f = {};
		try {
			// Read the raw request body content
			var requestBody = toString(getHttpRequestData().content);
			// Log the raw request body for debugging
			writeLog(text="Raw request body: #requestBody#", type="info");

			// Parse the JSON content into a ColdFusion structure
			var requestData = deserializeJson(requestBody);

			// Ensure the commentId is being passed correctly
			if (!structKeyExists(requestData, "commentId")) {
				throw(message="commentId required but was not passed in", detail="The commentId is missing from the request payload.");
			}

			var commentId = requestData.commentId;

			// Execute the DELETE query
			queryExecute(
				"DELETE FROM comment WHERE id = :commentId",
				{ commentId: { value: commentId, cfsqltype: "integer" } }
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

		// Set the content type to JSON and return the result
		getPageContext().getResponse().setContentType("application/json");
		return result;
	}
	
	
	
	
}
