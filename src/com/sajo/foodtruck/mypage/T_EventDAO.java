package com.sajo.foodtruck.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class T_EventDAO {
	//멤버변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	//생성자]
	public T_EventDAO(ServletContext context) {
		try {
			InitialContext ctx = new InitialContext();
			DataSource source=(DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jndi/ft");
			try {
				conn = source.getConnection();
			} catch (SQLException e) {				
				e.printStackTrace();
			}		
		} catch (NamingException e) {			
			e.printStackTrace();
		}
	}
	
	//자원반납용]
	public void close() {
		try {
			if(rs !=null) rs.close();
			if(psmt !=null) psmt.close();
			if(conn !=null) conn.close();
		} catch (Exception e) {}
	}
	
	//s_NO 가져오기
	public String getSellerNo(String user) {
		String sql="SELECT s_no from seller where id=?";
		String result = "";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user);
			rs = psmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
		}
		catch (Exception e) {System.out.println("T_EventDAO getSellerNo");e.printStackTrace();}
		return result;
	}
	
	//이벤트 메뉴 입력용
	public int insertEvent(T_EventDTO dto) {
		int affected=0;
		System.out.println("insertEvent들어옴");
		String sql="INSERT INTO truck_event VALUES (SEQ_TEVENT.NEXTVAL,?,?,?,?,?,?,?,sysdate)";
		try {
			System.out.println("insertEvent - conn start");
			psmt = conn.prepareStatement(sql);
			System.out.println("insertEvent - conn end");
			psmt.setString(1, dto.getS_no());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getTitlefile().getOriginalFilename());
			psmt.setString(5, dto.getContentfile().getOriginalFilename());
			psmt.setString(6, dto.getSdate());
			psmt.setString(7, dto.getEdate());
			affected = psmt.executeUpdate();
		}
		catch (Exception e) {System.out.println("T_EventDAO insertEvent");e.printStackTrace();}
		finally {close();}
		return affected;
	}
	

}
