
document.addEventListener('DOMContentLoaded', function () {
	// Attach event delegation to handle clicks on dynamically generated delete buttons
	document.body.addEventListener('click', deleteUser);
});

function deleteUser(event) {
	if (event.target && event.target.classList.contains('deleteUser')) {
		const userId = event.target.id;
		const userElement = document.getElementById(`user-${userId}`);
		fetch('../cfc/authentication.cfc?method=deleteUser&returnFormat=JSON', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({ userId: userId})
		})
			.then(response => {
				if (!response.ok) {
					throw new Error(`HTTP error! status: ${response.status}`);
				}
				return response.text(); // Read the response as text
			})
			.then(text => {
				try {
					// Attempt to parse response text as JSON
					const data = JSON.parse(text);
					console.log('Response data:', data);
					if (data.status === 'success') {
						if (userElement) {
							userElement.remove();
							console.log(`user with ID: ${userId} removed from the DOM`);
						} else {
							console.error(`User element with ID: ${userId} not found`);
						}
					} else {
						console.error('Failed to delete user:', data.message);
					}
				} catch (error) {
					// Log the unexpected response
					console.error('Response is not valid JSON:', text);
					throw error;
				}
			})
			.catch(error => {
				// Log the error with more details
				console.error('Error occurred:', error);
			});
	}
}

