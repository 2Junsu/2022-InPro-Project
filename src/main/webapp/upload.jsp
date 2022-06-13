<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='css/upload.css'>
<title>제이버 웹툰</title>
<script>
	var thumbnailUrl = './img/thumbnail-preview.jpg'

	window.onload = function() {
		//대표 이미지 초기 사진
		document.getElementById("mainImage").src = thumbnailUrl

		//이미지 미리보기 구현
		document.getElementById('uploadImage').addEventListener(
				'change',
				function(e) {
					document.getElementById("mainImage").src = URL
							.createObjectURL(e.target.files[0])
				})
	}
</script>
</head>
<body
	style='display: flex; flex-direction: column; align-items: center;'>
	<a href='main.jsp'><img class='home-button' src='./img/home.png'
		width='50px' height='50px' alt='home'></a>
	<header>
		<h1>웹툰 등록</h1>
	</header>
	<form class='form' action='upload_do.jsp' method='post'
		enctype="multipart/form-data">
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>웹툰명</label>
			</div>
			<input class='title' id='title' name='title' autofocus>
		</div>
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>장르</label>
			</div>
			<input class='short-input' id='genre' name='genre'>
		</div>
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>작가명</label>
			</div>
			<input class='short-input' id='writer' name='writer'>
		</div>
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>작가의 말</label>
			</div>
			<textarea class='long-input' id='writerText' name='writerText'></textarea>
		</div>
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>줄거리</label>
			</div>
			<textarea class='long-input' id='summary' name='summary'></textarea>
		</div>
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>대표 이미지</label>
			</div>
			<div style='display: flex; align-items: center;'>
				<img id='mainImage' class='main-image' alt="main-image"
					src="./img/thumbnail-preview.jpg"> <label for='uploadImage'
					class='upload-image-btn'>이미지 선택</label> <input type='file'
					id='uploadImage' name='uploadImage' style='display: none'
					accept='image/*'>
			</div>
		</div>
		<div style='display: flex; justify-content: center; margin-top: 30px;'>
			<input class='button' type='submit' value='등록'>
			<button class='button'>취소</button>
		</div>
	</form>
</body>
</html>