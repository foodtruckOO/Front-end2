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

public class CusDAO {

	//멤버변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	//생성자]
	public CusDAO(ServletContext context) {
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

	

	public CusDTO selectOne(String id) throws SQLException{
		String sql = "SELECT * FROM customer WHERE id=?";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, id);
		rs = psmt.executeQuery();
		CusDTO dto = new CusDTO();;
		if(rs.next()) {
			dto.setCno(rs.getString(1));
			dto.setId(rs.getString(2));
			dto.setPwd(rs.getString(3));
			dto.setName(rs.getString(4));
			dto.setTel(rs.getString(5));			
		}		
		return dto;
	}
	
	public List<T_OderformDTO> order(String no){
		List<T_OderformDTO> list = new Vector<>();
		try {
			String sql=" select n.*, s.tname tname, s.tel tel from ("+
					" (select o.*, f.fname fname, f.price price, f.s_no s_no from orderform o JOIN food f ON o.f_no=f.f_no)"+
					" n JOIN seller s ON n.s_no=s.s_no) where g_no=?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				T_OderformDTO dto = new T_OderformDTO();
				dto.setTname(rs.getString(12));
				dto.setTel(rs.getString(13));
				dto.setFname(rs.getString(9));
				dto.setPrice(rs.getString(10));
				dto.setNum(rs.getString(4));
				dto.setTimeofreceipt(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setConfirm(rs.getString(8));
				dto.setPostdate(rs.getString(7));
				list.add(dto);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
