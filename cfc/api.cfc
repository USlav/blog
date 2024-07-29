component {
    remote string function getPostWithComments(required numeric postId) {
        var f = {};
		f.qPost = application.posts.getPostById(arguments.postId);
		f.qComments = application.comments.getCommentsByPostId(arguments.postId);
		return serializeJSON(f, "struct");
    }
}
	

