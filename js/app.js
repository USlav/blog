async function remove(event, pathToFetch, elementToRemove){
	try{
		const targetId = event.target.id;
		const element = document.getElementById(elementToRemove + targetId);
		const response = await fetch(pathToFetch + targetId +"&returnFormat=JSON", {
			method: "POST"
		})
		console.log(response.status);
		const text = await response.text();
		const data = JSON.parse(text);
		console.log(text);
		if (data.status === "success") {
			if (element) {
				element.remove();
				console.log(`Comment with ID: ${targetId} removed from the DOM`);
			} else {
				console.error(`Comment element with ID: ${targetId} not found`);
			}
		} else {
			console.error('Failed to delete comment:', text.message);
		}
		
	}catch (e){
		console.error(e);
	}
}
