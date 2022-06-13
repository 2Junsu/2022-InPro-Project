<%@ page contentType="text/html; charset=UTF-8" 
	import="java.sql.*, myBean.db.*, javax.naming.*, java.io.*,
		myBean.multipart.*, java.util.*" %>
<%
request.setCharacterEncoding("utf-8");

ServletContext context = getServletContext();
String realFolder = context.getRealPath("upload");		

Collection<Part> parts = request.getParts();
MyMultiPart multiPart = new MyMultiPart(parts, realFolder);

String uploadThumbnail="";
String uploadWebtoon="";

if(multiPart.getMyPart("uploadThumbnail") != null) { 
	uploadThumbnail = multiPart.getSavedFileName("uploadThumbnail"); 
}

if(multiPart.getMyPart("uploadWebtoon") != null) {
	uploadWebtoon = multiPart.getSavedFileName("uploadWebtoon"); 
}

String webtoon_id=request.getParameter("webtoon_id");
String t=request.getParameter("title");
String ud=request.getParameter("uploadDate");

ContentInfo info=new ContentInfo();

info.setWebtoon(Integer.parseInt(webtoon_id));
info.setTitle(t);
info.setUploadDate(ud);
info.setUploadThumbnail(uploadThumbnail);
info.setUploadWebtoon(uploadWebtoon);

try {
	ContentDB db = new ContentDB();
	
	db.insertRecord(info);	
	db.close();	
}catch(NamingException e) {
	out.print(e);
	return;
}catch(SQLException e) {
	out.print(e);
	return;
}

response.sendRedirect("detail.jsp?id="+webtoon_id);

%>