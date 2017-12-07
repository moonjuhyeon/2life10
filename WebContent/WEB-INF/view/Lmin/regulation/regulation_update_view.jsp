<%@page import="com.cl.util.CmmUtil"%>
<%@page import="com.cl.util.TextUtil"%>
<%@page import="com.cl.dto.RegulationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	RegulationDTO rDTO = (RegulationDTO)request.getAttribute("rDTO");
	if(rDTO == null) rDTO = new RegulationDTO();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>관리자모드-크리스찬라이프</title>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<link type="text/css" rel="stylesheet" href="/public/css/default.css" />
<link type="text/css" rel="stylesheet" href="/public/css/layout_kor.css" />

<link type="text/css" rel="stylesheet" href="/public/css/sub_kor.css" />

<script type="text/javascript" src="/public/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/public/js/TweenMax.min.js"></script>
<script type="text/javascript" src="/public/js/common.js"></script>
<script type="text/javascript" src="/public/js/contents.js"></script>
<script type="text/javascript" src="/public/js/jquery.form.js"></script>
<script type="text/javascript" src="/public/js/jquery.rss.js"></script>
<!--[if lt IE 9]>
	<script src="/js/html5.js"></script>
	<script src="/js/respond.js"></script>
<![endif]-->
<script type="text/javascript">
function doUpdateRegulation(){
	var form = document.getElementById('f');
	if(form.regulationTitle.value == ""){
		alert('제목을 입력해 주세요.');
		form.regulationTitle.focus();
		return;
	}else{
		f.submit();
	}
}

function fileCheck(fileName, permissibleExtension){
	var result = 0;
	var fileExtension = fileName.value.slice(fileName.value.indexOf(".") + 1).toLowerCase();
	var alertStr = permissibleExtension[0];
	for(var i = 0; i<permissibleExtension.length; i++){
		if(fileExtension == permissibleExtension[i]){
			result++;
		}
		if(i>=1){
			alertStr += ", " + permissibleExtension[i];
		}
	}
	if(result == 0){
		alert(alertStr + " 파일만 업로드 가능합니다.");
		$(fileName).val("");
	}
}

function strLengthCheck(textArea){
	if(textArea.value.length > 4000){
		alert('4000자를 초과 할 수 없습니다.');
		textArea.value = textArea.value.substring(0, 4000);
	}
}

function updateImgNull(){
	if(confirm('이미지를 삭제 하시겠습니까?')){
		$.ajax({
			url : "/Lmin/regulation/regulationDeleteImg.do",
			type : "post",
			data : {
				'regulationNo' : '<%=CmmUtil.nvl(rDTO.getRegulationNo())%>',
				'regulationFileNo' : '<%=CmmUtil.nvl(rDTO.getRegulationFileNo())%>'
			},
			success : function(data){
				var contents = "";
				if(data == 1){
					alert('상조관련법규 사진이 삭제되었습니다.');
					contents += "<th scope='row'>업로드</th>";
					contents += "<td><input type='file' name='regulationFile' class='inputType1' maxlength='25' onchange='fileCheck(this.value, ['jpg', 'jpeg', 'png']);'></td>";
					$('#regulationImgTr').html(contents);
				}else{
					alert('상조관련법규 사진 삭제에 실패했습닏다.');
				}
			}
		})
	}
}

function doChangeImg(){
	 window.open("/Lmin/regulation/regulationImgChangeView.do?regulationNo=" + <%=CmmUtil.nvl(rDTO.getRegulationNo())%>,  "popupNo1", "width=500, height=500");
}
</script>
<body>
<div id="skipnavi">
	<a href="#contentsWrap">본문 바로가기</a>
