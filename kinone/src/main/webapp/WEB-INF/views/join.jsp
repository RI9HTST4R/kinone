<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:set var="url" value="<%=request.getContextPath()%>" />
<link href="https://fonts.googleapis.com/css?family=Raleway|Righteous" rel="stylesheet">
<style>
* {
	box-sizing: border-box;
}

body {
	background-color: #f1f1f1;
}

#regForm {
	background-color: #ffffff;
	margin: 100px auto;
	font-family: Righteous;
	padding: 40px;
	width: 70%;
	min-width: 300px;
}

h1 {
	text-align: center;
}

input {
	padding: 10px;
	width: 100%;
	font-size: 17px;
	font-family: Raleway;
	border: 1px solid #aaaaaa;
}

/* Mark input boxes that gets an error on validation: */
input.invalid {
	background-color: #ffdddd;
}

/* Hide all steps by default: */
.tab {
	display: none;
}

button {
	background-color: #4CAF50;
	color: #ffffff;
	border: none;
	padding: 10px 20px;
	font-size: 17px;
	font-family: Raleway;
	cursor: pointer;
}

button:hover {
	opacity: 0.8;
}

#prevBtn {
	background-color: #bbbbbb;
}

/* Make circles that indicate the steps of the form: */
.step {
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbbbbb;
	border: none;
	border-radius: 50%;
	display: inline-block;
	opacity: 0.5;
}

.step.active {
	opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
	background-color: #4CAF50;
}
</style>

<script type="text/javascript">
$(function(){
	$(".tab2").hide();
	$(".tab3").hide();
	$(".tab1").show();
	$(".tab4").hide();
	$("#next2").hide();
	$("#next3").hide();
	$("#next4").hide();
});
</script>

<body>
	<div class="container">
		<div class="wrapper">
			<h1 id="title">회원가입!</h1>
			<hr>
