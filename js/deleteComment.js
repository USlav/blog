
document.addEventListener('DOMContentLoaded', function() {
    // Function to handle comment deletion
    function deleteComment(event) {
        if (event.target && event.target.classList.contains('deleteButton')) {
            const commentId = event.target.id;
            const commentElement = document.getElementById(`comment-${commentId}`);
            
            console.log(`Attempting to delete comment with ID: ${commentId}`);

            fetch('../cfc/comments.cfc?method=deleteComment&returnFormat=JSON', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ commentId: commentId })
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
                        if (commentElement) {
                            commentElement.remove();
                            console.log(`Comment with ID: ${commentId} removed from the DOM`);
                        } else {
                            console.error(`Comment element with ID: ${commentId} not found`);
                        }
                    } else {
                        console.error('Failed to delete comment:', data.message);
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

    // Attach event delegation to handle clicks on dynamically generated delete buttons
    document.body.addEventListener('click', deleteComment);
});

