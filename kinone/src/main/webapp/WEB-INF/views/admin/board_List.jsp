<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="container">
	<div class="wrapper">
		<h1 id="title">게시판 글 목록</h1>
		<hr>
		
		<table class="table table-hover">
		<thead>
			<tr align="center" valign="middle">
				<th style="font-family: Tahoma; font-size: 11pt;" 
					height="26" width="5%">
					<div align="center"></div><!--Test_id-->
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="65%">
					<div align="center">제목</div><!--desc-->
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="10%">
					<div align="center">작성자</div><!-- writer -->
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="10%">
					<div align="center">작성 날짜</div><!--revised -->
				</th>
				<th style="font-family: Tahoma; font-size: 11pt;" width="10%">
					<div align="center">조회수</div><!--revised -->
				</th>
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
					 <a href="board_cont.do?bno=${t.bno}&page=${page}">
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
		
		<div class="pbar-container" align="center" style="display: ">
			<ul class="pagination" style="display: inline-flex;">			
			<c:if test="${page <=1 }">
				<li class="page-item"><span class="page-link" style="color: lightgray; cursor: default;">&lt;</span></li>
			</c:if>
			<c:if test="${page > 1 }">
				<li class="page-item"><a class="page-link" href="boardList.do?page=${page-1}">&lt;</a></li>
			</c:if>			
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					<li class="page-item"><span class="page-link" style="background-color: skyblue; color:white; cursor: default;">${a}</span></li>
				</c:if>
				<c:if test="${a != page }">
					<li class="page-item"><a class="page-link" href="boardList.do?page=${a}">${a}</a></li>
				</c:if>
			</c:forEach>			
			<c:if test="${page >= maxpage }">
				<li class="page-item"><span class="page-link" style="color: lightgray; cursor: default;">&gt;</span></li> 
			</c:if>
			<c:if test="${page < maxpage }">
				<li class="page-item"><a class="page-link" href="boardList.do?page=${page+1}">&gt;</a></li>
			</c:if>			
			</ul>
		</div>
		<div id="bbslist_w">
			<button type="button" onclick="location='boardwrite.do?page=${page}'" class="btn btn-info">글쓰기</button>
		</div>
	</div>
</div>

<%@ include file="footer.jsp" %>