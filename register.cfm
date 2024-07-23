<cfprocessingdirective pageencoding="utf-8">
<cfinclude template="front.cfm">
<cfscript>
	if(structKeyExists(form, "registerUser")){
		userExists = application.authentication.checkIfUserExists(form.username, form.password, form.email);
		if (!userExists){
			application.authentication.addUser(form.username, form.password, form.email);
		}	
	}
</cfscript>
<main>
	<div class="center">
		<cfif structKeyExists(form, "registerUser")>
			<cfif  NOT userExists>
				<cfoutput>
					<h2 class='action'>Uspešna registracija prijavite se!</h2>
				</cfoutput>		
			<cfelseif userExists>
				<cfoutput>
					<h2 class='action'>Uporabnik že obstaja!</h2>
				</cfoutput>
			</cfif>
		</cfif>
		<h3>Registriraj se:</h3>
		<form action="register.cfm" class="login-form" method="POST">
				<label for="username">Username:</label>
				<input type="text" id="username" name="username" placeholder="Enter a Username" required>
				<label for="password">Password:</label>
				<input type="password"id="password" name="password" placeholder="Enter a Password" required>
				<label for="email">Email:</label>
				<input type="email"id="email" name="email" placeholder="Enter an Email" required>
				<input type="submit" name="registerUser" value="Registriraj me!">		
		</form>
	</div>
</main>
</body>
</html>
