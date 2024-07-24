component restpath="/post" rest="true"{
	remote struct function getOS() httpmethod="GET" restpath="os"{
		return server.os;
	}
	/* remote function getPostWithComments(required numeric postId) httpmethod="post" restpath="post"{
		var f = {};
		f.qPost = application.posts.getPostByid(arguments.postId);
		f.qPostComments = application.comments.getCommentsByPostId(arguments.postId);

		/* f.qResult = queryExecute(
			"SELECT post.id, post.title, post.description, post.datePublished, comment.id, comment.datePublished, comment.comment, account.username
			FROM post
			JOIN comment ON post.id = comment.postId
			JOIN account ON comment.accountId = account.id
			WHERE post.id = :postId",
			{postId={value=arguments.postId, cfsqltype="integer"}},
			{datasource=application.datasource}
		); 

		return serializeJSON(f.qPostComments, "struct");
	} */
}
