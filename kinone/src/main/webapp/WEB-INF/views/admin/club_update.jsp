<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div class="container">
	<div class="wrapper">
		<h1 id="title">클럽 수정</h1>
		<hr>
		<form action="${url}/admin/update_club_ok.do" enctype="multipart/form-data" method="post">
			<table border=1px class="table table-sm">
				<tr>
					<th>클럽명(풀네임)</th>
					<td colspan="2"><input type="text" id="cname" name="cname"
						value="${ mngC.cname }"></td>
				</tr>
				<tr>
					<th>클럽명(줄임)</th>
					<td colspan="2"><input type="text" id="cname_short"
						name="cname_short" value="${ mngC.cname_short }"></td>
				</tr>
				<tr>
					<th>엠블럼</th>
					<td colspan="2"><input type="file" id="emblem" name="file"> ${ mngC.emblem }</td>
				</tr>
				<tr>
					<th>감독명</th>
					<td colspan="2"><input type="text" id="cmanager"
						name="cmanager" value="${ mngC.cmanager }"></td>
				</tr>
			</table>
			<table border=1px class="table table-sm">
				<tr>
					<th>경기장</th>
					<td colspan="2"><input type="text" id="sname" name="sname"
						value="${ mngC.sname }"></td>
				</tr>
				<tr>
					<th>경기장 사진</th>
					<td colspan="2"><input type="file" id="sphoto" name="file">${ mngC.sphoto }</td>
				</tr>
				<tr>
					<td>수용 가능 인원</td>
					<td colspan="2"><input type="text" id="capacity"
						name="capacity" value="${ mngC.capacity }"></td>
				</tr>
				<input type=hidden id=ccode name=ccode value=${ mngC.ccode }>
			</table>
			<input type="submit" value="수정 완료">
		</form>
	</div>
</div>
<%@ include file="footer.jsp"%>

