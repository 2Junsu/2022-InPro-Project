<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8" import="java.sql.*, javax.naming.*"%>
<%
String episode_id=request.getParameter("id");
try {
	Class.forName("org.mariadb.jdbc.Driver");
	
	String DB_URL ="jdbc:mariadb://localhost:3306/webtoon?useSSL=false";

	Connection con = DriverManager.getConnection(DB_URL,"admin","1234");  

	String sql="select title, uploadThumbnail, uploadWebtoon, webtoon_id from content where episode_id=?";
		
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setInt(1, Integer.parseInt(episode_id));

	ResultSet rs = pstmt.executeQuery();
	rs.next();

	String webtoon_id=rs.getString("webtoon_id");
	String title=rs.getString("title");
	String uploadThumbnail=rs.getString("uploadThumbnail");
	String uploadWebtoon=rs.getString("uploadWebtoon");
	
	rs.close();
	pstmt.close();
	con.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='css/upload.css'>
<title>제이버 웹툰</title>
<script>
window.onload=function(){
	var date=new Date().toLocaleString()
	//등록일을 현재 날짜로 고정
	document.getElementById('uploadDate').value=date
	
	//이미지 미리보기 구현
	document.getElementById('uploadThumbnail').addEventListener('change',function(e){
		document.getElementById("thumbnail").src=URL.createObjectURL(e.target.files[0])
	})
	
	//웹툰 그림 파일 미리보기 구현
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
	<form class='form' action="modify_content_do.jsp" method="post" enctype="multipart/form-data">
		<input type='hidden' name="episode_id" value="<%=episode_id %>">
		<input type='hidden' name="webtoon_id" value="<%=webtoon_id %>">
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>수정일</label>
			</div>
			<input type="text" id='uploadDate' name='uploadDate' readonly>
		</div>
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>회차 제목</label>
			</div>
			<input class='title' id='title' name='title' value="<%=title %>">
		</div>
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>썸네일</label>
			</div>
			<div style='display:flex;align-items:center;'>
				<img class='main-image' alt="main-image" id='thumbnail'
				src="./upload/<%=uploadThumbnail %>">
			<label for='uploadThumbnail' class='upload-image-btn'>이미지 선택</label>
			<input type='file' id='uploadThumbnail' name='uploadThumbnail' style='display: none' accept='image/*'>
			</div>
		</div>
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>웹툰 내용</label>
			</div>
			<div style='display:flex;align-items:center;'>
				<img class='main-image' alt="main-image" id='webtoon'
				src="./upload/<%=uploadWebtoon %>">
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
<%
}catch(SQLException e) {
	out.print(e);
	return;
}
%>