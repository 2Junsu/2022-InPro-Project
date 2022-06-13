<%@ page contentType="text/html; charset=UTF-8" 
	import="java.sql.*, myBean.db.*, javax.naming.*, java.io.*,
		myBean.multipart.*, java.util.*" %>
<%
request.setCharacterEncoding("utf-8");	

ServletContext context = getServletContext();
String realFolder = context.getRealPath("upload");		

Collection<Part> parts = request.getParts();
MyMultiPart multiPart = new MyMultiPart(parts, realFolder);

String originalFileName="";
String savedFileName="";

if(multiPart.getMyPart("uploadImage") != null) { 
	originalFileName = multiPart.getOriginalFileName("uploadImage");
	
	savedFileName = multiPart.getSavedFileName("uploadImage"); 
}

String t=request.getParameter("title");
String g=request.getParameter("genre");
String w=request.getParameter("writer");
String wt=request.getParameter("writerText"); 
String s=request.getParameter("summary"); 

WebtoonInfo info=new WebtoonInfo();

info.setTitle(t);
info.setGenre(g);
info.setWriter(w);
info.setWriterText(wt);
info.setSummary(s);
info.setUploadImage(savedFileName);

try {
	WebtoonDB db = new WebtoonDB();	
	
	db.insertRecord(info);
	db.close();
}catch(NamingException e) {
	out.print(e);
	return;
}catch(SQLException e) {
	out.print(e);
	return;
}
response.sendRedirect("main.jsp");

%>