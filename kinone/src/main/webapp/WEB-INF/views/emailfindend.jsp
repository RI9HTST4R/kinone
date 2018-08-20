<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body onload="uf();">
<script type="text/javascript">
var email = '${email}';
 function uf(){
	
	var con= confirm("가입아이디는 "+email+"입니다, 비밀번호 재설정 페이지로 가시겠습니까? "); 
	
 	if(con==true){
		location.replace("/kinone/passwdfindform.do")	
		}else{
			window.close();
		}
} 



</script>
</body>
</html>