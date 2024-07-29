<cfprocessingdirective pageencoding="utf-8">
<cfscript>
	qSingleUser = application.authentication.getSingleUser(session.user.userId);
	allUsers = application.authentication.getAllUsers();
</cfscript>
<cfinclude template="front.cfm">
<div class="center">
	<cfif session.user.isAdmin>
		<h1> Profili uporabnikov </h1>
		<table class="user-table">
			<tr>
				<th>username</th>
				<th>email</th>
				<th>creation date</th>
				<th>admin</th>
				<th></th>
			</tr>
			<cfoutput query="allUsers">
				<tr id="user-#allusers.id#" >
					<td>#allusers.username#</td>
					<td>#allUsers.email#</td>
					<td>#dateFormat(allUsers.dateCreated, application.dateMask)#</td>
					<td>#allUsers.isAdmin#</td>
					<td>
						<div class="deleteUser">
							<button class="deleteUser" id="#allUsers.id#">Delete</button> 
						</div>
					</td>
				</tr>
			</cfoutput>
		</table>
	<cfelse>
		<h1> Tvoj profil </h1>
		<table class="user-table">
			<tr>
				<th>username</th>
				<th>password</th>
				<th>email</th>
				<th>creation date</th>
			</tr>
			<cfoutput query="qSingleUser">
				<tr>
					<td>#qSingleUser.username#</td>
					<td>#qSingleUser.password#</td>
					<td>#qSingleUser.email#</td>
					<td>#dateFormat(qSingleUser.dateCreated, application.dateMask)#</td>
				</tr>
			</cfoutput>
		</table>
	</cfif>
</div>
<cfinclude template="footer.cfm">
