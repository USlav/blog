<cfprocessingdirective pageencoding="utf-8">
<!DOCTYPE html>
<html lang="sl"> 
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/index.css">
	<script type="text/javascript" src="js/app.js"></script>
	<script type="text/javascript" src="js/comments.js"></script>
	<script type="text/javascript" src="js/users.js"></script>
	<title>Document</title>
</head>

<body>	
<header>
	<nav id="top-bar">
		<ul class="menu">
			<div class="menu-center"></div>
			<li><a href="index.cfm"> Domov </a></li>
			<li><a href="aboutMe.cfm?aboutMe">O meni</a></li>
			<cfif structKeyExists(url, "aboutMe")>
				<div class="icon-position-aboutMe">
					<div class="semi-circle"></div>
					<div class="icon-aboutMe">
						<img src="img/happy-man-Photoroom.png" alt="happy man" class="happy-man">
					</div>
				</div>
			<cfelseif structKeyExists(url, "blog")>
				<div class="icon-position-blog">
					<div class="icon-blog">
						<img src="img/happy-man-Photoroom.png" alt="happy man" class="happy-man">
					</div>
				</div>
			<cfelse>
					<div class="icon-position">
						<div class="icon">
							<img src="img/happy-man-Photoroom.png" alt="happy man" class="happy-man">
						</div>
					</div>
				</div>
			</cfif>
			<li><a href="blog.cfm?blog">Blog</a></li>
			<cfif NOT structKeyExists(session, "isUserLoggedIn")>
				<li class="prijava"><a href="login.cfm?logIn">Prijava</a></li>
			<cfelse>
				<cfif structKeyExists(session, "user") AND session.user.isAdmin>
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
