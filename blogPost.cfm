<cfinclude template="front.cfm">
<cfscript>
	if(!structKeyExists(url, "postId")){
		location("index.cfm");
	}
	currentDate = now();
	currentPost = url.postId;
	if (structKeyExists(form, "commentSubmit")){
		application.comments.addComment(form.comment, url.postId, currentDate, session.user.userId);
	}
	qCommentsOnPost = application.comments.getCommentsByPostId(url.postId);
	qSinglePost = application.posts.getPostById(url.postId);
</cfscript>
<main>
	<div class="center">
		<h1> Blog! </h1>
		<div class="blog-objava-recent-post">
			<cfoutput query="qSinglePost">
				<div class="small-date">
					<h4>#dateFormat(qSinglePost.datePublished, application.dateMask)#</h4>
				</div>
				<div class="blog-objava-post">
					<h3>#qSinglePost.title#</h3>
				</div>
				
				<span>
					<p>#qSinglePost.description#</p>
				</span>
			</cfoutput>	
		</div>
		<h1> komentarji </h1>
		<cfoutput query="qCommentsOnPost">
			<div class="comment" id="comment-#qCommentsOnPost.id#">
				<p>#qCommentsOnPost.comment#</p>
				
				<div class="small-date">
					<p>Posted by: #qCommentsOnPost.username#</p>
					<h4>#dateFormat(qCommentsOnPost.datePublished, application.dateMask)#</h4>
				</div>
				<div class="deleteComment">
					<button class="deleteButton" id="#qCommentsOnPost.id#">Delete</button> 
				</div>
			</div>
		</cfoutput>
		<cfif structKeyExists(session, "user")>
			<cfoutput>
				<div class="addComment">
					<form id="form_addComment" action="blogPost.cfm?postId=#currentPost#" method="POST">
						<label for="comment">Dodaj komentar:</label><br>
						<textarea name="comment" rows="10" cols="100" required=true></textarea><br>
						<input class="button-style" type="submit" value="Submit" name="commentSubmit">
					</form>
				</div>
			</cfoutput>
		<cfelse>
			<h2 class="action">Log in to post comment</h2>
		</cfif>
	</div>
<cfinclude template="footer.cfm">
