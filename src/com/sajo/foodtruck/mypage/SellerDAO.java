package com.sajo.foodtruck.mypage;

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
				dto.setAddr2(rs.getString(7));
				dto.setTel(rs.getString(8));
				dto.setCorporate_no(rs.getString(rs.getString(9)));
				dto.setRegidate(rs.getDate(10));
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
			dto.setAddr2(rs.getString(7));
			dto.setTel(rs.getString(8));
			dto.setCorporate_no(rs.getString(9));
		}		
		return dto;
	}
	
	public String update(SellerDTO dto) throws SQLException{
		
		System.out.println("SellerDAO UPDATE");
				
		String result="";
		try {
			String sql="UPDATE seller SET pwd=?, name=?, tname=?, addr=?, addr2=?, tel=?, corporate_no=? WHERE id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getPwd());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getTname());
			psmt.setString(4, dto.getAddr());
			psmt.setString(5, dto.getAddr2());
			psmt.setString(6, dto.getTel());
			psmt.setString(7, dto.getCorporate_no());
			psmt.setString(8, dto.getId());
						System.out.println(dto.getPwd()+dto.getName()+dto.getTname()+dto.getAddr2()+dto.getTel()+ dto.getCorporate_no()+dto.getId());
			System.out.println(result = psmt.executeUpdate()==0?"★★ 회원정보 수정 실패 ★★":"★★ 회원정보 수정 성공 ★★");
		} 
		catch (Exception e) {System.out.println("SellerDAO UPDATE문 ERROR");}
		finally {close();}
		return result;
	}
	
}
