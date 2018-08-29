<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div class="container">
	<div class="wrapper">
		<h1 id="title">클럽 수정</h1>
		<hr>
		<form action="${url}/admin/update_club_ok.do" enctype="multipart/form-data" method="post">
			<table class="table" style="border: 1px solid lightgray; width: 50%;">
				<tr>
					<th width="250px">클럽명(풀네임)</th>
					<td colspan="2" align="left"><input type="text" id="cname" name="cname" value="${ mngC.cname }">
					</td>
				</tr>
				<tr>
					<th width="250px">클럽명(줄임)</th>
					<td colspan="2" align="left"><input type="text" id="cname_short"
						name="cname_short"value="${ mngC.cname_short }"></td>
				</tr>
				<tr>
					<th width="250px">엠블럼</th>
					<td colspan="2" align="left"><input type="file" id="emblem" name="file"
						value="${ mngC.emblem }"></td>
				</tr>
				<tr>
					<th width="250px">감독명</th>
					<td colspan="2" align="left"><input type="text" id="cmanager"
						name="cmanager" value="${ mngC.cmanager }"></td>
				</tr>
				<tr>
					<th width="250px">경기장명</th>
					<td colspan="2" align="left"><input type="text" id="sname" name="sname" value="${ mngC.sname }">
					</td>
				</tr>
				<tr>
					<th width="250px">경기장 위치</th>
					<td colspan="2" align="left">위도<br/><input type="number" step="any" id="lat" name="lat" value="${ mngC.lat }"><br/>
												경도<br/><input type="number" step="any" id="lon" name="lon" value="${ mngC.lon }">
					</td>
				</tr>
				<tr>
					<th width="250px">수용 가능 인원</th>
					<td colspan="2" align="left"><input type="text" id="capacity"
						name="capacity" value="${ mngC.capacity }"></td>
				</tr>

			</table>
				<input type=hidden id=ccode name=ccode value=${ mngC.ccode }>
			<input type="submit" value="수정 완료">
		</form>
	</div>
</div>
<%@ include file="footer.jsp"%>

