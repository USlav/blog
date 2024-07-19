<cfinclude template="front.cfm">
<cfset  currentDate = now() >
<cfset  currentPost = url.postId>
<cfif structKeyExists(form, 'commentSubmit')>
	<cfset application.comments.addComment(form.comment, url.postId, currentDate) />
</cfif>	

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
		<cfset renderedComments = application.comments.renderCommentsByPostId(url.postId)>
		<h1 class="comment-title">&lt komentarji /&gt</h1>
		<cfoutput query="renderedComments">
			<div class="comment">
				<p>#comment#</p>
				<div class="deleteComment">
					Delete
				</div>
			</div>
		</cfoutput>
		
		<cfoutput>
			<div class="addComment">
				<form id="form_addComment" action="objavaBlog.cfm?postId=#currentPost#" method="POST">
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
