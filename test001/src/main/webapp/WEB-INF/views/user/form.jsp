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
		alert("dfsf");
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
	<form id="addFrm" action="<c:url value='/card/regist'/>" method="post" enctype="multipart/form-data">
		<div class="input-group">
			<textarea class="form-control" style="height: 250px; " name="contents"></textarea>
		</div>
		<input type="file" multiple="multiple" name="files">
		<input type="hidden" name="userId" value="kmw">
	</form>
	</main>
</body>
</html>
