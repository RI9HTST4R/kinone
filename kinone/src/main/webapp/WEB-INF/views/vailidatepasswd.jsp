<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/kinone/validateEmailnumber.do" method="POST">
<input type="hidden" name="email" value="${email}">
<input type="hidden" name="emailnumber" value="${emailnumber}">
인증번호를 입력해주세요
<input type="text" name="putemailnumber">
<br><input type="submit">

</form>


<script type="text/javascript">

/* function validateEmail(){
	if($("#putemailnumber").val()==$("#emailnumber")){
		$ajax({
			type:"POST",
			url:"passwd_ok.do",
			data:{"email":$("#emial").val()},
			success : function(data){
				if(data>0){
					alert("인증 완료"); 
					location.href="newpass.do";
				}else{
					alert("인증실패");
				}
			}
		});
		return true;
	}else{
		alert("인증용 번호가 다릅니다.");
		return false;
	}
} */

</script>

</body>
</html>