<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
.pagetitle {
	background-color: lightgray;
}
/* Add padding to containers */
.board-wrapper {
	padding: 16px;
	background-color: white;
	text-align: justify;
	width: 100%;
}
#board-title {
	position: relative;
	margin-bottom: 40px;
}
hr {
	margin-top: 2rem;
	margin-bottom: 2rem;
}
/* Set a style for the submit button */
.registerbtn {
	background-color: #4CAF50;
	color: white;
	padding: 16px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}
.registerbtn:hover {
	opacity: 1;
}
</style>
<div class="pagetitle">
	<span>K리그 소식</span>
</div>
<div class="board-wrapper">
	<div id="board-title">
		<span style="font-size: 25pt;">${bcont.subject}</span><br/><br/>
		<span style="font-size:12pt; font-style: italic; position: absolute; left: 0px;"><fmt:formatDate value="${bcont.regidate}" pattern="yyyy.MM.dd HH:mm"/></span>
		<span style="font-size:12pt; font-style: italic; position: absolute; right: 0px;">조회수: ${bcont.readcount}</span>
	</div>
	<hr>
	<div id="content" align="justify">
		<div align="center" style="width: 100%;">
			<img src="${url}/resources/board_upload/${bcont.image}" width="80%" height="500px"/>
		</div>
		<br><br/>
		${bcont.content}
	</div>
	<div id="board-footer" align="right">
		<span style="font-size: 12pt; font-style: italic;">written by admin</span>
	</div>
	<hr>
	<button type="button" class="registerbtn"
		onclick="location.href='kleagueNews.do?page=${page}'">게시판 목록</button>
</div>
<%@ include file="footer.jsp"%>