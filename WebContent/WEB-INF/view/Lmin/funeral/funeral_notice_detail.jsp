<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cl.util.CmmUtil" %>
<%@ page import="com.cl.util.TextUtil" %>
<%@ page import="com.cl.dto.FuneralNoticeDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
	FuneralNoticeDTO fDTO = (FuneralNoticeDTO) request.getAttribute("fDTO");
	
	if(fDTO == null){
		fDTO = new FuneralNoticeDTO();
	}
	
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
<script type="text/javascript" src="./public/js/contents.js"></script>
<script type="text/javascript" src="/public/js/jquery.form.js"></script>
<script type="text/javascript" src="/public/js/jquery.rss.js"></script>

<!--[if lt IE 9]>
	<script src="/js/html5.js"></script>
	<script src="/js/respond.js"></script>
<![endif]-->
<script type="text/javascript">
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
				<h2>관리자/부고알림</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>관리자모드</span>
					<strong>부고알림</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN70500";
		var mbId = "MO70500";
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
	
	function doSubmit(){
		var f = $("#f");
		var name = $("#name");
		var member = $("#member");
		var place = $("#place");
		var date = $("#date");
		
		if(name.val()==""){
			alert("소천인을 입력하세요.");
			name.focus();
			return false;
		}else if(member.val()==""){
			alert("회원명을 입력하세요.");
			member.focus();
			return false;
		}else if(place.val()==""){
			alert("장소를 입력하세요.");
			place.focus();
			return false;
		}else if(date.val()==""){
			alert("소천일을 선택하세요.");
			return false;
		}else{
			f.submit();
			return true;
		}
	}
	
	function doDelete(){
		var f = $("#f");
		if(confirm("삭제 하시겠습니까?")){
			f.attr("action", "/Lmin/funeral/funeralNoticeDelete.do");
			f.submit();
			return true;
		}else{
			return false;			
		}
	}

</script>

<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	
			<%@include file="/WEB-INF/view/Lmin/include/navBar.jsp" %>


			<!-- 메뉴 영역 -->

			<div id="write" class="contents"> <!-- 페이지별 ID -->
				<h3 class="smallTit">부고알림</h3>
				<form name="f" id="f" method="post" action="/Lmin/funeral/funeralNoticeUpdateProc.do">
				<input type="hidden" name="fNo" id="fNo" value="<%=CmmUtil.nvl(fDTO.getFuneralNoticeNo())%>">
				<div class="boardType2">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">소천인</th>
								<td>
									<input type="text" name="name" id="name" class="inputType1" maxlength="25" value="<%=CmmUtil.nvl(fDTO.getFuneralNoticeName())%>">
								</td>
							</tr>
							<tr>
								<th scope="row">회원명</th>
								<td>
									<input type="text" name="member" id="member" class="inputType1" maxlength="25" value="<%=CmmUtil.nvl(fDTO.getFuneralNoticeMember())%>">
								</td>
							</tr>
							<tr>
								<th scope="row">장소</th>
								<td>
									<input type="text" name="place" id="place" class="inputType1" maxlength="25" value="<%=CmmUtil.nvl(fDTO.getFuneralNoticePlace())%>">
								</td>
							</tr>
							<tr>
								<th scope="row">소천일</th>
								<td>
									<!-- <select id="telAbleEndTime" name="telAbleEndTime" title="" class="inputType3">
										<option value="00">2017</option>
									</select>
									<select id="telAbleEndTime" name="telAbleEndTime" title="" class="inputType3">
										<option value="00">01</option>
										<option value="01">02</option>
									</select>
									<select id="telAbleEndTime" name="telAbleEndTime" title="" class="inputType3">
										<option value="00">01</option>
										<option value="01">02</option>
									</select> -->
									<input type="date" name="date" id="date" value="<%=CmmUtil.nvl(fDTO.getFuneralNoticeDay())%>">
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="btn_area">
					<a href="javascript:doSubmit();" id="submitLink" class="btn_active">수정</a>
					<a href="javascript:doDelete();" id="submitLink" class="btn_active">삭제</a>
					<a href="/Lmin/funeral/funeralNoticeList.do" id="btnCancel" class="btn_cancel">취소</a>
				</div>
			</form>

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
