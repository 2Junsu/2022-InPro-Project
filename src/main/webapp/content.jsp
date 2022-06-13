<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*, javax.naming.*"%>
<%
String episode_id=request.getParameter("id");

try {
	Class.forName("org.mariadb.jdbc.Driver");

	String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false";

	Connection con = DriverManager.getConnection(DB_URL, "admin", "1234");

	String sql = "select title, uploadThumbnail, uploadWebtoon, uploadDate from content where episode_id=?";

	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(episode_id));
	ResultSet rs = pstmt.executeQuery();
	rs.next();

	String title = rs.getString("title");
	String uploadThumbnail = rs.getString("uploadThumbnail");
	String uploadWebtoon = rs.getString("uploadWebtoon");
	String uploadDate = rs.getString("uploadDate");

	rs.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제이버 웹툰</title>
</head>
<body style="padding:50px 100px">
<a href='main.jsp'><img class='home-button' src='./img/home.png'
		width='50px' height='50px' alt='home'></a>
	<header class='header'>
		<h1><%=episode_id %>화 : <%=title %></h1>
	</header>
	<hr>
	<main style="margin-top:50px">
	<img src="./upload/<%=uploadWebtoon %>" alt="webtoon" width="100%" height="100%">
	</main>
</body>
</html>
<%
}catch(SQLException e) {
	out.print(e);
	return;
}
%>