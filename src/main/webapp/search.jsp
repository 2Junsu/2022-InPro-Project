<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*, javax.naming.*"%>
<%
request.setCharacterEncoding("utf-8");

String type = request.getParameter("type");
String search = request.getParameter("search");

Class.forName("org.mariadb.jdbc.Driver");

String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false";

String DB_USER = "admin";
String DB_PASSWORD = "1234";

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String query = null;
try {

	con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	if (type.equals("제목")) {
		query = "select webtoon_id, title, genre, writer, uploadImage from webtoon where title like ?";
	} else {
		query = "select webtoon_id, title, genre, writer, uploadImage from webtoon where writer like ?";
	}
	pstmt = con.prepareStatement(query);
	pstmt.setString(1, "%" + search + "%");
	rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='css/main.css'>
<title>검색 결과</title>
</head>
<body style='display: flex; flex-direction: column; align-items: center;'>
	<header>
		<h1><%=type %> : "<%=search %>"에 대한 검색 결과</h1>
	</header>
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

			pstmt.close(); 

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