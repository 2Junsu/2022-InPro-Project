<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="myBean.db.*, java.sql.*, javax.naming.*"%>
<%
String webtoon_id = request.getParameter("id");
try {
	Class.forName("org.mariadb.jdbc.Driver");
	
	String DB_URL ="jdbc:mariadb://localhost:3306/webtoon?useSSL=false";

	Connection con = DriverManager.getConnection(DB_URL,"admin","1234");  

	String sql="select title, genre, writer, writerText, summary, uploadImage from webtoon where webtoon_id=?";
		
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setInt(1, Integer.parseInt(webtoon_id));

	ResultSet rs = pstmt.executeQuery();
	rs.next();

	String title=rs.getString("title");
	String genre=rs.getString("genre");
	String writer=rs.getString("writer");
	String writerText=rs.getString("writerText");
	String summary=rs.getString("summary");
	String uploadImage=rs.getString("uploadImage");
	
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
window.onload = function() {
	//이미지 미리보기 구현
	document.getElementById('uploadImage').addEventListener(
			'change',
			function(e) {
				document.getElementById("mainImage").src = URL.createObjectURL(e.target.files[0])
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
	<form class='form' action='modify_webtoon_do.jsp' method='post' enctype="multipart/form-data">
		<input type="hidden" name="id" value="<%=webtoon_id %>">
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>웹툰명</label>
			</div>
			<input class='title' id='title' name='title'
				value="<%=title%>" autofocus>
		</div>
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>장르</label>
			</div>
			<input class='short-input' id='genre' name='genre'
				value="<%=genre%>">
		</div>
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>작가명</label>
			</div>
			<input class='short-input' id='writer' name='writer'
				value="<%=writer%>">
		</div>
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>작가의 말</label>
			</div>
			<textarea class='long-input' id='writerText' name='writerText'><%=writerText%></textarea>
		</div>
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>줄거리</label>
			</div>
			<textarea class='long-input' id='summary' name='summary'><%=summary%></textarea>
		</div>
		<div class='input-wrap'>
			<div style='width: 120px;'>
				<label>대표 이미지</label>
			</div>
			<div style='display: flex; align-items: center;'>
				<img id='mainImage' class='main-image' alt="main-image"
					src="./upload/<%=uploadImage %>"> <label for='uploadImage'
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
<%
}catch(SQLException e) {
	out.print(e);
	return;
}
%>