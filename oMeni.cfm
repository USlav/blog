<cfinclude template="front.cfm">
<main>
	<h1>&lt O meni! /&gt</h1>
	<div class="center">
		<div class="container">
			<p>Nekaj na kratko o meni .... Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
			<p>Nekaj na kratko o meni .... Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		</div>
		<h2>&lt Pišem tudi blog! /&gt</h2>

		<!---renderPosts--->
		<cfset  recentPosts = application.posts.renderRecentPosts()>

		<div class="recent-posts">
			<cfoutput query="recentPosts">
				<div class="recent-post">
					<div class="post">
						<h3 class="post-title"><a href="objavaBlog.cfm?postId=#id#">#title#</a></h3>
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
