<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>클럽 수정 (관리자)</title>
</head>

<body>
<form action="${url}/admin/update_club_ok.do">
    <table>
        <tr>
            <td>클럽명(풀네임)</td>
            <td colspan="2">
                <input type="text" id="cname" name="cname" value="${ mngC.cname }">
            </td>
        </tr>
        <tr>
            <td>클럽명(줄임)</td>
            <td colspan="2">
                <input type="text" id="cname_short" name="cname_short" value="${ mngC.cname_short }">
            </td>
        </tr>
        <tr>
            <td>엠블럼</td>
            <td colspan="2">
                <input type="file" id="emblem" name="emblem" value="${ mngC.emblem }">
            </td>
        </tr>
        <tr>
            <td>감독명</td>
            <td colspan="2">
                <input type="text" id="cmanager" name="cmanager" value="${ mngC.cmanager }">
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>경기장</td>
            <td colspan="2">
                <input type="text" id="sname" name="sname" value="${ mngC.sname }">
            </td>
        </tr>
        <tr>
            <td>경기장 사진</td>
            <td colspan="2">
                <input type="file" id="sphoto" name="sphoto" value="${ mngC.sphoto }">
            </td>
        </tr>
        <tr>
            <td>수용 가능 인원</td>
            <td colspan="2">
                <input type="text" id="capacity" name="capacity"  value="${ mngC.capacity }">
            </td>
        </tr>
        <input type=hidden id=ccode name=ccode value= ${ mngC.ccode }>
    </table>
    <input type="submit" value="수정 완료">
</form>
</body>

</html>