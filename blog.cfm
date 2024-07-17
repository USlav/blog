<cfinclude template="cfc/posts.cfc">
<cf_front>
<main>
	<h1>&lt Blog! /&gt</h1>
	<div class="center">
		
		<cfset  recentPosts = renderRecentPosts()>

		<div class="blog-recent-posts">
			<cfoutput query="recentPosts">
				<div class="blog-recent-post">
					<div class="blog-post">
						<h3><a href="objavaBlog.cfm?postID=#id#">#title#</a></h3>
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
