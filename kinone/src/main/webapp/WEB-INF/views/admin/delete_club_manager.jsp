<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action ="delete_club_ok.do">
 <table>
        <tr>
            <td>클럽명(풀네임)</td>
            <td colspan="2">
                <input type="text" id="cname" name="cname">
            </td>
        </tr>
        <tr>
            <td>감독명</td>
            <td colspan="2">
                <input type="text" id="cmanager" name="cmanager">
            </td>
        </tr>
    </table>
    <input type="submit" id="deletebtn" name="deletebtn" value="클럽 삭제">
</body>
</html>