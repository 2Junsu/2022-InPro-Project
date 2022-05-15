<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="myBean.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제이버 웹툰</title>
</head>
<body style="padding:50px 100px">
<jsp:useBean id="content" class="myBean.ContentInfo"/>
<jsp:setProperty property="*" name="content"/>
<a href='main.jsp'><img class='home-button' src='./img/home.png'
		width='50px' height='50px' alt='home'></a>
	<header class='header'>
		<div style='display: flex; align-items: center;'>
			<img
				src='./img/webtoon-main.jpg'
				alt='img' width='300px' height='180px'>
			<div style='margin: 0px 30px;'>
				<p>
					<strong style='margin: 0px 4px; font-size: 18px;'><jsp:getProperty property="episode" name="content"/>화 : <jsp:getProperty property="title" name="content"/></strong>
				</p>
					<span><jsp:getProperty property="uploadDate" name="content"/></span>
				
			</div>
		</div>
	</header>
</body>
</html>