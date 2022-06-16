package myBean.db;


import java.io.*;
import java.sql.*;
import javax.naming.NamingException;

import jakarta.servlet.*;
import myBean.db.DsCon;	//필요 패키지 선언
import java.util.*;
import myBean.multipart.*;

public class ContentDB {
	private Connection con;	
	private PreparedStatement pstmt;
	private ResultSet rs;

	public ContentDB() throws SQLException, NamingException {
		con = DsCon.getConnection();
	}
	
	public void insertRecord(ContentInfo content) throws SQLException {
		String sql = "INSERT INTO content(episode_id, webtoon_id, title, uploadThumbnail, uploadWebtoon, uploadDate, viewCnt) VALUES(?, ?, ?, ?, ?, ?, ?)";

		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, content.getEpisode());
		pstmt.setInt(2, content.getWebtoon());
		pstmt.setString(3, content.getTitle());
		pstmt.setString(4, content.getUploadThumbnail());
		pstmt.setString(5, content.getUploadWebtoon());
		pstmt.setString(6, content.getUploadDate());
	
		pstmt.executeUpdate();
	}	
	
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}
}