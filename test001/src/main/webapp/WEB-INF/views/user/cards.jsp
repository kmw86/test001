<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
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
	$.ajax({
        type : "GET",
        url : "<c:url value='/method01'/>",
        dataType : "json",
        error : function(){
            alert('통신실패!!');
        },
        success : function(data){
            console.log(data);
            $.each(data,function(idx,item){
            	var card=$("<div class='card'/>");
            	var cardHeader=$("<div class='card-header'/>");
            	var cardBody=$("<div class='card-body'/>");
            	var userImg=$("<img class='rounded-circle' style='width: 25px;height: 25px;'/>");
            	userImg.attr("src","http://mblogthumb1.phinf.naver.net/20150417_264/ninevincent_14291992723052lDb3_JPEG/kakao_11.jpg?type=w2");
//             	var carousel=$("<div id='carouselExampleControls' class='carousel slide' data-ride='carousel'/>");
//             	var carouselInner=$("<div class='carousel-inner'/>");
//             	carousel.append(carouselInner);
//             	var p;
//             	for (var i = 0; i < item.PHOTO_TOTAL_COUNT; i++) { 
//             	 	p +='<div class="carousel-item '+(i==0? "active":"")+'">';
// 					p +='<img class="d-block w-100"';
// 					p +="src=./method03?boardNum="+item.BOARD_NUM+"&photoCount="+i+" style='height: 100px; width:100px; '";
// 					p +=" /> </div>"
//             	}
//             	p+='<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a> <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span> </a>';
//             	carouselInner.append(p);
            	cardHeader.append(userImg);
            	cardHeader.append(item.USER_ID);
            	cardBody.append(item.CONTENTS);
//             	cardBody.append(carousel);
            	card.append(cardHeader);
            	card.append(cardBody);
            	card.data("boardNum",item.BOARD_NUM);
            	$("#cardList").append(card);
			});
        }
    });
	
	
	$(document).on("click",".card",function(){
// 		alert($(this).data("boardNum"));
		location.href="./card?boardNum="+$(this).data("boardNum");
	});
});
</script>
<body>
<header>
<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
<div class="collapse navbar-collapse" id="navbarSupportedContent">
 <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">소식 <span class="sr-only">(current)</span></a>
      </li>
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link" href="#">앨범</a> -->
<!--       </li> -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link" href="#">일정</a> -->
<!--       </li>  -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link" href="#">멤버</a> -->
<!--       </li> -->
<!--       <li class="nav-item dropdown"> -->
<!--         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!--           Dropdown -->
<!--         </a> -->
<!--         <div class="dropdown-menu" aria-labelledby="navbarDropdown"> -->
<!--           <a class="dropdown-item" href="#">Action</a> -->
<!--           <a class="dropdown-item" href="#">Another action</a> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <a class="dropdown-item" href="#">Something else here</a> -->
<!--         </div> -->
<!--       </li> -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link disabled" href="#">Disabled</a> -->
<!--       </li> -->
    </ul>
    </div>
</nav>
</header>
<main role="main" class="container">
       <div id ="cardList"></div>
</main>
<div class="fixed-bottom"><a class="btn btn-primary" href="<c:url value='/cardform'/>" role="button">글작성</a></div>
</body>
<div class="card" style="display:none;">
	<div class="card-header">
	<img src="http://mblogthumb1.phinf.naver.net/20150417_264/ninevincent_14291992723052lDb3_JPEG/kakao_11.jpg?type=w2" alt="..." class="rounded-circle" style="width: 75px;height: 75px;">
	    Featured
	</div>
	<div class="card-body">
	    This is some text within a card body.<br>
	    This is some text within a card body.<br>
	    This is some text within a card body.<br>
	    This is some text within a card body.<br>
	    This is some text within a card body.<br>
	    This is some text within a card body.<br>
	    This is some text within a card body.<br>
	    This is some text within a card body.<br>
	    This is some text within a card body.<br>
	    This is some text within a card body.<br>
	</div>
</div>
</html>
