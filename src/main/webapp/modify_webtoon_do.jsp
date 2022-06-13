<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,myBean.multipart.*,myBean.db.*"
	import="java.sql.*, java.io.*,javax.naming.NamingException"
	errorPage="error.jsp"%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String t = request.getParameter("title");
String g = request.getParameter("genre");
String w = request.getParameter("writer");
String wt = request.getParameter("writerText");
String s = request.getParameter("summary");

ServletContext context = getServletContext();
String realFolder = context.getRealPath("upload");

Collection<Part> parts = request.getParts();
MyMultiPart multiPart = new MyMultiPart(parts, realFolder);

Class.forName("org.mariadb.jdbc.Driver");
String url = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false";
Connection con = DriverManager.getConnection(url, "admin", "1234");
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = null;

if(multiPart.getMyPart("uploadImage") != null) { 
	sql = "select uploadImage from webtoon where webtoon_id=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(id));
	rs = pstmt.executeQuery();
	rs.next();
	String oldFileName = rs.getString("uploadImage");
	
	File oldFile = new File(realFolder + File.separator + oldFileName);
	oldFile.delete();
	
	sql = "update webtoon set title=?, genre=?, writer=?, writerText=?, summary=?, uploadImage=? where webtoon_id=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, t);
	pstmt.setString(2, g);
	pstmt.setString(3, w);
	pstmt.setString(4, wt);
	pstmt.setString(5, s);
	pstmt.setString(6, multiPart.getSavedFileName("uploadImage"));
	pstmt.setInt(7, Integer.parseInt(id));
	
} else { 
	sql = "update webtoon set title=?, genre=?, writer=?, writerText=?, summary=? where webtoon_id=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, t);
	pstmt.setString(2, g);
	pstmt.setString(3, w);
	pstmt.setString(4, wt);
	pstmt.setString(5, s);
	pstmt.setInt(6, Integer.parseInt(id));
}

pstmt.executeUpdate();

if(pstmt != null) pstmt.close();
if(rs != null) rs.close();
if(con != null) con.close();

response.sendRedirect("main.jsp");
%>