<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="url" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인페이지로 이동중입니다.</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(window).load(function() {
	//	location.href = "main.do";
	//	location.href = "admin/main.do";
		location.href = "admin/club_view.do";
	//	location.href = "admin/plist.do";

	});	
</script>
<style>
#loading {
	width: 100%;  
	height: 100%;  
	top: 0px;
	left: 0px;
	position: fixed;  
	display: block;  
	opacity: 0.7;  
	background-color: #fff;  
	z-index: 99;  
	text-align: center; 
} 
  
#loading-image {  
	position: absolute;  
	top: 45%;  
	left: 47%; 
	z-index: 100;
}
h1 {
	position: absolute;
	top: 55%;
	left: 38%;
	z-index: 100;
}
</style>
</head>
<body>
<div id="loading">
	<img id="loading-image" src="${url}/resources/images/loading.gif" title="Loading..." />
	<h1>메인페이지로 이동중입니다.<br/>잠시만 기다려 주세요!</h1>
</div>
</body>

</html>