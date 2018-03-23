package com.sajo.foodtruck.member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class SellerDAO {
	//멤버변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	//생성자]
	public SellerDAO(ServletContext context) {
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


	public List<SellerDTO> selectList(){
		List<SellerDTO> list = new Vector<SellerDTO>();
		String sql="SELECT * FROM seller";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				SellerDTO dto = new SellerDTO();
				dto.setS_no(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setPwd(rs.getString(3));
				dto.setName(rs.getString(4));
				dto.setTname(rs.getString(5));
				dto.setAddr(rs.getString(6));
				dto.setTel(rs.getString(7));
				dto.setCorporate_no(rs.getString(rs.getString(8)));
				dto.setRegidate(rs.getDate(9));
				list.add(dto);
			}
		}
		catch(Exception e) {e.printStackTrace();}
		return list;
	}
	
	public SellerDTO selectOne(String id) throws SQLException{
		String sql = "SELECT * FROM seller WHERE id=?";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, id);
		rs = psmt.executeQuery();
		SellerDTO dto = new SellerDTO();;
		if(rs.next()) {
			dto.setId(rs.getString(2));
			System.out.println((String)dto.getId());
			dto.setPwd(rs.getString(3));
			dto.setName(rs.getString(4));
			dto.setTname(rs.getString(5));
			dto.setAddr(rs.getString(6));
			dto.setTel(rs.getString(7));
			dto.setCorporate_no(rs.getString(8));
		}		
		return dto;
	}
	
	public int update(SellerDTO dto) throws SQLException{
		int affected=0;
		try {
			String sql="UPDATE seller SET pwd=?, tname=?, addr=?, tel=?, corporate_no=? WHERE id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getPwd());
			psmt.setString(2, dto.getTname());
			psmt.setString(3, dto.getAddr());
			psmt.setString(4, dto.getTel());
			psmt.setString(5, dto.getCorporate_no());
			psmt.setString(6, dto.getId());
			affected = psmt.executeUpdate();			
		} 
		catch (Exception e) {System.out.println("SellerDAO UPDATE문 ERROR");}
		finally {close();}
		return affected;
	}
	
}
