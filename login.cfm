<cfif structKeyExists(url, "logOut")>
	<cfset application.authentication.logoutUser()>
</cfif>

<cfinclude template="front.cfm">
<main>
	<div class="center">
		<cfif structKeyExists(form, 'confirmUser')>
			<cfset session.isUserLoggedIn = application.authentication.authenticateUser(form.username, form.password)>
			<cfset session.userId = application.authentication.getUserId(form.username, form.password)>
			<cfif session.isUserLoggedIn EQ true>
				<cfoutput>
					<h2 class="action">User succesfully logged in!</h2>
				</cfoutput>
			<cfelse>
				<cfoutput>
					<h2 class="action">Login failed!</h2>
				</cfoutput>
			</cfif>
		<cfelse>
			<cfoutput>
				<h3>Prijavi se:</h3>
				<form action="login.cfm" class="login-form" method="POST">
						<label for="username">Username:</label>
						<input type="text" id="username" name="username" placeholder="Enter your Username" required>
						<label for="password">Password:</label>
						<input type="password"id="password" name="password" placeholder="Enter your Password" required>
						<input type="submit" name="confirmUser" value="Potrdi">		
				</form>
			</cfoutput>
		</cfif>	
		
	</div>
</main>
</body>
</html>
