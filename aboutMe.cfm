<cfprocessingdirective pageencoding="utf-8">
<cfinclude template="front.cfm">
<main>
	
	<div class="center">
		<h1> O meni! </h1>
		<div class="container">
			<p>Nekaj na kratko o meni .... Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
			<p>Nekaj na kratko o meni .... Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		</div>
		<h2> Pišem tudi blog! </h2>

		<!---renderPosts--->
		<cfset  recentPosts = application.posts.renderRecentPosts(3)>

		<div class="recent-posts">
			<cfoutput query="recentPosts">
				<div class="recent-post">
					<div class="post">
						<h3 class="post-title"><a href="blogPost.cfm?postId=#id#">#title#</a></h3>
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
