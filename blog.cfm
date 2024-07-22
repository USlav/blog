<cfinclude template="front.cfm">
<cfscript>
	if (structKeyExists(form, "blogSubmit")){
		if (form.datePublished == ""){
			form.datePublished = now();
		}
		application.posts.addPost(form.title,form.datePublished,form.description);
		location("blog.cfm");
	}

	if (structKeyExists(url, "deleteId")){
		if(url.deleteId != 0){
			application.posts.deletePostbyId(url.deleteId);
			location("blog.cfm");
		}else{
			writeOutput("<h2 class='action'>Select blog to delete!!</h2>", "html");
		}
	}

	if (structKeyExists(url, "updateId")){
		if (url.updateId != 0){
			application.posts.addPostbyId(url.updateId);
			location("blog.cfm");
		}else{
			writeOutput("<h2 class='action'>Select blog to update!!</h2>", "html");
		}	
	}
</cfscript>

<main>
	<h1>&lt Blog! /&gt</h1>
	<div class="center">

		<nav class="option-menu">
			<div class="option">
				<h3><a href="addBlog.cfm">Dodaj</a></h3>
			</div>
			<div class="option">
				<h3><a href="blog.cfm?deleteId=0">Izbriši</a></h3>
			</div>
			<div class="option">
				<h3><a href="blog.cfm?updateId=0">Uredi</a></h3>
			</div>
		</nav>

		<cfset  recentPosts = application.posts.renderRecentPosts()>

		<div class="blog-recent-posts">
			<cfoutput query="recentPosts">
				<div class="blog-recent-post"><a href="blog.cfm?deleteId=#id#">
					<div class="blog-post">
						<cfif structKeyExists(url, "deleteId")>
								<h3><a href="blog.cfm?deleteId=#id#">#title#</a></h3>							
						<cfelseif structKeyExists(url,"updateId")>
								<h3><a href="update.cfm?updateId=#id#">#title#</a></h3>
						<cfelse>							
								<h3><a href="blogPost.cfm?postId=#id#">#title#</a></h3>							
						</cfif>
					</div>
					
					<div class="small-date">
						<h4>#dateFormat(datePublished, "dd.mm.yyyy")#</h4>
					</div>
					<span>
						<p>#description#</p>
					</span>
				</div>
			</cfoutput>
		</div>
	</div>
</main>
</body>
</html>
