<cfprocessingdirective pageencoding="utf-8">
<cfinclude template="front.cfm">
<cfscript>
	if (structKeyExists(form, "blogSubmit")){
		if (form.datePublished == ""){
			form.datePublished = now();
		}
		
		application.posts.addPost(form.title,form.datePublished,form.description, session.user.userId);
		location("blog.cfm");
	}

	if (structKeyExists(url, "deleteId")){
		if(url.deleteId != 0){
			application.posts.deletePostbyId(url.deleteId);
			location("blog.cfm");
		}
	}

	if (structKeyExists(url, "updateId")){
		if (url.updateId != 0){
			application.posts.addPostbyId(url.updateId);
			location("blog.cfm");
		}	
	}
</cfscript>
	<div class="center">
		<cfif structKeyExists(url, "deleteId")>
			<cfif url.deleteId eq 0>
				<cfoutput>
					<h2 class="action">Select blog to delete!!</h2>
				</cfoutput>
			</cfif>
		<cfelseif structKeyExists(url, "updateId")>
			<cfif url.updateId eq 0>
				<cfoutput><h2 class="action">Select blog to update!!</h2></cfoutput>
			</cfif>
		</cfif>
		<h1> Blog! </h1>
		<cfif structKeyExists(session, "isUserLoggedIn")>
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
		</cfif>	
		<cfset  qPosts = application.posts.getPosts()>

		<div class="blog-recent-posts">
			<cfoutput query="qPosts">
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
						<h4>#dateFormat(datePublished, application.dateMask)#</h4>
					</div>
					<span>
						<p>#description#</p>
					</span>
				</div>
			</cfoutput>
		</div>
	</div>
<cfinclude template="footer.cfm">
