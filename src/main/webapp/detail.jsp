<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="myBean.WebtoonInfo"%>
<%
request.setCharacterEncoding("utf-8");
 
String t=request.getParameter("title");
String g=request.getParameter("genre");
String w=request.getParameter("writer");
String wt=request.getParameter("writerText"); 
String s=request.getParameter("summary"); 
String ui=request.getParameter("uploadImage");

WebtoonInfo info=new WebtoonInfo();

info.setTitle(t);
info.setGenre(g);
info.setWriter(w);
info.setWriterText(wt);
info.setSummary(s);
info.setUploadImage(ui);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='css/detail.css'>
<title>제이버 웹툰</title>
</head>
<body style='padding: 50px 100px;'>
<a href='main.jsp'><img class='home-button' src='./img/home.png'
		width='50px' height='50px' alt='home'></a>
	<header class='header'>
		<div style='display: flex; align-items: center;'>
			<img
				src='./img/webtoon-main.jpg'
				alt='img' width='300px' height='180px'>
			<div style='margin: 0px 30px;'>
				<p>
					<strong style='margin: 0px 4px; font-size: 18px;'><%=info.getTitle() %></strong><%=info.getWriter() %>
				</p>
				<pre><%=info.getSummary() %></pre>
				<p><%=info.getGenre() %></p>
				<pre><%=info.getWriterText() %></pre>
			</div>
		</div>
		<div>
			<a href='uploadDetail.jsp'><button class='upload-btn'>새 회차 등록</button></a>
		</div>
	</header>
	<hr style='margin: 50px 0px;'>
	<section>
		<article>
			<div
				style='display: flex; align-items: center; width: 50%;'>
				<img
					src='./img/webtoon-main.jpg'
					alt='img' width='200px' height='120px'>
					<strong style='margin: 0px 20px;'>1화 : 모험의 시작</strong>
			</div>
			<div
				style='display: flex; align-items: center; justify-content: space-between; width: 50%;'>
				<span>2022.04.13</span>
				<div>
					<span>수정</span>&nbsp;|&nbsp;<span>삭제</span>
				</div>
			</div>

		</article>
		<article>
			<div
				style='display: flex; align-items: center; width: 50%;'>
				<img
					src='./img/webtoon-main.jpg'
					alt='img' width='200px' height='120px'>
					<strong style='margin: 0px 20px;'>1화 : 모험의 시작</strong>
			</div>
			<div
				style='display: flex; align-items: center; justify-content: space-between; width: 50%;'>
				<span>2022.04.13</span>
				<div>
					<span>수정</span>&nbsp;|&nbsp;<span>삭제</span>
				</div>
			</div>

		</article>
		<article>
			<div
				style='display: flex; align-items: center; width: 50%;'>
				<img
					src='./img/webtoon-main.jpg'
					alt='img' width='200px' height='120px'>
					<strong style='margin: 0px 20px;'>1화 : 모험의 시작</strong>
			</div>
			<div
				style='display: flex; align-items: center; justify-content: space-between; width: 50%;'>
				<span>2022.04.13</span>
				<div>
					<span>수정</span>&nbsp;|&nbsp;<span>삭제</span>
				</div>
			</div>

		</article>
		<article>
			<div
				style='display: flex; align-items: center; width: 50%;'>
				<img
					src='./img/webtoon-main.jpg'
					alt='img' width='200px' height='120px'>
					<strong style='margin: 0px 20px;'>1화 : 모험의 시작</strong>
			</div>
			<div
				style='display: flex; align-items: center; justify-content: space-between; width: 50%;'>
				<span>2022.04.13</span>
				<div>
					<span>수정</span>&nbsp;|&nbsp;<span>삭제</span>
				</div>
			</div>

		</article>
	</section>
</body>
</html>