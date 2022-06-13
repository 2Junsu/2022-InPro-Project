<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="myBean.db.*, java.sql.*, javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='css/detail.css'>
<title>제이버 웹툰</title>
</head>
<body style='padding: 50px 100px;'>
	<%
	String webtoon_id = request.getParameter("id");

	try {
		Class.forName("org.mariadb.jdbc.Driver");

		String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false";

		Connection con = DriverManager.getConnection(DB_URL, "admin", "1234");

		String sql = "select title, genre, writer, writerText, summary, uploadImage from webtoon where webtoon_id=?";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(webtoon_id));
		ResultSet rs = pstmt.executeQuery();
		rs.next();

		String title = rs.getString("title");
		String genre = rs.getString("genre");
		String writer = rs.getString("writer");
		String writerText = rs.getString("writerText");
		String summary = rs.getString("summary");
		String uploadImage = rs.getString("uploadImage");

		sql = "select uploadThumbnail, title, episode_id, uploadDate from content where webtoon_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(webtoon_id));
		ResultSet rs2 = pstmt.executeQuery();

		rs.close();
	%>
	<a href='main.jsp'><img class='home-button' src='./img/home.png'
		width='50px' height='50px' alt='home'></a>
	<header class='header'>
		<div style='display: flex; align-items: center;'>
			<img src='./upload/<%=uploadImage%>' alt='img' width='300px'
				height='180px'>
			<div style='margin: 0px 30px;'>
				<p>
					<strong style='margin: 0px 4px; font-size: 18px;'><%=title%></strong><%=writer%>
				</p>
				<pre><%=summary%></pre>
				<p><%=genre%></p>
				<pre><%=writerText%></pre>
			</div>
		</div>
		<div>
			<a href='uploadDetail.jsp?id=<%=webtoon_id%>'><button
					class='upload-btn'>새 회차 등록</button></a>
		</div>
	</header>
	<hr style='margin: 50px 0px;'>
	<section>
		<%
		while (rs2.next()) {
		%>
		<article>
			<div
				onclick="location.href='content.jsp?id=<%=rs2.getInt("episode_id")%>'"
				style='display: flex; align-items: center; width: 50%;'>
				<img src='./upload/<%=rs2.getString("uploadThumbnail")%>' alt='img'
					width='200px' height='120px'> <strong
					style='margin: 0px 20px;'><%=rs2.getInt("episode_id")%>화
					: <%=rs2.getString("title")%></strong>
			</div>
			<div
				style='display: flex; align-items: center; justify-content: space-between; width: 50%;'>
				<span><%=rs2.getString("uploadDate")%></span>
				<div>
					<span class="btn"
						onclick="location.href='modify_content.jsp?id=<%=rs2.getInt("episode_id")%>'">수정</span>
					&nbsp;|&nbsp; <span class="btn"
						onclick="location.href='delete_content_do.jsp?id=<%=rs2.getInt("episode_id")%>&wid=<%=webtoon_id%>'">삭제</span>
				</div>
			</div>

		</article>
		<%
		}
		rs2.close();
		pstmt.close();
		con.close();
		} catch (SQLException e) {
		out.print(e);
		return;
		}
		%>
	</section>
</body>
</html>