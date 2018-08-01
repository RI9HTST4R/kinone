<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>클럽 생성 (관리자)</title>
</head>

<body>
	<form action="${url}/admin/create_club_ok.do" enctype="multipart/form-data" method="post">
		<table>
			<tr>
				<td>클럽명(풀네임)</td>
				<td colspan="2"><input type="text" id="cname" name="cname">
				</td>
			</tr>
			<tr>
				<td>클럽명(줄임)</td>
				<td colspan="2"><input type="text" id="cname_short"
					name="cname_short"></td>
			</tr>
			<tr>
				<td>엠블럼</td>
				<td colspan="2"><input type="file" id="emblem" name="file"
					></td>
			</tr>
			<tr>
				<td>감독명</td>
				<td colspan="2"><input type="text" id="cmanager"
					name="cmanager"></td>
			</tr>
		</table>
		<table>
			<tr>
				<td>경기장</td>
				<td colspan="2"><input type="text" id="sname" name="sname">
				</td>
			</tr>
			<tr>
				<td>경기장 사진</td>
				<td colspan="2"><input type="file" id="sphoto" name="file">
				</td>
			</tr>
			<tr>
				<td>수용 가능 인원</td>
				<td colspan="2"><input type="text" id="capacity"
					name="capacity"></td>
			</tr>

		</table>
		<input type="submit" id="createbtn" name="createbtn" value="클럽 생성">
	</form>
</body>

</html>