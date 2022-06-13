package myBean.db;


import java.io.*;
import java.sql.*;
import javax.naming.NamingException;

import jakarta.servlet.*;
import myBean.db.DsCon;	//필요 패키지 선언
import java.util.*;
import myBean.multipart.*;

public class WebtoonDB {
	private Connection con;	
	private PreparedStatement pstmt;
	private ResultSet rs;

	//1. 생성자 선언 : Connection 인스턴스가 생성되도록 한다.
	public WebtoonDB() throws SQLException, NamingException {
		con = DsCon.getConnection();
	}
	
	public void insertRecord(WebtoonInfo webtoon) throws SQLException {
		String sql = "INSERT INTO webtoon(webtoon_id, title, genre, writer, writerText, summary, uploadImage) VALUES(?, ?, ?, ?, ?, ?, ?)";

		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, webtoon.getId());
		pstmt.setString(2, webtoon.getTitle());
		pstmt.setString(3, webtoon.getGenre());
		pstmt.setString(4, webtoon.getWriter());
		pstmt.setString(5, webtoon.getWriterText());
		pstmt.setString(6, webtoon.getSummary());
		pstmt.setString(7, webtoon.getUploadImage());
	
		pstmt.executeUpdate();
	}	

	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}
}