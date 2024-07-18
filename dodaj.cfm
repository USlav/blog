<cfinclude template="front.cfm">

<main>
	<h1>&lt Dodaj blog! /&gt</h1>
	<div class="center">
		<form id="form_addBlog" action="blog.cfm" method="POST">
			<label for="title">Blog title:</label><br>
			<input type="text" id="title" name="title" required="true"><br>
			<label for="datePublished">Publish date:</label><br>
			<input type="date" id="datePublished" name="datePublished"><br>
			<label for="description">Blog content::</label><br>
			<textarea id="description" name="description" rows="25" cols="100"></textarea><br>
			<input type="submit" value="Submit" name="blogSubmit">
		</form>
	</div>
</main>
</body>
</html>
