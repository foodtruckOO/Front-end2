package com.sajo.foodtruck.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

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
		System.out.println("T_EventDAO getSellerNo");
		
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
		System.out.println("T_EventDAO insertEvent");
		
		int affected=0;
		String sql="INSERT INTO truck_event VALUES (SEQ_TEVENT.NEXTVAL,?,?,?,?,?,?,?,sysdate)";
		try {
			psmt = conn.prepareStatement(sql);
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
	
	//이벤트 뿌리기
	public List<T_EventDTO> selectEvent(String no){
		System.out.println("T_EventDAO selectEvent");
		List<T_EventDTO> list = new Vector<T_EventDTO>();
		String sql = "SELECT title, content, titlefile, contentfile, s_date, e_date, eno FROM truck_event where s_no=? ORDER BY eno DESC";//내림차순(큰~작)
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			while(rs.next()) {
				T_EventDTO dto = new T_EventDTO();
				dto.setTitle(rs.getString(1));
				dto.setContent(rs.getString(2));
				dto.setNewTitlefile(rs.getString(3));
				dto.setNewContentfile(rs.getString(4));
				dto.setSdate(rs.getString(5).split(" ")[0]);
				dto.setEdate(rs.getString(6).split(" ")[0]);
				dto.setEno(rs.getString(7));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("T_EventDAO selectMenu error");
			e.printStackTrace();
		}
		finally {close();}				
		return list;
	}

	//이벤트 삭제
	public int deleteEvent(String eno) {
		System.out.println("T_EventDAO deleteEvent");
		int affected = 0;
		String sql = "DELETE from truck_event where eno=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, eno);
			affected = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("T_EventDAO deleteMenu error");
			e.printStackTrace();
		}
		finally {close();}				
		return affected;
	}

}
