<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--##### // Visual & LNB #####-->
<%@ include file = "../common_header_yw.jsp" %>


<script type="text/javascript">

//업데이트 폼으로
	function goUpdateForm(){
	
		list.t_gubun.value="UpdateForm";
		list.method="post";
		list.action="Notice";
		list.submit();
}
//삭제
	function goDelete(){
	if(confirm("정말 지우시겠습니까?")){
		
		list.method="post";
		list.action="NoticeDelte";
		list.submit();
}}

//리스트로
	function goList(){
		list.t_gubun.value="List";
		list.method="post";
		list.action="Notice";
		list.submit();
				
	}




</script>
<form name="list">
	<input type="hidden" name="t_no" value="${t_no}">
	<input type="hidden" name="t_gubun" >

	<input type="hidden" name="t_session_id" >
	<input type="hidden" name="t_dum" >
</form>

<!--서브 헤더 -->
	<div class="sub-header sub-header-notice"><!-- sub-header 뒤에 이름 변경으로 이미지 변경 -->
		<h1 class="sub-title"><span class="text">공 지 사 항</span></h1>
		<span class="deco-box">
			<i class="deco-1"></i><i class="deco-2"></i>
		</span>
	</div>
<!-- 서브 헤더 끝 -->


<div class="contents">
<div class="tab-3" data-swipe='{"type":"case1","start":".active"}'>
			<ul>
				<li data-act='tab' class="item active"><a href="Notice"><span class="in">공지사항</span></a></li>
				<li data-act='tab' class="item"><a href="FAQ"><span class="in">빠른답변</span></a></li>
				<li data-act='tab' class="item"><a href="Qna"><span class="in">질의응답</span></a></li>
				
			</ul>
</div>

		<div class="board-view ty-3">
			<div class="board-title1">
				<h2 class="title" data-addtitle="this">
				<c:if test="${t_dto.getImportant() eq '1' }"	>
					<span style="color:#1E90FF; font-weight:bold">[중요]</span>
				</c:if>
				${t_dto.getTitle()}</h2>
				<p class="title-sub">관리자</span> | <i class="fa fa-eye"></i>&nbsp ${t_dto.getHit()}</p>
				<span class="date">${t_dto.getReg_date()}</span>
			</div>

			<div class="board-side" data-grid="{&quot;case&quot;:&quot;pin&quot;, &quot;in&quot;:&quot;.board-view&quot;, &quot;except&quot;:&quot;.header-in&quot;}">
				<div class="inner">
					
					
				</div>
			</div>
	<style>

	.viewCont{
		
		white-space:pre-wrap;
		padding-top:50px;
		overflow:auto;
		
	}
	</style>
			<div class="board-content">

				<div data-empty="true" style="text-align: center;">
				<div class="viewCont">${t_dto.getContent()}</div>
				
				</div>
			<div class="btn-area">
				<input type="button" onclick="goList()" value="목 록"class="btn">
				<input type="button" onclick="goUpdateForm()" value="수 정" class="btn">
				<input type="button" onclick="goDelete()" value="삭 제"class="btn">
			</div>
        </div>
    </div>

<!-- 댓글 기능 구현 안함-->



<script>
// 

    var kkeys = [], konami = "38,38,40,40,37,39,37,39,66,65";
$(document).keydown(function(e) {
    kkeys.push( e.keyCode );
    if ( kkeys.toString().indexOf( konami ) >= 0 ){
        kkeys = [];
        alert('안녕하세요');
    }
});

/*공유 버튼 클릭 시 창 열리고 다시 클릭시 꺼짐 'id=share-cont' 에 onclick='toggleDiv() 를 집어넣었으나 모달창으로 교체함*/
/*
function toggleDiv() {
  var div = document.getElementById('share-cont');
  if(div.style.display == 'none')  {
    div.style.display = 'block';
  }else {
    div.style.display = 'none';
  }
}
*/

// 팝업 열기
$(document).on("click", "#btn-share", function (e){
  var target = $(".share-open");
  $(target).addClass("show");
});

// 외부영역 클릭 시 팝업 닫기
$(document).mouseup(function (e){
  var LayerPopup = $(".share-open");
  if(LayerPopup.has(e.target).length === 0){
    LayerPopup.removeClass("show");
  }
});

function clip(){

    var url = '';
    var textarea = document.createElement("textarea");
    document.body.appendChild(textarea);
    url = window.document.location.href;
    textarea.value = url;
    textarea.select();
    document.execCommand("copy");
    document.body.removeChild(textarea);
    alert("URL이 복사되었습니다.")
}
</script>

</div>
</div>
</body>



<%@ include file = "../common_footer.jsp" %>