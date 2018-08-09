<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div class="container">
	<div class="wrapper">
		<h1 id="title">클럽 리스트</h1>
		<hr>
		<form>
			<table border=1px class="table table-sm">
				<thead>
					<th>목록</th>
					<th>클럽명</th>
					<th>감독명</th>
					<th><input type="button" value="클럽 추가"
				onclick="location.href='create_club.do'"></th>
				</thead>
				<tbody>
					<c:forEach var="mngClub" items="${ mngClubList }"
						varStatus="status">
						<tr>
							<td>${ mngClub.ccode }</td>
							<td><a href="detail_club.do?ccode=${mngClub.ccode}">${ mngClub.cname }</a></td>
							<td>${ mngClub.cmanager }</td>
							<td><input type="button" value="삭제"
								onclick="location.href='delete_club.do'"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</form>
	</div>
</div>
<%@ include file="footer.jsp"%>