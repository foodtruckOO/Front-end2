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

public class T_MenuDAO {
	//멤버변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	//생성자]
	public T_MenuDAO(ServletContext context) {
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

	//푸드타입 가져오기
	public List<T_Menu_TypeDTO> foodtype (){
		System.out.println("T_MenuDAO foodtype");
		
		List<T_Menu_TypeDTO> list = new Vector<T_Menu_TypeDTO>();
		try {
			String sql="SELECT * FROM foodtype";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				T_Menu_TypeDTO dto = new T_Menu_TypeDTO();
				dto.setTno(rs.getString(1));
				dto.setType(rs.getString(2));
				list.add(dto);
			}
		}
		catch (Exception e) {System.out.println("T_MenuDAO foodtype");e.printStackTrace();}
		finally {close();}			
		return list;
	}

	//s_NO 가져오기
	public String getSellerNo(String user) {
		System.out.println("T_MenuDAO getSellerNo");
		
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
		catch (Exception e) {System.out.println("T_MenuDAO getSellerNo");e.printStackTrace();}
		return result;
	}
	
	//메뉴등록
	public int insertMenu(T_Menu_FoodDTO dto) {
		System.out.println("T_MenuDAO insertMenu");
		
		int affected = 0;
		String sql="INSERT INTO food VALUES (SEQ_FOOD.NEXTVAL,?,?,?,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getSno());
			psmt.setString(2, dto.getTno());
			psmt.setString(3, dto.getFname());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getNewPicture());
			psmt.setString(6, dto.getPrice());
			affected = psmt.executeUpdate();
		}
		catch (Exception e) {System.out.println("T_MenuDAO insertMenu");e.printStackTrace();}
		finally {close();}				
		return affected;
	}
	

}
