
document.addEventListener('DOMContentLoaded', function () {
	document.body.addEventListener('click', function(event){
		if (event.target.classList.contains('deleteButton')) {
            let pathToFetch = "../cfc/comments.cfc?method=deleteComment&commentId=";
			let elementToRemove = "comment-";
			remove(event, pathToFetch, elementToRemove);
		}
	});
});



