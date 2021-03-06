<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<%
String webtoon_id=request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='css/upload.css'>
<title>제이버 웹툰</title>
<script>
var thumbnailUrl='./img/thumbnail-preview.jpg'
var webtoonUrl='./img/webtoon-preview.jpg'
window.onload=function(){
	var date=new Date().toLocaleString()
	//등록일을 현재 날짜로 고정
	document.getElementById('uploadDate').value=date
	
	//썸네일, 웹툰 내용 초기 사진
	document.getElementById("thumbnail").src=thumbnailUrl
	document.getElementById("webtoon").src=webtoonUrl
	
	//이미지 미리보기 구현
	document.getElementById('uploadThumbnail').addEventListener('change',function(e){
		document.getElementById("thumbnail").src=URL.createObjectURL(e.target.files[0])
	})
	
	//웹툰 그림 파일 미리보기 구현 (추후에 여러 장 업로드로 변경)
	document.getElementById('uploadWebtoon').addEventListener('change',function(e){
		document.getElementById("webtoon").src=URL.createObjectURL(e.target.files[0])
	})
}

</script>
</head>
<body
	style='display: flex; flex-direction: column; align-items: center;'>
	<a href='main.jsp'><img class='home-button' src='./img/home.png' width='50px' height='50px' alt='home'></a>
	<header>
		<h1>회차별 웹툰 등록</h1>
	</header>
	<form class='form' action="uploadDetail_do.jsp" method="post" enctype="multipart/form-data">
		<input type='hidden' name="webtoon_id" value="<%=webtoon_id %>">
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>등록일</label>
			</div>
			<input type="text" id='uploadDate' name='uploadDate' readonly>
		</div>
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>회차 제목</label>
			</div>
			<input class='title' id='title' name='title'>
		</div>
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>썸네일</label>
			</div>
			<div style='display:flex;align-items:center;'>
				<img class='main-image' alt="main-image" id='thumbnail'>
			<label for='uploadThumbnail' class='upload-image-btn'>이미지 선택</label>
			<input type='file' id='uploadThumbnail' name='uploadThumbnail' style='display: none' accept='image/*'>
			</div>
		</div>
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>웹툰 내용</label>
			</div>
			<div style='display:flex;align-items:center;'>
				<img class='main-image' alt="main-image" id='webtoon'>
			<label for='uploadWebtoon' class='upload-image-btn'>이미지 선택</label>
			<input type='file' id='uploadWebtoon' name='uploadWebtoon' style='display: none' accept='image/*'>
			</div>
		</div>
		<div style='display:flex; justify-content:center; margin-top:30px;'>
			<input class='button' type='submit' value='등록'>
			<button class='button'>취소</button>
		</div>
	</form>
</body>
</html>