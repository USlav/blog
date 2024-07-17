
<cfscript>
	
	component displayname="posts" output="true"{
		function getPost(urk){
			
		}
		function renderRecentPosts(){
			var = queryExecute(
				"SELECT title, description, datePublished, id FROM post
				ORDER BY datePublished DESC"
				,{},
				{ datasource="blog" }
			);
			return var;
		}
	}
</cfscript>

