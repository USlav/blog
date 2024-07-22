<cfinclude template="front.cfm">
<cfscript>
	if(!structKeyExists(url, "postId")){
		location("index.cfm");
	}
	currentDate = now();
	currentPost = url.postId;
	if (structKeyExists(form, 'commentSubmit')){
		application.comments.addComment(form.comment, url.postId, currentDate);
	}
	renderedComments = application.comments.getCommentsByPostId(url.postId);
</cfscript>
<main>
	<h1>&lt Blog! /&gt</h1>

	<div class="center">
		<cfset singlePost = application.posts.getPostById(url.postId)>		
		<div class="blog-objava-recent-post">
			<cfoutput query="singlePost">
				<div class="small-date">
					<h4>#dateFormat(datePublished, 'dd.mm.yyyy')#</h4>
				</div>
				<div class="blog-objava-post">
					<h3>#title#</h3>
				</div>
				
				<span>
					<p>#description#</p>
				</span>
			</cfoutput>	
		</div>
		<h1 class="comment-title">&lt komentarji /&gt</h1>
		<cfoutput query="renderedComments">
			<div class="comment" id="comment-#id#">
				<p>#comment#</p>
				<div class="deleteComment">
					<button class="deleteButton" id="#id#">Delete</button> 
				</div>
			</div>
		</cfoutput>
		
		<cfoutput>
			<div class="addComment">
				<form id="form_addComment" action="blogPost.cfm?postId=#currentPost#" method="POST">
					<label for="comment">Dodaj komentar:</label><br>
					<textarea name="comment" rows="10" cols="100" ></textarea><br>
					<input type="submit" value="Submit" name="commentSubmit">
				</form>
			</div>
		</cfoutput>
	</div>
</main>
</body>
</html>
