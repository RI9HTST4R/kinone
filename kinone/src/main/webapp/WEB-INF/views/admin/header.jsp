<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="url" value="<%=request.getContextPath()%>"/>
<c:set var="cpage" value="<%= request.getServletPath().substring(request.getServletPath().lastIndexOf('/')+1, request.getServletPath().indexOf('.'))  %>" />
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
body {
	line-height: normal;
}

.row.content {
	height: 100%;
}

.top {
	height: 120px;
	background: #d8d8d8;
}

#pagetitle {
	line-height: 120px;
	margin: 0px;
	color: white;
	font-weight: bold;
}
/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
	padding-top: 30px;
	width: 250px;
	display: inline-block;
}
.sidemenu {
	border-bottom: 1px solid navy;
	line-height: 40px;
}
/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

.col-sm-9 {
	padding: 25px 0px 0px 25px;
}

.container {
	display: block;
	padding: 0;
	margin: 0;
}

h1#title {
	margin-top: 0px;
}
</style>

</head>
<script>
	$(function(){
		var cs9top = $(".col-sm-9").offset().top;
		var wftop = $(".wrap_footer").offset().top;
		alert(cs9top);
		alert(wftop);
		$(".col-sm-3").css("min-height",wftop-cs9top);
	});
</script>
<body>
	<div id="mask"></div>
	<div class="container-fluid">
		<div class="row content">
			<div class="top" align="center">
				<h1 id="pagetitle">관리자 페이지</h1>
			</div>
			<div class="col-sm-3 sidenav">
				<ul class="nav nav-pills nav-stacked">
					<li><h4 class="sidemenu">메인</h4></li>
					<li <c:if test='${fn:contains(cpage, "main")}'>class="active"</c:if>><a href="/kinone/admin/main.do">시즌</a></li>
					<li><a href="/kinone/main.do">메인 홈페이지 이동</a></li>
					<li><h4 class="sidemenu">클럽</h4></li>
					<li <c:if test='${fn:contains(cpage, "club_view")}'>class="active"</c:if>><a href="/kinone/admin/club_view.do">클럽 리스트</a></li>
					<li <c:if test='${fn:contains(cpage, "club_create")}'>class="active"</c:if>><a href="/kinone/admin/create_club.do">클럽 등록</a></li>
					<li><a href="/kinone/admin/clubIntro.do">클럽 소개글 등록</a></li>
					<li><h4 class="sidemenu">선수</h4></li>
					<li <c:if test='${fn:contains(cpage, "player_list")}'>class="active"</c:if>><a href="/kinone/admin/plist.do">선수 리스트</a></li>
					<li <c:if test='${fn:contains(cpage, "player_Form")}'>class="active"</c:if>><a href="/kinone/admin/pinsertForm1.do">선수 등록</a></li>
					<li><h4 class="sidemenu">매치</h4></li>
					<li <c:if test='${fn:contains(cpage, "match_List")}'>class="active"</c:if>><a href="/kinone/admin/matchList.do">매치 리스트</a></li>
					<li <c:if test='${fn:contains(cpage, "match_Form")}'>class="active"</c:if>><a href="/kinone/admin/matchForm.do">매치 등록</a></li>
					<li><h4 class="sidemenu">게시판</h4></li>
					<li <c:if test='${fn:contains(cpage, "board_List")}'>class="active"</c:if>><a href="/kinone/admin/boardList.do">글 목록</a></li>
					<li <c:if test='${fn:contains(cpage, "board_write")}'>class="active"</c:if>><a href="/kinone/admin/boardwrite.do">글 작성</a></li>
				</ul>
			</div>
			<div class="col-sm-9">