<!-- 			<form id="regForm" action="join_ok.do" method="post"> -->
			<form>
				<h1>Register</h1>
				<!-- One "tab" for each step in the form: -->
				
				
				
				<div class="tab1">
				<h3>이용 약관</h3>
					<iframe src="${url}/resources/etc/contract1.txt" width="100%" height="400" scrolling="yes"></iframe>
					<br><br><br>
					<p>본인은 위 약관을 모두 읽었으며,약관에 동의합니다.&nbsp;&nbsp;&nbsp;<input type="checkbox" id="contract_check" style="width:17px;height:17px;"></p>	
				</div>
				<div class="tab2">
					<font face="bing" >로그인 정보</font> 
					<p>
						<input placeholder="로그인에 사용하실 이메일을 입력하세요" id="register_email"
							oninput="this.className = ''" name="email" onkeyup="checking()">	
					</p>
					<font id="checking" color="blue" style="float:left;margin-top:-10px;"></font>
					<p>
						<input placeholder="로그인에 사용하실 비밀번호를 입력하세요" id="register_passwd"
							oninput="this.className = ''" name="passwd" type="password">
					</p>
				</div>
				<div class="tab3">
					<font face="bing" >기본정보</font>
					<p>
						<input placeholder="이름을 입력하세요." oninput="this.className = ''" id="register_name"
							name="mname">
					</p>
					<p>
						<input type="date" placeholder="생년월일을 입력하세요." id="register_birthdate"
							oninput="this.className = ''" name="mbirthdate1">
					</p>
				</div>
				<div class="tab4">
					<font face="bing" >이메일 인증</font>
					<p>
						<input type="text" placeholder="이메일 인증번호를 입력하세요." id="email_send_check"
							oninput="this.className = ''" name="email_send_check">
					</p>
				</div>
				<div id="next1" style="overflow: auto;">
					<div style="float: right;">
						<!-- <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button> -->
						<button type="button" id="nextBtn" onclick="check_contract()">Next</button>
					</div>
				</div>
				<div id="next2" style="overflow: auto;">
					<div style="float: right;">
						 <button type="button" id="prevBtn2" onclick="nextPrev2()">Previous</button>
						<button type="button" id="nextBtn2" onclick="validateForm()">Next</button>
					</div>
				</div>
				<div id="next3" style="overflow: auto;">
					<div style="float: right;">
						 <button type="button" id="prevBtn3" onclick="nextPrev3()">Previous</button>
						<button type="button" id="nextBtn3" onclick="validateForm2()">Next</button>
					</div>
				</div>
				<div id="next4" style="overflow: auto;">
					<div style="float: right;">
						<button type="button" id="nextBtn4" onclick="validateEmail()">가입완료</button>
					</div>
				</div>
				
				<!-- Circles which indicates the steps of the form: -->
				<div style="text-align: center; margin-top: 40px;">
					<span id="step1" class="step finish"></span> <span id="step2" class="step"></span> <span id="step3" class="step"></span><span id="step4" class="step"></span>
				</div>
			</form>

		</div>
	</div>
	<script>
	var checked =0;
	var email_number;
	var passwd;
	function validateEmail(){
		if($("#email_send_check").val()==email_number){
			$.ajax({
		        type:"POST",
		        url:"join_ok.do",    
		        data: {"email":$("#register_email").val(),"mname":$("#register_name").val(),"passwd":passwd,"mbirthdate1":$("#register_birthdate").val()},  
		        success: function (data){
		        	if(data>0){
			        	alert("가입 완료"); 
			        	location.href="main.do";
		        	}else{
		        		alert("가입 실패");
		        	}
		        }
		        }); 
		        return true;
		}else{
			alert("인증용 번호가 다릅니다.");
			return false;
		}
	}
	function check_contract(){
		if($("#contract_check").is(":checked")){
			$(".tab1").hide();
			$(".tab3").hide();
			$(".tab2").show();
			$("#next1").hide();
			$("#next2").show();
			$("#next3").hide();
			 $("#step1").attr('class','step');
			 $("#step2").attr('class','step finish');
			 $("#step3").attr('class','step');
		}else{
			alert("약관에 동의해주세요");
			return false;
		}
	}
	function checking(){
		$.ajax({
	        type:"POST",
	        url:"register_email_check.do",    
	        data: {"register_email":$("#register_email").val()},  
	        success: function (data){
	        	console.log(data);
	        	var x, y, i, valid = true;
				if(data.trim()!=""){
					$("#checking").css("color","red");
		        	$("#checking").html("중복된 메일입니다.");
		        	$("#register_email").val("");
					$("#register_email").focus();
					checked =0;
				}else{
					var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
					if($("#register_email").val().match(regExp)==null){
						$("#checking").css("color","red");
						$("#checking").html("메일 형태로 입력해주세요.");
						checked=0;
					}else{
						$("#checking").css("color","blue");
						$("#checking").html("사용할 수 있는 메일입니다.");
						checked =1;
					}
					
				}
	        }
	        });
	}
	
	
		function nextPrev2(){
			$(".tab1").show();
			$(".tab3").hide();
			$(".tab2").hide();
			$("#next1").show();
			$("#next2").hide();
			$("#next3").hide();
			 $("#step1").attr('class','step finish');
			 $("#step2").attr('class','step');
			 $("#step3").attr('class','step');
		}
		function nextPrev3(){
			$(".tab1").hide();
			$(".tab3").hide();
			$(".tab2").show();
			$("#next1").hide();
			$("#next2").show();
			$("#next3").hide();
			 $("#step1").attr('class','step');
			 $("#step2").attr('class','step finish');
			 $("#step3").attr('class','step');
		}
		function validateForm2(){
			if($("#register_name").val().trim()==""){
				alert("이름을 입력하세요");
				$("#register_name").focus();
				return false;
			}else if(($("#register_birthdate").val().trim()=="")){
				alert("생년월일을 입력하세요");
				$("#register_birthdate").focus();
				return false;
			}else{
				 
				$.ajax({
			        type:"POST",
			        url:"register_encrypt.do",    
			        data: {"register_passwd":$("#register_passwd").val()},  
			        success: function (data){
			        	//alert(data);
			        	passwd = data; 
			        	email_number = Math.floor((Math.random()*900000) + 100000);
			       // 	alert(email_number); //인증용 이메일 번호
			        	$.ajax({
					        type:"POST",
					        url:"email_send.do",    
					        data: {"email_number":email_number,"email":$("#register_email").val(),"name":$("#register_name").val()},  
					        success: function (data){
					        	if(data!=null){
						        	alert("메일로 인증번호를 보냈습니다. 확인해주세요");   	
					        	}
					        }
					        });
			        	$(".tab1").hide();
						$(".tab3").hide();
						$(".tab2").hide();
						$(".tab4").show();
						$("#next1").hide();
						$("#next2").hide();
						$("#next3").hide();
						$("#next4").show();
						 $("#step1").attr('class','step');
						 $("#step2").attr('class','step');
						 $("#step3").attr('class','step');
						 $("#step4").attr('class','step finish');
			        	
			        }
			        });
			}
			
		}
		
		
		
		
		function validateForm() {
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var regex2 = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/i;
			
			if($("#register_email").val().match(regExp)!=null){
				/* alert("환영합니다"); */
			}else{
				alert("email 형태로 입력하세요");
				$("#register_email").val("");
				$("#register_email").focus();
				return false; 
			}
			if($("#register_passwd").val().match(regex2)!=null){
				/* alert("환영합니다"); */
			}else{
				alert("비밀번호는 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호여야 합니다.");
				$("#register_passwd").val("");
				$("#register_passwd").focus();
				return false; 
			}
			
			if(checked==1){
				$(".tab1").hide();
				 $(".tab2").hide();
				 $(".tab3").show();
				 $("#next1").hide();
				 $("#next2").hide();
				 $("#next3").show();
				 $("#step1").attr('class','step');
				 $("#step2").attr('class','step');
				 $("#step3").attr('class','step finish');
			}
			
			
			
		}

		
	</script>

</body>
</html>
<%@ include file="footer.jsp"%>

