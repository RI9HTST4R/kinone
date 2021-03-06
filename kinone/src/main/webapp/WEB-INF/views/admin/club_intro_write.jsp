<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script type="text/javascript" src="${url}/resources/dist/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<style>
	.form-container {
		width: 100%;
	}
	.table>tbody>tr>td, .table>tbody>tr>th,
	.table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
		border: none;
		line-height: 20px;
	}
	input{
		width: 100%;
	}
	#content {
		resize: none;
	}
	#writebtn {
		border: 1px solid lightgray;
		padding: 5px 10px 5px 10px;
		text-decoration: none;
		color: black;
		border-radius: 0;
		cursor: pointer;
	}
	#writebtn:hover {
		color: white;
		background-color: lightgray;
	}
</style>

<div class="container">
	<div class="wrapper">
		<h1 id="title">클럽 소개글 등록</h1>
		<hr>
		<div class="form-container" align="right">
			<form action="${url}/admin/club_intro_insert.do" method="post">
				<table class="table">
					<tr>
					<td><label for="sel1">구단 선택:</label></td>
					<td>
      		<select class="form-control" id="ccode" name="ccode">
        <option value="0" selected>팀을 선택하세요!</option>
        <c:forEach var="c" items="${clubs}">
        <option value="${c.ccode}" >${c.cname}</option>
        </c:forEach>
       
      		</select></td>
					</tr>
					<tr>
						<td style="font-weight: bold;">내용</td>
						<td><textarea rows="20" cols="70" id="content" name="content" style="width:80%"></textarea></td>
					</tr>
				</table>
				<button id="writebtn">소개글 작성</button>
			</form>
		</div>
	</div>
</div>

<script>
$(function(){
	
	$("form").submit(function(){
		var ccode = $("#ccode").val();
		var image = $("#image").val();
		var content = $("#content").val();
		
		if(ccode == "0") {
			alert("팀을 선택하세요~!!");
			$("#subject").focus();
			return false;
		}
		if(oEditors.getById["content"].getIR() == "<p><br></p>") {
			alert("내용을 입력하세요.");
			return false;
		}else{
			$("#content").text(oEditors.getById["content"].getIR());
		}
	});
			
		

		
		var searchb;
		var oEditors = [];

		var sLang = "ko_KR";	// 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR

		// 추가 글꼴 목록
		var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
		

	nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "content",
			sSkinURI: "${url}/resources/dist/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
				aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
				fOnBeforeUnload : function(){
					//alert("완료!");
				},
				I18N_LOCALE : sLang
			}, //boolean
			fOnAppLoad : function(){
				
				//예제 코드
				//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator: "createSEditor2"
		});
		
		
	});
</script>

<%@ include file="footer.jsp" %>