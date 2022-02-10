<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../common_header_yw.jsp" %>
<link rel="stylesheet" type="text/css" href="css/css_pyw/sub.css" />
<link rel="stylesheet" type="text/css" href="css/css_pyw/subb.css" />
<link rel="stylesheet" type="text/css" href="css/css_pyw/subba_yw.css" />

<!--서브 헤더 -->
	<div class="sub-header sub-header-local">
		<h1 class="sub-title"><span class="text">지역 뉴스</span></h1>
		<span class="deco-box"><i class="deco-1"></i><i class="deco-2"></i></span>

		
	</div>
<script>
	function goSave(){
		//썸머
		
		if(checkValue(vol.t_title,"제목을 입력하세요")) return;
		//if(checkValue(vol.t_content,"내용을 입력하세요")) return;
		//썸머
		
		var summernoteContent = $('#summernote').summernote('code');
		vol.t_content.value = summernoteContent;		
		
		if(checkValue(vol.t_attach,"이미지파일을 첨부하세요")) return;
		
		//첨부파일 검사
		var fileName = vol.t_attach.value;
		if(fileName !=""){
			var pathFileName = fileName.lastIndexOf(".")+1;    //확장자 제외한 경로+파일명
			var extension = (fileName.substr(pathFileName)).toLowerCase();	//확장자명
			//파일명.확장자
		
			if(extension != "jpg" && extension != "gif" && extension != "png"){
				alert(extension +" 형식 파일은 업로드 안됩니다.이미지 파일만 가능!");
				return;
			}		
		}	
		//위에는 확장자 검사!
		// 첨부 용량 체크	

		var file = vol.t_attach;
		var fileMaxSize  = 5;
		if(file.value !=""){
			// 사이즈체크
			var maxSize  = 1024 * 1024 * fileMaxSize;  
			//var maxSize  = 10;  
			var fileSize = 0;

			// 브라우저 확인
			var browser=navigator.appName;
			// 익스플로러일 경우
			if (browser=="Microsoft Internet Explorer"){
				var oas = new ActiveXObject("Scripting.FileSystemObject");
				fileSize = oas.getFile(file.value).size;
			}else {
			// 익스플로러가 아닐경우
				fileSize = file.files[0].size;
			}
			//alert("파일사이즈 : "+ fileSize);

			if(fileSize > maxSize){
				alert(" 첨부파일 사이즈는 "+fileMaxSize+"MB 이내로 등록 가능합니다. ");
			return;
				}	
			}
	
		vol.method="post";
		vol.action="LocalSave";
		vol.submit();
				
	}
	function goList(){
		list.t_gubun.value="List";
		list.method="post";
		list.action="LocalNews";
		list.submit();
				
	}
//썸머노트
	$(document).ready(function() {
    $("#summernote").summernote({
        placeholder:'',
		width:850,
        height:300,
        callbacks: {
            onImageUpload:function(files, editor, welEditable){
                for(var i = files.length - 1;i>=0;i--){
                    sendFile(files[i], this);
                }
            }
        }
    });
  
    function sendFile(file, el, welEditable){
        var form_data = new FormData();
        form_data.append('file', file);
        $.ajax({
            data:form_data,
            type:"POST",
            url:'LocalSummerNoteImgUpload',
            cache:false,
            contentType:false,
            processData:false,
            enctype: 'multipart/form-data',
            success:function(url){

/*				 server.xml 에 path상황에 따라 
 				1. 					
				<Context docBase="spring_dbcp_two_cosmetic" path="/spring_dbcp_two_cosmetic" reloadable="true" source="org.eclipse.jst.jee.server:spring_dbcp_two_cosmetic"/>
				$(el).summernote('editor.insertImage',"/spring_dbcp_two_cosmetic/img/news_summernote/"+$.trim(url));
				2.
				<Context docBase="spring_dbcp_two_cosmetic" path="/" reloadable="true" source="org.eclipse.jst.jee.server:spring_dbcp_two_cosmetic"/>
				$(el).summernote('editor.insertImage',"/img/news_summernote/"+$.trim(url));
								
*/
//                $(el).summernote('editor.insertImage',"/img/news_summernote/"+$.trim(url));
              //  $(el).summernote('editor.insertImage',"/donaimg/dona_summernote/"+$.trim(url));
                $(el).summernote('editor.insertImage',"/donaimg/local_summernote/"+$.trim(url));
            },
            error: function(data) {
                console.log(data);
            }
        });
    }  
    
});
</script>
<form name="list">
	
	<input type="hidden" name="t_gubun">

