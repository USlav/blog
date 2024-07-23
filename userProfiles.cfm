<cfprocessingdirective pageencoding="utf-8">
<cfinclude template="front.cfm">

<main>
	<div class="center">
		<cfset isAdmin = application.authentication.isUserAdmin(session.userId.id)>
		<cfif isAdmin>
			<cfset allUsers = application.authentication.getAllUsers()>
			
			<h1> Profili uporabnikov </h1>
			<table>
				<tr>
					<th>username</th>
					<th>email</th>
					<th>creation date</th>
					<th>admin</th>
				</tr>
				<cfoutput query="allUsers">
					<tr>
						<td>#username#</td>
						<td>#email#</td>
						<td>#dateFormat(dateCreated, "dd-mm-yyyy")#</td>
						<td>#isAdmin#</td>
					</tr>
				</cfoutput>
			</table>
		<cfelse>
			<cfset singleUser = application.authentication.getSingleUser(session.userId.id)>
			<cfoutput>
				<h1> Tvoj profil </h1>
				<table>
					<tr>
						<th>username</th>
						<th>password</th>
						<th>email</th>
						<th>creation date</th>
					</tr>
					<cfoutput query="singleUser">
						<tr>
							<td>#username#</td>
							<td>#password#</td>
							<td>#email#</td>
							<td>#dateFormat(dateCreated, "dd-mm-yyyy")#</td>
						</tr>
					</cfoutput>
				</table>
			</cfoutput>
		</cfif>
	</div>
</main>
</body>
</html>
