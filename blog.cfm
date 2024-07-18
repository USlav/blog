

<cfif structKeyExists(form, 'blogSubmit')>
	<cfif form.datePublished EQ ''>
		<cfset form.datePublished = now() />
	</cfif>
	
	<cfset application.posts.addPost(form.title,form.datePublished,form.description) />
	<cflocation url="blog.cfm" />
</cfif>	

<cfinclude template="front.cfm">

<cfif structKeyExists(url, 'deleteId')>
	<cfif url.deleteId NEQ 0>
		<cfset application.posts.deletePostbyId(url.deleteId) >
		<cflocation url="blog.cfm">
	<cfelse>
		<cfoutput>
			<h2 class="action">Select blog to delete!!</h2>
		</cfoutput>
	</cfif>
</cfif>

<cfif structKeyExists(url, 'updateId')>
	<cfif url.updateId NEQ 0>
		<cfset application.posts.addPostbyId(url.updateId) >
		<cflocation url="blog.cfm">
	<cfelse>
		<cfoutput>
			<h2 class="action">Select blog to update!!</h2>
		</cfoutput>
	</cfif>
	
</cfif>


<main>
	<h1>&lt Blog! /&gt</h1>
	<div class="center">

		<nav class="option-menu">
			<div class="option">
				<h3><a href="dodaj.cfm">Dodaj</a></h3>
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
						<cfif structKeyExists(url, 'deleteId')>
								<h3><a href="blog.cfm?deleteId=#id#">#title#</a></h3>							
						<cfelseif structKeyExists(url,'updateId')>
								<h3><a href="update.cfm?updateId=#id#">#title#</a></h3>
						<cfelse>							
								<h3><a href="objavaBlog.cfm?postId=#id#">#title#</a></h3>							
						</cfif>
						
					</div>
					
					<div class="small-date">
						<h4>#dateFormat(datePublished, 'dd.mm.yyyy')#</h4>
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
