<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,myBean.multipart.*,myBean.db.*"
	import="java.sql.*, java.io.*,javax.naming.NamingException"
	errorPage="error.jsp"%>
<%
request.setCharacterEncoding("utf-8");

String eid = request.getParameter("episode_id");
String wid = request.getParameter("webtoon_id");
String t = request.getParameter("title");
String ud = request.getParameter("uploadDate");

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

//썸네일만 바꾼 경우
if (multiPart.getMyPart("uploadThumbnail") != null && multiPart.getMyPart("uploadWebtoon")== null) {
	sql = "select uploadThumbnail from content where episode_id=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(eid));
	rs = pstmt.executeQuery();
	rs.next();
	String oldFileName = rs.getString("uploadThumbnail");

	File oldFile = new File(realFolder + File.separator + oldFileName);
	oldFile.delete();

	sql = "update content set title=?, uploadDate=?, uploadThumbnail=? where episode_id=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, t);
	pstmt.setString(2, ud);
	pstmt.setString(3, multiPart.getSavedFileName("uploadThumbnail"));
	pstmt.setInt(4, Integer.parseInt(eid));

}
//웹툰 내용만 바꾼 경우
else if (multiPart.getMyPart("uploadWebtoon") != null && multiPart.getMyPart("uploadThumbnail")==null) {
	sql = "select uploadWebtoon from content where episode_id=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(eid));
	rs = pstmt.executeQuery();
	rs.next();
	String oldFileName = rs.getString("uploadWebtoon");

	File oldFile = new File(realFolder + File.separator + oldFileName);
	oldFile.delete();

	sql = "update content set title=?, uploadDate=?, uploadWebtoon=? where episode_id=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, t);
	pstmt.setString(2, ud);
	pstmt.setString(3, multiPart.getSavedFileName("uploadWebtoon"));
	pstmt.setInt(4, Integer.parseInt(eid));

}
//둘 다 안 바꾼 경우
else if (multiPart.getMyPart("uploadWebtoon") == null && multiPart.getMyPart("uploadThumbnail") == null) {
	sql = "update content set title=?, uploadDate=? where episode_id=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, t);
	pstmt.setString(2, ud);
	pstmt.setInt(3, Integer.parseInt(eid));
}
//둘 다 바꾼 경우
else {
	sql = "select uploadWebtoon from content where episode_id=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(eid));
	rs = pstmt.executeQuery();
	rs.next();
	String oldFileName = rs.getString("uploadWebtoon");

	File oldFile = new File(realFolder + File.separator + oldFileName);
	oldFile.delete();
	
	sql = "select uploadThumbnail from content where episode_id=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(eid));
	rs = pstmt.executeQuery();
	rs.next();
	String oldFileName2 = rs.getString("uploadThumbnail");

	File oldFile2 = new File(realFolder + File.separator + oldFileName2);
	oldFile2.delete();

	sql = "update content set title=?, uploadDate=?, uploadWebtoon=?, uploadThumbnail=? where episode_id=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, t);
	pstmt.setString(2, ud);
	pstmt.setString(3, multiPart.getSavedFileName("uploadWebtoon"));
	pstmt.setString(4, multiPart.getSavedFileName("uploadThumbnail"));
	pstmt.setInt(5, Integer.parseInt(eid));
}

pstmt.executeUpdate();

if (pstmt != null)
	pstmt.close();
if (rs != null)
	rs.close();
if (con != null)
	con.close();

response.sendRedirect("detail.jsp?id="+wid);
%>