<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
.pagetitle {
	background-color: lightgray;
}
.board-subject {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	word-break: break-all;
	line-height: 30px;
}
.board-title {
	color: black;
}
.table > thead > tr > th, .table > tbody > tr > td{
	font-size: 12pt;
	vertical-align: middle;
}
</style>

<div class="pagetitle"><span><i class="fas fa-newspaper"></i> K리그 소식</span></div>
		
		<table class="table table-hover">
			<thead>
				<tr align="center">
					<th width="5%"></th>
					<th width="74%">제목</th>
					<th width="13%">작성 날짜</th>
					<th width="8%">조회수</th>
				</tr>
			</thead>

			<!-- 화면 출력 번호  변수 정의 -->		
			<c:set var="num" value="${listcount-(page-1)*10}"/>
			<tbody>
			<!-- 반복문 시작 -->
			<c:forEach var="t" items="${list}">
			<tr>
				<td align="center">				
 					<!-- 글번호 출력 부분 -->	
 					<c:out value="${num}"/>			
					<c:set var="num" value="${num-1}"/>	 
				</td>
				<td class="board-subject">						
					<!-- 제목 출력 부분 -->	
					<a class="board-title" href="news_cont.do?bno=${t.bno}&page=${page}" title="${t.subject}">${t.subject}</a>
				</td>
				<jsp:useBean id="toDay" class="java.util.Date"/>
				<fmt:formatDate var="today" value="${toDay}" pattern="MM/dd"/>
				<fmt:formatDate var="rdate" value="${t.regidate}" pattern="MM/dd"/>
				<!-- 첫번째 완료 시간 -->
				<td align="center">
					<c:if test="${today != rdate}"><fmt:formatDate value="${t.regidate}" pattern="MM.dd HH:mm"/></c:if>
					<c:if test="${today == rdate}"><fmt:formatDate value="${t.regidate}" pattern="HH:mm"/></c:if>
				</td>
				<td align="center">${t.readcount}</td>
			</tr>
			</c:forEach>
			<!-- 반복문 끝 -->	
			</tbody>		
		</table>
		<div class="pbar-container">
			<ul class="pagination" style="display: inline-flex;">			
			<c:if test="${page <=1 }">
				<li class="page-item"><span class="page-link" style="color: lightgray; cursor: default;">&lt;</span></li>
			</c:if>
			<c:if test="${page > 1 }">
				<li class="page-item"><a class="page-link" href="kleagueNews.do?page=${page-1}">&lt;</a></li>
			</c:if>			
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					<li class="page-item"><span class="page-link" style="background-color: skyblue; color:white; cursor: default;">${a}</span></li>
				</c:if>
				<c:if test="${a != page }">
					<li class="page-item"><a class="page-link" href="kleagueNews.do?page=${a}">${a}</a></li>
				</c:if>
			</c:forEach>			
			<c:if test="${page >= maxpage }">
				<li class="page-item"><span class="page-link" style="color: lightgray; cursor: default;">&gt;</span></li> 
			</c:if>
			<c:if test="${page < maxpage }">
				<li class="page-item"><a class="page-link" href="kleagueNews.do?page=${page+1}">&gt;</a></li>
			</c:if>			
			</ul>
		</div>
<%@ include file="footer.jsp" %>