<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<c:if test="${result==1}">
<script>
alert("삭제 성공");
location.href='boardList.do?page=${page}';
</script>
</c:if>
<c:if test="${result!=1}">
<script>
alert("삭제 실패");
history.go(-1);
</script>
</c:if>
<%@ include file="footer.jsp" %>