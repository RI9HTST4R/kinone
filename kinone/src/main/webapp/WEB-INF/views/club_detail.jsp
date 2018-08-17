<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>

<style>
.pagetitle {
	background-color: lightgray;
}
#cont-container {
	border: 1px solid red;
}
#stadium-map {
	border: 1px solid blue;
}
</style>

<div class="pagetitle"><img src="${url}/resources/emblem/${club.ccode}.png" width="130px" height="130px"/> <span>${club.cname}</span></div>

<div id="cont-container">
<div id="intro">
구단소개등등 여러
</div>
<div id="stadium-map" style="display: inline-block;">
지도
</div>
<div style="display: inline-block;">
<div id="pschedule">전경기</div>
<div id="nschedule">다음경기</div>
<div id="rank">클럽순위</div>
</div>
<div>
선수순위
</div>

</div>

<%@include file="footer.jsp"%>