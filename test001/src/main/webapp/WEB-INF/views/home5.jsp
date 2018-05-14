<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<title>Home</title>
</head>
<style>
body > .container {
  padding: 60px 15px 0;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$(".btn").on("click", function(){
		$("#addFrm").submit();
	});
});
</script>
<body>
	<header>
		<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
			<span class="navbar-text"> Navbar text with an inline element</span>
			<button class="btn">submit</button>
		</nav>
	</header>
	<main role="main" class="container">
	<form id="addFrm" action="<c:url value='/method02'/>" method="post"
		enctype="multipart/form-data">
		<div class="input-group">
			<textarea class="form-control" style="height: 500px;" name="contents"></textarea>
		</div>
		<input type="file" multiple="multiple" name="files"> <input
			type="hidden" name="userId" value="kmw">
	</form>
	<div id="carouselExampleControls" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100"
					src=".../800x400?auto=yes&bg=777&fg=555&text=First slide"
					alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src=".../800x400?auto=yes&bg=666&fg=444&text=Second slide"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src=".../800x400?auto=yes&bg=555&fg=333&text=Third slide"
					alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleControls"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleControls"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	</main>
</body>
</html>
