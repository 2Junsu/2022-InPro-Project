<%@ page contentType="text/html;charset=utf-8"
	import="java.sql.*, myBean.db.*, javax.naming.*,java.io.*"%>
<%
request.setCharacterEncoding("utf-8");

String episode_id = request.getParameter("id");
String webtoon_id = request.getParameter("wid");

try {
	Class.forName("org.mariadb.jdbc.Driver");

	String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false";

	Connection con = DriverManager.getConnection(DB_URL, "admin", "1234");

	String sql = "select uploadThumbnail, uploadWebtoon from content where episode_id=?";

	PreparedStatement pstmt = con.prepareStatement(sql);

	pstmt.setInt(1, Integer.parseInt(episode_id));

	ResultSet rs = pstmt.executeQuery();
	rs.next();
	
	String filename = rs.getString("uploadThumbnail");
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath("upload");
	File file = new File(realFolder + File.separator + filename);
	file.delete();
	
	filename = rs.getString("uploadWebtoon");
	context = getServletContext();
	realFolder = context.getRealPath("upload");
	file = new File(realFolder + File.separator + filename);
	file.delete();
	
	sql = "delete from content where episode_id=?";
	
	pstmt = con.prepareStatement(sql);
	
	pstmt.setInt(1, Integer.parseInt(episode_id));
	
	pstmt.executeUpdate();
	
} catch (SQLException e) {
	out.print(e);
	return;
} catch (Exception e) { 
	out.println(e.toString());
	return;
}

response.sendRedirect("detail.jsp?id="+webtoon_id);
%>