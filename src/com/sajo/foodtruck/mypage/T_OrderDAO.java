package com.sajo.foodtruck.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
	//public List<Map<String, Object>> orderList (String sno){
		System.out.println("T_OderDAO orderList");
		List<T_OderDTO> list = new Vector<T_OderDTO>();
		//List<Map<String, Object>> listMap = new Vector<>();
		try {
			String sql="select ord.o_no, cus.name cname, cus.tel tel, food.fname fname, food.price, ord.num, ord.content from "+ 
					"food join seller sel on food.s_no=sel.s_no join orderform ord on food.f_no=ord.f_no "+ 
					"join customer cus on ord.g_no=cus.g_no where sel.id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, sno);
			rs = psmt.executeQuery();
			while(rs.next()) {
				T_OderDTO dto = new T_OderDTO();
				dto.setO_no(rs.getString(1));
				dto.setCname(rs.getString(2));
				dto.setTel(rs.getString(3));
				dto.setFname(rs.getString(4));
				dto.setPrice(rs.getString(5));
				dto.setNum(rs.getString(6));
				dto.setContent(rs.getString(7));
				list.add(dto);
				/*
				T_OrderfoodDTO food = new T_OrderfoodDTO();
				T_OrderListDTO list = new T_OrderListDTO();

				list.setCname(rs.getString(1));
				list.setTel(rs.getString(2));
				list.setTimeofreceipt(rs.getString(3));
				food.setNum(rs.getString(4));
				food.setFname(rs.getString(5));
				food.setPrice(rs.getString(6));
				list.setContent(rs.getString(7));
				
				Map<String, Object> map = new HashMap<>();
				map.put("list", list);
				map.put("food", food);
				listMap.add(map);*/
			}
		}
		catch (Exception e) {System.out.println("T_MenuDAO foodtype");e.printStackTrace();}
		return list;
	}
}
