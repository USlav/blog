
<cfinclude template="front.cfm">

<cfif structKeyExists(form, 'blogUpdate')>
	<cfif form.datePublished EQ ''>
		<cfset form.datePublished = now() />
	</cfif>
	
	<cfset application.posts.updatePost(form.title,form.datePublished,form.description, url.updateId) />
	<cflocation url="blog.cfm" />
</cfif>	

<cfset postToUpdate = application.posts.getPostById(url.updateId)>

<main>
	<h1>&lt Uredi blog! /&gt</h1>
	<div class="center">
		<cfoutput query="postToUpdate">
			<form id="form_updateBlog" action="update.cfm?updateId=#id#" method="POST">
				<label for="title">Blog title:</label><br>
				<input type="text" id="title" name="title" value="#title#"><br>
				<label for="datePublished">Publish date:</label><br>
				<input type="date" id="datePublished" name="datePublished" value="#dateFormat(datePublished, 'dd.mm.yyyy')#"><br>
				<label for="description">Blog content::</label><br>
				<textarea id="description" name="description" rows="25" cols="100" >#description#</textarea><br>
				<input type="submit" value="Update" name="blogUpdate">
			</form>
		</cfoutput>
	</div>
</main>
</body>
</html>
