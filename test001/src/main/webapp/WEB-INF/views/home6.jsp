<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- <link rel="stylesheet" href="https://naver.github.io/egjs-infinitegrid/assets/css/table1.css" type="text/css"/> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- <script src="./resources/jquery-1.11.0.min.js"></script> -->
<script src="./resources/grid.locale-kr.js"></script>
<script src="./resources/jquery.jqGrid.min.js"></script>
<!-- <link rel="stylesheet" href="./resources/ui.jqgrid.css" type="text/css"/> -->
<!-- <link rel="stylesheet" href="./resources/jquery-ui.min.css" type="text/css"/> -->
<!-- <script src="https://naver.github.io/egjs-infinitegrid/common/js/codepen.js"></script> -->
<title>Home</title>
</head>
<style>
body > .container {
  padding: 60px 15px 0;
}
</style>
<script type="text/javascript">
// $(document).ready(function(){
// 	$("#jqGrid").jqGrid({
//         url: './method06',
//         mtype: "GET",
//         datatype: "json",
//         colModel: [
//             { label: '게시판넘버', name: 'BOARD_NUM', key: true, width: 75 },
//             { label: '유저아이디', name: 'USER_ID', width: 150 },
//             { label: 'Order Date', name: 'OrderDate', width: 150, formatter : 'date', formatoptions: { srcformat : 'Y-m-d H:i:s', newformat :'ShortDate'}},
//             { label: 'Freight', name: 'Freight', width: 150 },
//             { label:'Ship Name', name: 'ShipName', width: 150 }
//         ],
// 		viewrecords: true,
//         width: 780,
//         height: 250,
//         rowNum: 20,
//         pager: "#jqGridPager"
//     });
	
// });
</script>
<body>
<div>
<table id="jqGrid"></table>
</div>
    
</body>

<script type="text/javascript">
$(document).ready(function(){
	$("#jqGrid").jqGrid({
        url: './method06',
        mtype: "GET",
        datatype: "json",
        colModel: [
            { label: '게시판넘버', name: 'BOARD_NUM', key: true, width: 75 },
            { label: '유저아이디', name: 'USER_ID', width: 150 },
            { label: 'Freight', name: 'Freight', width: 150 },
            { label:'Ship Name', name: 'ShipName', width: 150 }
        ],
		viewrecords: true,
        width: 780,
        height: 250,
        rowNum: 20,
        pager: "#jqGridPager"
    });
	
});
</script>
</html>