</div>
<div class="wrap">
	<div class="header">
		<div class="container">
			
			<!-- heaer 인쿠르드 -->
			<!--#include file="../include/inc_header.jsp"-->
			<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
		</div>
	</div> <!-- // header -->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>관리자/상조관련법규</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>관리자모드</span>
					<strong>상조관련법규</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN70900";
		var mbId = "MO70900";
		var mbId2 = "";
		
		console.log(menuId);
		if ( menuId != '' ){
			var temp = menuId.substring((menuId.length-2), menuId.length);
			if ( temp == '00'){//대메뉴 // class="active"
				$("#"+menuId).addClass("active");
				$("#"+menuId).children().find("li:eq(0)").addClass("active");
			}else{//소메뉴
				$("#"+menuId).addClass("active");
				$("#"+menuId).parents("li").addClass("active");
			}
		}

		$("#subtitle").text($("#"+mbId).text());
		$("#subtitle2").text($("#"+mbId2).text());
		
	});

</script>

<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	
			<%@include file="/WEB-INF/view/Lmin/include/navBar.jsp" %>


			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">상조관련법규</h3>

				<div class="boardType2">
				<form action="/Lmin/regulation/regulationUpdateProcWithoutImg.do" method="post" enctype="multipart/form-data" id="f">
				<input type="hidden" name="regulationNo" value="<%=CmmUtil.nvl(rDTO.getRegulationNo()) %>">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<td>
									<input type="text" name="regulationTitle" class="inputType1" value="<%=TextUtil.exchangeEscapeNvl(rDTO.getRegulationTitle()) %>" style="" maxlength="25">
								</td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td>
									<textarea name="regulationContents" onkeyup="strLengthCheck(this);"><%=TextUtil.exchangeEscapeNvl(rDTO.getRegulationContents())%></textarea>
								</td>
							</tr>
							<tr id="regulationImgTr">
							<%
							if("".equals(CmmUtil.nvl(rDTO.getRegulationFileName()))){
							%>
								<th scope="row">업로드</th>
								<td>
									<input type="file" name="regulationFile" class="inputType1" style="" maxlength="25" onchange="fileCheck(this.value, ['jpg', 'jpeg', 'png']);">
								</td>
							<%
							}else{
							%>
								<th scope="row">이미지</th>
								<td>
									<img src="<%="/regulationFile/" + CmmUtil.nvl(rDTO.getRegulationFileName())%>">
									<a href="#" id="submitLink" class="btn_active" onclick="doChangeImg();">변경</a>
									<a href="#" id="btnCancel" class="btn_cancel" onclick="updateImgNull();">삭제</a>
								</td>
							<%
							}
							%>
							</tr>
						</tbody>
					</table>
					</form>
				</div>

				<div class="btn_area">
					<a href="#" id="submitLink" class="btn_active" onclick="doUpdateRegulation();">수정</a>
					<a href="#" id="btnCancel" class="btn_cancel">취소</a>
				</div>

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

	<div class="footer">
		<div class="container">
			


			<footer>
				<div class="footMenuWrap">
					<ul>
						<li><a href="">채용정보</a></li>
						<li><a href="">주요정보고시사항</a></li>
						<li><a href="">오시는길</a></li>
						<li><a href="">개인정보 취급방침</a></li>
					</ul>
				</div>

				<p class="copy">
					<small>크리스찬라이프, 대표자 : 김현재, 서울시 강남구 논현동 268-2 1층, E-mail:cg4491@naver.com</small><br/>
					<small>대표전화:1644-4491, 팩스:02-556-4439, 통신판매신고번호:제2008-서울강남-1083호</small><br/>
					<small>Copyright (C) 2016 Samsung C&amp;T Corporation. All rights reserved</small>
				</p>

				<div class="familyWrap"> <!-- .btnFamily 버튼 클릭시 다중클래스 on 추가 -->
					<section>
						<h2><button type="button" class="btnFamily">FAMILY MAP</button></h2>
						<div class="familyArea">
							<div class="container">
								<dl class="etc">
									<dt>기타</dt>
									
									<dd><a href="" target="_blank" title="새창">참조사이트1</a></dd>
									<dd><a href="" target="_blank" title="새창">참조사이트2</a></dd>
									<dd><a href="" target="_blank" title="새창">참조사이트3</a></dd>
									<dd><a href="" target="_blank" title="새창">참조사이트4</a></dd>
								</dl>
							</div>
						</div>
					</section>
				</div>
			</footer>
			
		</div>
	</div> <!-- // footer -->
</div> <!-- // wrap -->
</body>
</html>