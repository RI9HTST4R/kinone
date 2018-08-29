<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div class="container">
	<div class="wrapper">
		<h1 id="title">클럽 리스트</h1>
		<hr>
		<form>
			<table class="table" style="width: auto;">
				<thead>
					<tr>
						<th style="text-align: center;">클럽코드</th>
						<th style="text-align: center;">클럽명</th>
						<th style="text-align: center;">감독명</th>
						<th style="text-align: center;"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mngClub" items="${ mngClubList }"
						varStatus="status">
						<tr>
							<td style="text-align: center;">${ mngClub.ccode }</td>
							<td style="text-align: justify;"><a href="detail_club.do?ccode=${mngClub.ccode}">${ mngClub.cname }</a></td>
							<td style="text-align: center;">${ mngClub.cmanager }</td>
							<td style="text-align: center;"><input type="button" value="삭제"
								onclick="location.href='delete_club.do?ccode=${mngClub.ccode}'"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</form>
	</div>
</div>
<%@ include file="footer.jsp"%>