<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<!DOCTYPE>

<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
* {
	box-sizing: border-box;
}
.pagetitle {
	width: 100%;
	height: 100px;
	/* border: 1px solid red; */
	text-align: left;
	margin-top: 20px;
	padding: 0 20px;
	font-family: Jua;
}
.pagetitle > span {
	color: white;
	font-size: 25pt;
	line-height: 120px;
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

.pagetitle {
	background-color: green;
}
hr {
	margin: 20px 0 30px 0;
}
</style>
<script type="text/javascript">
$(function(){
	$(".tab1").show();
	$(".tab2").hide();
	$(".tab3").hide();
	$("#next2").hide();
	$("#next3").hide();
});
</script>

<body>
<div class="pagetitle"><span>K In One 비밀번호 찾기</span></div>
<br>
<form>

가입 이메일을 알려주세요

<div class="tab1">
	<h3>가입 이메일 입력</h3>
		<p>
			<input placeholder="로그인에 사용하실 이메일을 입력하세요" id="email"
				oninput="this.className = ''" name="email" >
		</p>

</div>

	<div class="tab2">
		<h3>인증 번호 입력</h3>
			<p>
				<input type="text" name="putemailnumber"  placeholder="이메일 인증번호를 입력하세요."
				id="putemailnumber" oninput="this.className = ''">
			</p>
			<input type="button" value="인증번호 발송" onclick="vnsend()">
	</div>

	<div class="tab3">
		<h3>재설정할 비밀번호를 입력</h3>
			<p>
				<input type="password" name="passwd" placeholder="재설정 비밀번호를 입력하세요"
				id="passwd" oninput="this.className = ''"  onkeyup="checking1()">
			</p>
			
			<font id="checking1" color="blue"
			style="float: left; margin-top: -10px;"></font>
			
			<p>
				<input  type="password" placeholder="비밀번호 확인을 위해 다시 한번 입력해주세요" 
				id="passwdchk" name="passwdchk" oninput="this.className = ''" >
			</p>
			
			<font id="checking2" color="blue"
			style="float: left; margin-top: -10px;"></font>
		<p>
	</div>

	<div id="next1" style="overflow: auto;">
		<div style="float: right;">
			<!-- <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button> -->
			<button type="button" id="nextBtn" onclick="validateForm1()">Next</button>
		</div>
	</div>
	<div id="next2" style="overflow: auto;">
		<div style="float: right;">
			<button type="button" id="nextBtn2" onclick="validateForm2()">Next</button>
		</div>
	</div>
	<div id="next3" style="overflow: auto;">
		<div style="float: right;">
			<button type="button" id="nextBtn4" onclick="changepasswd()">재설정완료</button>
		</div>
	</div>
	
	<div style="text-align: center; margin-top: 40px;">
		<span id="step1" class="step finish"></span> 
		<span id="step2"class="step"></span> 
		<span id="step3" class="step"></span>
	</div>

</form>
<script type="text/javascript">
	var checked =0;
	var email_number;
	var passwd;
	
	function validateForm1(){
		$.ajax({
	        type:"POST",
	        url:"findemailchk.do",    
	        data: {"email":$("#email").val()},  
	        success: function (data){
	        	console.log(data);
	        	var x, y, i, valid = true;
					if(data.trim()!=""){
						checked =1;
					}else{
						alert("존재하지 않는 아이디입니다.")
						$("#email").val("");
						$("#email").focus();
						return false;
					}
					if(checked==1){
						$(".tab1").hide();
						$(".tab2").show();
						$(".tab3").hide();
						$("#next1").hide();
						$("#next2").show();
						$("#next3").hide();
						$("#step1").attr('class','step');
						$("#step2").attr('class','step finish');
						$("#step3").attr('class','step');
						checked=0;
					}else{
						alert("가입 Email을 입력해주세요.");
						return false;
					}
				}
		});
	}
	
	function vnsend(){
	        	email_number = Math.floor((Math.random()*900000) + 100000);
	        	alert(email_number); //인증용 이메일 번호
	        	$.ajax({
			        type:"POST",
			        url:"findemailsend.do",    
			        data: {"email_number":email_number,"email":$("#email").val()},  
			        success: function (data){
			        	if(data!=null){
				        	alert("메일로 인증번호를 보냈습니다. 확인해주세요");
			        	}else{
			        	}
			        }
			    });
	}
	
	function validateForm2(){
		
					if(email_number==$("#putemailnumber").val()){
						$(".tab1").hide();
						$(".tab2").hide();
						$(".tab3").show();
						$("#next1").hide();
						$("#next2").hide();
						$("#next3").show();
						$("#step1").attr('class','step');
						$("#step2").attr('class','step');
						$("#step3").attr('class','step finish');
					}else{
						alert("인증번호를 올바르게 입력해주세요.");
						$("#putemailnumber").val("");
						$("#putemailnumber").focus();
						return false;
					}
		}
	
	function checking1(){
		var regex2 = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/i;
		if($("#passwd").val().match(regex2)!=null){
			/* alert("환영합니다"); */
			$("#checking1").html("");
			checked=1;
			}else{
			$("#checking1").css("color","red");
	       	$("#checking1").html("비밀번호는 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호여야 합니다.");
	       	checked=0;
	       	return false; 
		}
	}
	
	
	$(function(){
		$("#passwdchk").keyup(function(){
			if ($("#passwd").val()==($("#passwdchk").val())){
				
				$("#checking2").css("color","blue");
		       	$("#checking2").html("비밀번호가 일치합니다.");
		       	checked=2;
				
			}else{
				
				$("#checking2").css("color","red");
		       	$("#checking2").html("비밀번호가 일치하지 않습니다.");
		       	checked=0;
			}
		});
		
	});
	/* function checking2(){	
		if ($("#passwd").val()==($("#passwdchk").val())){
			alert("c11");
			
			$("#checking2").css("color","blue");
	       	$("#checking2").html("비밀번호가 일치합니다.");
	       	checked=2;
			
		}else{
			
			$("#checking2").css("color","red");
	       	$("#checking2").html("비밀번호가 일치하지 않습니다.");
	       	checked=0;
		}
	} */
	
	function changepasswd(){
		if (checked==2){
			$.ajax({
				type:"POST",
				url:"passwdchange.do",
				data: {"passwd":$("#passwd").val(),"email":$("#email").val()},
				success:function(data){
					console.log(data);
					if(data!=null){
						alert("비밀번호 재설정에 성공했습니다");
						window.close();
					}
				}
			})
		}else{
			alert("비밀번호를 올바르게 작성해주세요.");
			$("#passwd").val("");
			$("#passwdchk").val("");
			$("#passwd").focus();
		}
		
	}
		
	
</script>

</body>
</html>