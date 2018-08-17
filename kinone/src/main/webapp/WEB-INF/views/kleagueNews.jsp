<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="container">
	<div class="wrapper">
		<h1 id="title">KLeague 소식들!!</h1>
		<hr>
		
		<table class="table table-hover">
		<thead>
			<tr align="center" valign="middle">
				<td style="font-family: Tahoma; font-size: 11pt;" 
					height="26">
					<div align="center">글번호</div><!--Test_id-->
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" >
					<div align="center">제목</div><!--desc-->
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" >
					<div align="center">작성자</div><!-- writer -->
				</td>
				<!-- <td style="font-family: Tahoma; font-size: 11pt;" >
					<div align="center">첨부파일</div>finished
				</td> -->
				<td style="font-family: Tahoma; font-size: 11pt;" >
					<div align="center">작성 날짜</div><!--revised -->
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" >
					<div align="center">조회수</div><!--revised -->
				</td>
			</tr>
			</thead>

			<!-- 화면 출력 번호  변수 정의 -->		
			<c:set var="num" value="${listcount-(page-1)*10}"/> 	
	
			<!-- 반복문 시작 -->
			<c:forEach var="t" items="${list}">
			
			<tr align="center" valign="middle">
				
				
				<td height="23" style="font-family: Tahoma; font-size: 10pt;">					
 					<!-- 글번호 출력 부분 -->	
 					<c:out value="${num}"/>			
					<c:set var="num" value="${num-1}"/>	 
				</td>
				
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="left">						
						
			<%-- 		<c:if test="${b.board_re_lev != 0}"> 
						<c:forEach var="k" begin="1" end="${b.board_re_lev}">
							&nbsp;&nbsp;			
						</c:forEach>
						<img src="./images/AnswerLine.gif">	
					</c:if>		 --%>			
						
					<!-- 제목 출력 부분 -->	
					 <a href="news_cont.do?bno=${t.bno}&page=${page}">
							${t.subject}
					 </a>
					</div>
				</td>
					<!-- 작성자(수정자) -->
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">admin</div>
				</td>
					<!-- 첫번째 완료 시간 -->
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center"><fmt:formatDate value="${t.regidate}" pattern="yyyy.MM.dd aa hh:mm"/>
					 </div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${t.readcount}  </div>
				</td>
			</tr>
			</c:forEach>
			<!-- 반복문 끝 -->			
		</table>
		
		<div id="bbslist_paging">			
			<c:if test="${page <=1 }">
				[이전]&nbsp;
			</c:if>
			
			<c:if test="${page > 1 }">
				<a href="kleagueNews.do?page=${page-1}">[이전]</a>&nbsp;
			</c:if>			

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href="kleagueNews.do?page=${a}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>			
			
			<c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="kleagueNews.do?page=${page+1}">[다음]</a>
			</c:if>			
			
		</div>
	</div>
</div>

<%@ include file="footer.jsp" %>