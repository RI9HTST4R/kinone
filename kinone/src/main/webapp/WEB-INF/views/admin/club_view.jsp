<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row.content {
	height: 1500px
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
</head>
<body>

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-9">
				<form>
					<table>
						<thead>
							<td>목록</td>
							<td>클럽명</td>
							<td>감독명</td>
						</thead>
						<tbody>
							<c:forEach var="mngClub" items="${ mngClubList }"
								varStatus="status">
								<tr>
									<td>${ mngClub.ccode }</td>
									<td><a href="detail_club.do?ccode=${mngClub.ccode}">${ mngClub.cname }</a></td>
									<td>${ mngClub.cmanager }</td>
									<td><input type="button" value="삭제" onclick="location.href='delete_club.do'"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<input type="button" value="클럽 추가"
						onclick="location.href='create_club.do'">
				</form>
			</div>
		</div>
	</div>

	<footer class="container-fluid">
	<p>Footer Text</p>
	</footer>
</body>
</html>
