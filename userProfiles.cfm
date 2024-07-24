<cfprocessingdirective pageencoding="utf-8">
<cfinclude template="front.cfm">

	<div class="center">
		<cfif session.isAdmin>
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
			<cfset singleUser = application.authentication.getSingleUser(session.userId.id)>

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
							<td>#dateFormat(dateCreated, application.dateMask)#</td>
						</tr>
					</cfoutput>
				</table>
		</cfif>
	</div>
<cfinclude template="footer.cfm">
