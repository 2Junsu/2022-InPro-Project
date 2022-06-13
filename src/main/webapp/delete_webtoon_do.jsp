<%@ page contentType="text/html;charset=utf-8"
	import="java.sql.*, myBean.db.*, javax.naming.*,java.io.*"%>
<%
request.setCharacterEncoding("utf-8");

String webtoon_id = request.getParameter("id");

try {
	Class.forName("org.mariadb.jdbc.Driver");

	String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false";

	Connection con = DriverManager.getConnection(DB_URL, "admin", "1234");

	String sql = "select uploadImage from webtoon where webtoon_id=?";

	PreparedStatement pstmt = con.prepareStatement(sql);

	pstmt.setInt(1, Integer.parseInt(webtoon_id));

	ResultSet rs = pstmt.executeQuery();
	rs.next();
	
	String filename = rs.getString("uploadImage");
	 
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath("upload");
	
	File file = new File(realFolder + File.separator + filename);
	
	file.delete();
	
	sql = "delete from webtoon where webtoon_id=?";
	
	pstmt = con.prepareStatement(sql);
	
	pstmt.setInt(1, Integer.parseInt(webtoon_id));
	
	pstmt.executeUpdate();
	
} catch (SQLException e) {
	out.print(e);
	return;
} catch (Exception e) { 
	out.println(e.toString());
	return;
}

response.sendRedirect("main.jsp");
%>