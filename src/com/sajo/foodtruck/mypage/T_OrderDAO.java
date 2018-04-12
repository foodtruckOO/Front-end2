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

public class T_OrderDAO {
	//멤버변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	//생성자]
	public T_OrderDAO(ServletContext context) {
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
	
	//푸드타입 가져오기
	public List<T_OderDTO> orderList (String sno){
		System.out.println("T_OderDAO orderList");
		List<T_OderDTO> list = new Vector<T_OderDTO>();
		try {
			String sql="select o.name,o.tel, o.timeofreceipt, o.num, f.fname, f.price, o.content from\r\n" + 
					"(select e.*,c.id name, c.tel tel from orderform e JOIN customer c ON e.g_no=c.g_no) o\r\n" + 
					"JOIN food f ON f.f_no=o.f_no where f.s_no=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, sno);
			rs = psmt.executeQuery();
			while(rs.next()) {
				T_OderDTO dto = new T_OderDTO();
				dto.setCname(rs.getString(1));
				dto.setTel(rs.getString(2));
				dto.setTimeofreceipt(rs.getString(3));
				dto.setNum(rs.getString(4));
				dto.setFname(rs.getString(5));
				dto.setPrice(rs.getString(6));
				dto.setContent(rs.getString(7));
				list.add(dto);
			}
		}
		catch (Exception e) {System.out.println("T_MenuDAO foodtype");e.printStackTrace();}
		return list;
	}
}
