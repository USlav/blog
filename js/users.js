document.addEventListener('DOMContentLoaded', function () {
	document.body.addEventListener('click', function(event){
		console.log(event);
		if (event.target.classList.contains('deleteUser')) {
            let pathToFetch = "../cfc/authentication.cfc?method=deleteUser&userId=";
			let elementToRemove = "user-";
			remove(event, pathToFetch, elementToRemove);
		}
	});
});

