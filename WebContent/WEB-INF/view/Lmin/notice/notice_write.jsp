<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<h2>관리자/공지사항</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>관리자모드</span>
					<strong>공지사항</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN70700";
		var mbId = "MO70700";
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
		var title = $("#title");
		var contents = $("#contents");
		
		if(title.val()==""){
			alert("제목을 입력하세요.");
			title.focus();
			return false;
		}else if(contents.val()==""||contents.val()==null){
			alert("내용을 입력하세요.");
			contents.focus();
			return false;
		}else{
			f.submit();
			return true;
		}
	}
	
</script>

<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	

			<div class="moLnbWrap">
				<nav class="flexContainer">
					<div class="flexItem3">
						<strong><button type="button" class="select">관리자모드</button></strong>
						<ul>
							<li><a href="javascript:goMenu('', '');">관리자모드</a></li>
						</ul>
					</div>
					<div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
						<strong><button type="button" class="select" id="subtitle">고객센터</button></strong>
						<ul>
						<li id="MO70100"><a href="javascript:goMenu('../company/branch.jsp', 'MO70100');">전국지사안내</a></li>
						<li id="MO70200"><a href="javascript:goMenu('../company/advice.jsp', 'MO70200');">상담사조회</a></li>
						<li id="MO70300"><a href="javascript:goMenu('../company/cyber.jsp', 'MO70300');">사이버홍보실</a></li>
						<li id="MO70400"><a href="javascript:goMenu('/Lmin/funeral/funeralInfoList.do', 'MO70400');">전국장례시설안내</a></li>
						<li id="MO70500"><a href="javascript:goMenu('/Lmin/funeral/funeralNoticeList.do', 'M760500');">부고알림</a></li>
						<li id="MO70600"><a href="javascript:goMenu('../cruise/cruise_schedule.jsp', 'MO70600');">크루즈일정</a></li>
						<li id="MO70700"><a href="javascript:goMenu('/Lmin/notice/noticeList.do', 'MO70700');">공지사항</a></li>
						<li id="MO70800"><a href="javascript:goMenu('../counsel/counsel_list.jsp', 'MO70800');">1:1상담</a></li>
						<li id="MO70900"><a href="javascript:goMenu('../regulation/regulation_list.jsp', 'MO0900');">상조관련법규</a></li>
						<li id="MO71000"><a href="javascript:goMenu('../inquiry/inquiry_list.jsp', 'MO71000');">납부조회</a></li>
						<li id="MO71200"><a href="javascript:goMenu('../appli/appli_form.jsp', 'MO71200');">가입신청</a></li>
						</ul>
					</div>
				</nav>
			</div> <!-- // moLnbWrap -->

			<div class="pcLnbWrap">
				<nav>
					<ul class="pcLnb">
						<li id="MO70100"><a href="javascript:goMenu('../company/branch.jsp', 'MO70100');">전국지사안내</a></li>
						<li id="MO70200"><a href="javascript:goMenu('../company/advice.jsp', 'MO70200');">상담사조회</a></li>
						<li id="MO70300"><a href="javascript:goMenu('../company/cyber.jsp', 'MO70300');">사이버홍보실</a></li>
						<li id="MO70400"><a href="javascript:goMenu('/Lmin/funeral/funeralInfoList.do', 'MO70400');">전국장례시설안내</a></li>
						<li id="MO70500"><a href="javascript:goMenu('/Lmin/funeral/funeralNoticeList.do', 'M760500');">부고알림</a></li>
						<li id="MO70600"><a href="javascript:goMenu('../cruise/cruise_schedule.jsp', 'MO70600');">크루즈일정</a></li>
						<li id="MO70700"><a href="javascript:goMenu('/Lmin/notice/noticeList.do', 'MO70700');">공지사항</a></li>
						<li id="MO70800"><a href="javascript:goMenu('../counsel/counsel_list.jsp', 'MO70800');">1:1상담</a></li>
						<li id="MO70900"><a href="javascript:goMenu('../regulation/regulation_list.jsp', 'MO0900');">상조관련법규</a></li>
						<li id="MO71000"><a href="javascript:goMenu('../inquiry/inquiry_list.jsp', 'MO71000');">납부조회</a></li>
						<li id="MO71200"><a href="javascript:goMenu('../appli/appli_form.jsp', 'MO71200');">가입신청</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">공지사항</h3>
				<form name="f" id="f" method="post" action="/Lmin/notice/noticeRegProc.do">
				<div class="boardType2">
					<table summary="">
						<caption>회원가입</caption>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<td>
									<input type="text" name="title" id="title" class="inputType5" maxlength="25">
								</td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td>
									<textarea id="contents" name="contents" cols="83" rows="10" class="textArea"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br/><br/>
				<!-- btnArea -->
				<div class="btnArea">
					<button type="submit" class="btnDefaultForm" id="listBtn" onclick="return doSubmit();">등록</button>
					<button type="button" class="btnDefaultForm" id="listBtn">목록</button>
				</div>
				</form>
				<!-- // btnArea -->

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
