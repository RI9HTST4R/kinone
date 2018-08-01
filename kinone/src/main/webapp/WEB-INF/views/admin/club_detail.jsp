<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<input type=hidden id="ccode" value=${ mngC.ccode }>
		<table>
			<tr>
				<td>클럽명(풀네임)</td>
				<td colspan="2">${ mngC.cname }</td>
			</tr>
			
			<tr>
				<td>클럽명(줄임)</td>
				<td colspan="2">${ mngC.cname_short }</td>
			</tr>
			<tr>
				<td>엠블럼</td>
				<td colspan="2"><img src="../stadium/${ mngC.emblem }"></td>
			</tr>
			<tr>
				<td>감독명</td>
				<td colspan="2">${ mngC.cmanager }</td>
			</tr>
		</table>
		<table>
			<tr>
				<td>경기장</td>
				<td colspan="2">${ mngC.sname }</td>
			</tr>
			<tr>
				<td>경기장 사진</td>
				<td colspan="2"><img src=${ mngC.sphoto }></td>
			</tr>
			<tr>
				<td>수용 가능 인원</td>
				<td colspan="2">${ mngC.capacity }</td>
				<td>${mngC.ccode}</td>
			</tr>			
		</table>
			<input type="button" name="update" value="수정하기" onclick="location='update_club.do?ccode=${mngC.ccode}'">
	</body>
</html>