</form>
<div class="contents">
<div class="tab-3" data-swipe='{"type":"case1","start":".active"}'>
			<ul>
				<li data-act='tab' class="item"><a href="Donation"><span class="in">기부</span></a></li>
				<li data-act='tab' class="item"><a href="Volunteer"><span class="in">봉사</span></a></li>
				<li data-act='tab' class="item active"><a href="LocalNews"><span class="in">지역뉴스</span></a></li>
				<li data-act='tab' class="item"><a href="Missing"><span class="in">실종아동</span></a></li>
			</ul>
		</div>


<div class="sub-write">
			
			<form name="vol" enctype="multipart/form-data">
					<h2 class="title2"> 지역뉴스를 정보를 기입해주세요</h2>
				
					<fieldset>
						<input type="hidden" name="t_page">
						<input type="hidden" name="t_gubun">
						<input type="hidden" name="t_reg_id" value="${session_id}">
						<table class="table">
							<caption><p style="font-size:30px; margin-bottom:20px;">우리 지역의 따뜻한 소식을 알려주세요</p></caption>
							<colgroup>
								<col width="20%">
								<col width="20%">
								<col width="*">
							</colgroup>
							
							<tr>
								<th><label for="title">뉴스제목</label></th>
								<td colspan="2"><input type="text" maxlength='100' name="t_title" id="title" class="title" placeholder="제목을 입력해주세요" style="border:1px solid #333333"></td>
							</tr>
							<tr>
								<th><label for="title">신문사이름</label></th>
								<td colspan="2"><input type="text" maxlength='100' name="t_news_name" id="title" class="title" placeholder="뉴스 제목을 입력해주세요" style="border:1px solid #333333"></td>
							</tr>
							
							<tr>
								
								<th><label for="cont">뉴스 내용</label></th>
								
								<td colspan="2">
									<input type="hidden" name="t_content"> 
									<div id="summernote"></div>
								</td>
							</tr>
							
	<script type="text/javascript">
	$(function(){					
		function readImage(input) {
		    // 인풋 태그에 파일이 있는 경우
		    if(input.files && input.files[0]) {
		        // 이미지 파일인지 검사 (생략)
		        // FileReader 인스턴스 생성
		        const reader = new FileReader()
		        // 이미지가 로드가 된 경우
		        reader.onload = e => {
		            const previewImage = document.getElementById("preview-image")
		            previewImage.src = e.target.result;
		        }
		        // reader가 이미지 읽도록 하기
		        reader.readAsDataURL(input.files[0])
		    } else {
		    	// 이미지 안올렸으면
				$("#preview-image").attr('src','');
				$("#preview-image").css("display","none");
		    }
		}
		// input file에 change 이벤트 부여
		const inputImage = document.getElementById("file");
		inputImage.addEventListener("change", e => {
			$("#preview-image").css("display","block");
		    readImage(e.target)
		})	
	});	
	</script>
	<style>
	#preview-image{display:none;}
	
	height:300px;
	</style>
							<tr>
								
								<th><label for="file">뉴스종류</label></th>
								<td colspan="2">
									<input type="radio"  name="t_search" value="donation"  class="tser" style="border:1px solid #333333;">&nbsp 봉사
									<input type="radio"  name="t_search" value="volunteer"  class="tser" style="border:1px solid #333333;">&nbsp 기부
									
								</td>
								
							</tr>
							<tr>
								
								<th><label for="file">메인사진 첨부</label></th>
								<td><img style="width: 500px;" id="preview-image"> </td>
								<td><input type="file" name="t_attach" class="file" id="file" style="border:1px solid #333333"></label></td>
							</tr>
							
							

							</table>
					</fieldset>
				</form>
						<div class="button_group">
							<input type="button" onclick="goSave()" value="등 록" class="btn">
							<input type="button" onclick="goList()" value="목 록"class="btn">
						</div>
			</div>
			
			
</div>
<%@ include file = "../common_footer.jsp" %>
