<cfinclude template="front.cfm">

<main>
	<div class="center">
		<cfif structKeyExists(form, 'confirmUser')>
			<cfdump var="#form.username#" label="form">
			<cfset  isUserLoggedIn = application.authentication.authenticateUser(form.username, form.password) >
			<cfif isUserLoggedIn EQ true>
				<cfoutput>
					<h2 class="action">User succesfully logged in!</h2>
				</cfoutput>
			<cfelse>
				<cfoutput>
					<h2 class="action">Login failed!</h2>
					<button href="login.cfm">RETRY</button>
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
