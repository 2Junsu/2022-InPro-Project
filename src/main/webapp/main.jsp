<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*, myBean.db.*, javax.naming.*"%>
<%
Class.forName("org.mariadb.jdbc.Driver");

String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false";

String DB_USER = "admin";
String DB_PASSWORD = "1234";

Connection con = null;
Statement stmt = null;
ResultSet rs = null;

try {

	con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	stmt = con.createStatement();
	String query = "select webtoon_id, title, genre, writer, uploadImage from webtoon";
	rs = stmt.executeQuery(query);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='css/main.css'>
<title>제이버웹툰</title>
</head>
<body
	style='display: flex; flex-direction: column; align-items: center;'>
	<header>
		<h1>제이버 웹툰</h1>
	</header>
	<div style='display: flex;'>
		<form class='search-form' action="search.jsp" method="post">
			<select class='search-filter' name='type'>
				<option value='작성자'>작성자</option>
				<option value='제목'>제목</option>
			</select> <input class='search-input' placeholder='검색어를 입력하세요.' name='search' required>
			<button type="submit" class='search-button'>검색</button>
		</form>
		<a href='upload.jsp'><button class='upload-button'>웹툰 등록</button></a>
	</div>
	<main class='main'>
		<div class='article-box'>
			<%
			while (rs.next()) {
			%>
			<article class='webtoon-article'>
				<img width='200px' height='120px'
					src='./upload/<%=rs.getString("uploadImage")%>'
					onclick="location.href='detail.jsp?id=<%=rs.getInt("webtoon_id")%>'">
				<div class='webtoon-footer'>
					<div class='webtoon-info'>
						<h5 class='title'><%=rs.getString("title")%></h5>
						<p style='all: unset;'><%=rs.getString("genre")%></p>
						<span class='writer'><%=rs.getString("writer")%></span>
					</div>
					<div style="display: flex; flex-direction: column;">
						<div>
							<span class="btn"
								onclick="location.href='modify_webtoon.jsp?id=<%=rs.getInt("webtoon_id")%>'">수정</span>
							| <span class="btn"
								onclick="location.href='delete_webtoon_do.jsp?id=<%=rs.getInt("webtoon_id")%>'">삭제</span>
						</div>
					</div>
				</div>
			</article>
			<%
			}
			rs.close(); 

			stmt.close(); 

			con.close();
			} catch (SQLException e) {
			out.print(e);
			return;
			}
			%>
		</div>
	</main>
</body>
</html>