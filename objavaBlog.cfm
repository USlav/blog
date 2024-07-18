<cfinclude template="front.cfm">
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
	</div>
</main>
</body>
</html>
