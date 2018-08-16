<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>
.pagetitle {
	background-color: navy;
	position: relative;
}
.page-content {
	/* border: 1px solid red; */
	height: auto;
	width: 100%;
	padding-bottom: 20px;
	overflow: auto;
}
#homelineup, #versus, #awaylineup {
	display: inline-block;
}
</style>
<div class="pagetitle">
	<span>제 ${match.mround}라운드 </span>
	<a class="smenu">${stadium}</a>
</div>

<div class="page-content">
	<div id="homelineup">
		<div class="lineup-top">
			<img src="${url}/resources/emblem/"/>${match.emblem_h}
		</div>
	</div>
	<span id="versus">vs</span>
	<div id="awaylineup"></div>
	${match.cname_short_h} vs ${match.cname_short_a}


</div>
<script>

</script>
<%@ include file="footer.jsp" %>