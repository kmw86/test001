<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://naver.github.io/egjs-infinitegrid/assets/css/table1.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://naver.github.io/egjs-persist/release/latest/dist/persist.min.js"></script>
<script src="https://naver.github.io/egjs-infinitegrid/release/latest/dist/infinitegrid.pkgd.min.js"></script>
<!-- <script src="https://naver.github.io/egjs-infinitegrid/common/js/codepen.js"></script> -->
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

			});
        }
    });
	
});
</script>
<body>
<div id="table" codepen="table1">
	<div class="header">
		<span class="opts"></span>
		<span class="no">No</span>
		<span class="date">Date</span>
		<span class="writer">Writer</span>
		<span class="title">Title</span>
	</div>
<div class="container">
</div>
</body>
<script type="text/javascript">
var template = '<div class="post"><span class="opts"></span><span class="no">@{no}</span><span class="date">@{date}</span><span class="writer">@{writer}</span><span class="title"><a href="http://m.naver.com">@{title}</a></span></div>';
//var link = window.HOMELINK;
function getItem(template, options) {
	return template.replace(/\@\{([^\}]*)\}/g, function () {
		var replaceTarget = arguments[1];

		return options[replaceTarget];
	});
}
function getItems01(){
	const arr = [];
$.ajax({
    type : "GET",
    url : "<c:url value='/method01'/>",
    dataType : "json",
    async: false,
    error : function(){
        alert('통신실패!!');
    },
    success : function(data){
        console.log(data);
        $.each(data,function(idx,item){
        	var template='<div class="post"><span class="opts"></span><span class="no">';
        	template+=item.gb_user;
        	template+='</span><span class="date">';
        	template+=item.gb_user;
        	template+='</span><span class="writer">';
        	template+=item.gb_user;
        	template+='</span><span class="title"><a href="http://m.naver.com">';
        	template+=item.gb_user;
        	template+='</a></span></div>';
        	arr.push(template);
		});
    }
});
return arr;
}
function getItems(no, length) {
	const arr = [];

	for (let i = 0; i < length; ++i) {
		arr.push(getItem(template, {
			no: no + i + 1,
			title: "egjs post" + (no + i + 1),
			date: "10.30 16:28",
			writer: "egjs"
		}));
	}

	return arr;
}
var container = document.querySelector(".container");
var ig = new eg.InfiniteGrid(container);

var persist = new eg.Persist("table");
var num = 40;

ig.setLayout(eg.InfiniteGrid.GridLayout);
// ig.setLayout(eg.InfiniteGrid.GridLayout, {
//     margin: 10,
//     align: "start",
//     itemSize: 200
// });
// ig.on({
// 	"append": function (e) {
// 		var groupKey = e.groupKey + 1;

// 		ig.append(getItems01(groupKey * num, num), groupKey);
// 	}
// });

// var tempStatus = persist.get("status");

// if (tempStatus) {
// 	ig.setStatus(tempStatus, true);
// } else {
	ig.append(getItems01(0, num),0);
// }

// container.addEventListener("click", function(e) {
// 	if (e.target.tagName !== "A") {
// 		return;
// 	}
// 	const status = ig.getStatus();

// 	persist.set("status", status);
// });
</script>
</html>
