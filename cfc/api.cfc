component {
    remote string function getPostWithComments() {
        var f = {};
		f.qPost = getPostById(1);
		f.qComments = getCommentsByPostId(1);
		return f;
    }
	
}
	

