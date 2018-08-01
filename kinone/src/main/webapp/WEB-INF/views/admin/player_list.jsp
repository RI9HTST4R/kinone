<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align='center'>
<h2>선수 목록</h2>
<table border=1px>
	<tr>
	<td>선수 이름</td>
	<td>소속 구단</td>
	<td>포지션</td>
	<td>백넘버</td>
	<td>사진</td>
	</tr>
	<c:if test="${empty list }">
		<tr>
			<td colspan="5">데이터가 없습니다</td>
		</tr>
	</c:if>
	<c:if test="${not empty list }">
	<c:forEach var="player" items="${list }" >
		<tr>
			<td><a href ="/kinone/admin/pview.do?pcode=${player.pcode }">${player.pname }</a> </td>
			<td>${player.ccode }</td>
			<td>${player.position }</td>
			<td>${player.pno }</td>
			<td>${player.photo }</td>
			
		</tr>
	</c:forEach>
	</c:if>

</table>

				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<a href="/kinone/admin/plist.do?pageNum=${pp.startPage - 1}">이전</a>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<c:if test="${pp.currentPage==i}">${i}</c:if>
					<c:if test="${pp.currentPage!=i}"><a href="/kinone/admin/plist.do?pageNum=${i}">${i}</a></c:if>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<a href="/kinone/admin/plist.do?pageNum=${pp.endPage + 1}">다음</a>
				</c:if>
			<%-- <c:if test="${empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="plist.do?pageNum=${pp.startPage - 1}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
						href="${path }/list/pageNum/${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="${path }/list/pageNum/${pp.endPage + 1}">다음</a></li>
				</c:if>
			</c:if> --%>
		
<br>
<a href="/kinone/admin/pinsertForm1.do">생성</a>
</div>
</body>
</html>