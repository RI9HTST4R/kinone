<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>

<style>
	.wrap_page {
		font-size: 0;
		text-align: justify;
		padding-bottom: 20px;
	}
	.pagetitle {
		background-color: green;
	}
	.club-wrapper {
		padding: 5px;
		color: white;
		display: inline-block;
		margin: 10px;
		font-size: 15pt;
		height: 135px;
		width: calc((100% - 6*20px)/6);
		background-color: lightgray;
	}
	.club-wrapper:hover {
		transform: scale(1.1);
		cursor: pointer;
	}
	.cimage {
		width: 100px;
		height: 100px;
	}
</style>

<div class="pagetitle"><span>클럽 정보</span></div>
<c:forEach var="club" items="${clubList}" varStatus="cs">
<div class="club-wrapper" align="center" onClick="location.href='${url}/clubDetail.do?ccode=${club.ccode}'">
	<img class="cimage" src="${url}/resources/emblem/${club.ccode}.png"><br/><span style="font-weight: bold;">${club.cname_short}</span>
</div>
<c:if test="${cs.count%6 == 0}"><br/></c:if>
</c:forEach>

<%@include file="footer.jsp"%>