<cfprocessingdirective pageencoding="utf-8">
<cfscript>
	if (structKeyExists(url, "logOut")) {
		application.authentication.logoutUser();
	}
	if (structKeyExists(form, "confirmUser")) {
		session.isUserLoggedIn = application.authentication.authenticateUser(form.username, form.password);
		if (session.isUserLoggedIn) {
			session.user = {};
			session.user.userId = application.authentication.getUserId(form.username, form.password).id;
			session.user.isAdmin = application.authentication.isUserAdmin(session.user.userId);
		}
	}
</cfscript>	
<cfinclude template="front.cfm">
<main>
	<div class="center">
		<cfif structKeyExists(form, "confirmUser") and session.isUserLoggedIn>
			<h2 class="action">User succesfully logged in!</h2>
		<cfelseif structKeyExists(form, "confirmUser") and session.isUserLoggedIn>
			<h2 class="action">Login failed!</h2>
		</cfif>
		<h1> Prijavi se </h1>
		<form action="login.cfm" class="login-form" method="POST">
				<label for="username">Username:</label>
				<input type="text" id="username" name="username" placeholder="Enter your Username" required>
				<label for="password">Password:</label>
				<input type="password"id="password" name="password" placeholder="Enter your Password" required>
				<input type="submit" name="confirmUser" value="Potrdi">		
		</form>
		<p><a href="register.cfm">Še nimaš računa? Registriraj se!</a></p>
	</div>
<cfinclude template="footer.cfm">	
