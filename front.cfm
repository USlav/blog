<cfprocessingdirective pageencoding="utf-8">
<!DOCTYPE html>
<html lang="sl"> 
<head>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/index.css">
	<script type="text/javascript" src="js/comments.js"></script>
	<title>Document</title>
</head>

<body>	
<header>
	<nav id="top-bar">
		<ul class="menu">
			<li class="bold-menu"><a href="index.cfm"> Domov </a></li>
			<li><a href="aboutMe.cfm">O meni</a></li>
			<li><a href="blog.cfm">Blog</a></li>
			<cfif NOT structKeyExists(session, "isUserLoggedIn")>
				<li class="prijava"><a href="login.cfm?logIn">Prijava</a></li>
			<cfelse>
				<cfif structKeyExists(session, "isAdmin") AND session.isAdmin>
					<li class="userProfiles"><a href="userProfiles.cfm">Profili</a></li>
				<cfelse>
					<li class="userProfiles"><a href="userProfiles.cfm">Tvoj profil</a></li>
				</cfif>
				<li class="prijava"><a href="login.cfm?logOut">Odjava</a></li>
			</cfif>
		</ul>
	</nav>		
</header>
<main>
