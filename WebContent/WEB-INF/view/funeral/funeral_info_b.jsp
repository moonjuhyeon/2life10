<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>장례정보</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>장례상품</span>
					<strong>장례정보</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN30300";
		var mbId = "MO30300";
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

			<div class="moLnbWrap">
                <nav class="flexContainer">
                    <div class="flexItem3">
                        <strong><button type="button" class="select">장례상품</button></strong>
                        <ul>
                            <li><a href="javascript:goMenu('../company/overview.jsp', '');">회사소개</a></li>
                            <li><a href="javascript:goMenu('../info/pro_info.jsp', '');">상조상품안내</a></li>
                            <li><a href="javascript:goMenu('../funeral/funeral_mark.jsp', '');">장례상품</a></li>
                            <li><a href="javascript:goMenu('../marry/marry_mark.jsp', '');">웨딩상품</a></li>
                            <li><a href="javascript:goMenu('../cruise/cruise_mark.jsp', '');">크루즈상품</a></li>
                            <li><a href="javascript:goMenu('../notice/notice_list.jsp', '');">고객센터</a></li>
                        </ul>
                    </div>
                    <div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
                        <strong><button type="button" class="select" id="subtitle">장례정보</button></strong>
                        <ul>
                            <li id="MO30100"><a href="javascript:goMenu('../funeral/funeral_mark.jsp', 'MO30100');">장례상품특징</a></li>
                            <li id="MO30200"><a href="javascript:goMenu('../funeral/funeral_list_a.jsp', 'MO30200');">장례상품</a></li>
                            <li id="MO30300"><a href="javascript:goMenu('../funeral/funeral_info_a.jsp', 'MO30300');">장례정보</a></li>
                            <li id="MO30400"><a href="javascript:goMenu('../funeral/funeral_notice.jsp', 'MO30400');">부고알림</a></li>
                        </ul>
                    </div>

                </nav>
            </div> <!-- // moLnbWrap -->

            <div class="pcLnbWrap">
                <nav>
                    <ul class="pcLnb">
                        <li id="MN30100"><a href="javascript:goMenu('../funeral/funeral_mark.jsp', 'MN30100');">장례상품특징</a></li>
                        <li id="MN30200"><a href="javascript:goMenu('../funeral/funeral_list_a.jsp', 'MN30200');">장례상품</a></li>
                        <li id="MN30300"><a href="javascript:goMenu('../funeral/funeral_info_a.jsp', 'MN30300');">장례정보</a></li>
                        <li id="MN30400"><a href="javascript:goMenu('../funeral/funeral_notice.jsp', 'MN30400');">부고알림</a></li>
                    </ul>
                </nav>
            </div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="pro_info" class="contents"> <!-- 페이지별 ID -->

				<div class="defaultTab">
				    <strong class="select">
                        <button type="button">장례구비서류 및 행정절차</button>
                    </strong>
					<ul>
						<li class="tab01"><a href="javascript:goMenu('../funeral/funeral_info_a.jsp', 'MN30300');">기독교장례 및 추도예매</a></li>
						<li class="tab02 active"><a href="javascript:goMenu('../funeral/funeral_info_b.jsp', 'MN30300');">장례구비서류 및 행정절차</a></li>
						<li class="tab03"><a href="javascript:goMenu('../funeral/funeral_info_list.jsp', 'MN30300');">전국장례시설안내</a></li>
						<li class="tab04"><a href="javascript:goMenu('../funeral/funeral_info_c.jsp', 'MN30300');">관련사이트</a></li>
					</ul>
				</div>
				
				<div class="businessIntro">
					<h3 class="subTit">장례시 구비서류</h3>
				</div>
				<br/>
				
				<strong class="blueTit">병사 및 자연사인 경우</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>필요서류 : 사망진단서(시체검안서) 7통</li>
					<li>제출서 : 주민등록지 관할 읍, 면, 동사무소, 국민건강보험공단, 장지(공원묘지, 화장장)</li>
					<li>발급처 : 병원(담당의사), 응급실</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">변사 및 사고사인 경우</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>반드시 관할경찰서에 사고접수 하여야 함</li>
					<li>필요서류 : 사망진단서(시체검안서) 7통</li>
					<li>추가서류 : 검사지휘서(사체인도확인서) 2통</li>
					<li>발급처 : 병원 및 관할경찰서</li>
					<li>제출서 : 주민등록지 관할 읍, 면, 동사무소, 국민건강보험공단, 장지(공원묘지, 화장장)</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">사망진단서 용도</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>해당 읍, 면, 동사무소 사망신고시(30일이내) 1통</li>
					<li>매장, 화장용 1통</li>
					<li>국민건강보험공단 1통</li>
					<li>기타(보험회사 보관용) 1통(직장, 학교는 복사본 가능)<br/>* 보험회사 상품 가입시, 1구좌에 2통 추가</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">공원묘지에 안장시 준비서류</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>사망진단서 1통</li>
					<li>주민등록등본 1통</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">화장장의 경우 준비서류</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>사망진단서 1통</li>
					<li>주민등록등본 1통</li>
					<li>회장장 관할지 수입인지(해당시 화장요금)</li>
				</ul>
				<br/><br/>

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="../include/inc_footer.jsp"%>
