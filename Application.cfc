<cfcomponent output="false" >
	<cfset  this.name = 'blog' >
	<cfset this.applicationTimeout = createTimespan(0,2,0,0)/>
	<cfset this.datasource = 'blog'/>
	<cfset this.sessionManagement = true/>
	<cfset this.setClientCookies = true >
	<cfset this.sessionTimeout = createTimespan(0,0,30,0)/>
	<!--- on application start method--->
	<cffunction name="onApplicationStart" returntype="boolean">
		<cfset application.posts = createObject("component", 'cfc.posts')/>
		
		
		<cfreturn true />
	</cffunction>
	<!---onRequestStart() method --->
	<cffunction name="onRequestStart" returntype="boolean">
		<cfargument name="targetPage" type="string" required="true">
		<cfif isDefined('url.restartApp')>
			<cfset this.onApplicationStart() >
		</cfif>

		<!---<cfif listFind(arguments.targetPage,'admin', '/') AND (NOT structKeyExists(session,'stLoggedInUser') )><!---OR NOT session.stLoggedInUser.userRole EQ 'Administrator'--->
			<cflocation url="/cfTraining/index.cfm?noaccess" />
			
		</cfif>--->
		
		<cfreturn true/>
	</cffunction>
</cfcomponent>
