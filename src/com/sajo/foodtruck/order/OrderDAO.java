package com.sajo.foodtruck.order;

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

public class OrderDAO {

	private Connection conn;
	private ResultSet rs;
	private ResultSet rs2;
	private PreparedStatement psmt;
	private PreparedStatement psmt2;
	//생성자]
	public OrderDAO(ServletContext context) {
		//커넥션 풀 미 사용-커넥션 객체 메모리에 직접 생성 코드
		
	/*	try {
			//드라이버 로딩]
			Class.forName(context.getInitParameter("ORACLE_DRIVER"));
			//데이타베이스 연결]
			conn = DriverManager.getConnection(context.getInitParameter("ORACLE_URL"),"FT","FT");
		}
		catch(Exception e) {
			e.printStackTrace();
		}*/
		
		//커넥션 풀 사용:톰켓이 생성해 놓은 커넥션 객체 풀에서 가져다 쓰기
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
		
	}////////////////////
	//자원반납용]
	public void close() {
		try {
			if(rs !=null) rs.close();
			if(rs2 !=null) rs2.close();
			if(psmt !=null) psmt.close();
			if(psmt2 !=null) psmt2.close();
			if(conn !=null) conn.close();
		} catch (Exception e) {}
	}
	
	public List order(String user,String time, String ordertype, String text) {
		List list = new Vector<>();
		String g_no = null;
		int type = 0 ;
		String price = null;
		String num = null ;
		String f_no = null;
		String s_no = null;
		int priceall = 0 ;
		
		OrderDTO dto = new OrderDTO();
		switch(ordertype) {
			
		case "mobile" :
			type = 1;
			break ;
		case "card" :
			type = 2;
			break ;
		case "cardDirect" :
			type = 3;
			break;
		case "cash" :
			type = 4;
			break;
		}

		
		String sql = "select g_no from customer where id = ?";
		try {
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, user);
		rs = psmt.executeQuery();
		if(rs.next()) {
			dto = new OrderDTO();
			g_no = rs.getString(1);
		}
		}catch(Exception e) {e.printStackTrace();}
		
		sql = "select c.f_no,c.num,f.price,f.fname from cart c join food f on c.f_no = f.f_no where g_no = ?";  
		try {
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, g_no);
		rs = psmt.executeQuery();
		if(rs.next()) {
			dto = new OrderDTO();
			f_no = rs.getString(1);
			dto.setF_no(f_no);
			num = rs.getString(2);
			dto.setNum(num);
			price = rs.getString(3);
			dto.setPrice(price);
			dto.setFname(rs.getString(4));
			list.add(dto);		
			sql = "insert into orderform values(seq_o_no.nextval,?,?,?,?,?,sysdate)";
			
		    psmt2 = conn.prepareStatement(sql);
			
			psmt2.setString(1, g_no);
			psmt2.setString(2, f_no);
			psmt2.setString(3, num);
			psmt2.setString(4, time);
			psmt2.setString(5, text);
			psmt2.executeUpdate();
			
			priceall = priceall + Integer.parseInt(num) * Integer.parseInt(price);
		}
		while(rs.next()) {
			dto = new OrderDTO();
			f_no = rs.getString(1);
			dto.setF_no(f_no);
			num = rs.getString(2);
			dto.setNum(num);
			price = rs.getString(3);
			dto.setPrice(price);
			dto.setFname(rs.getString(4));
			list.add(dto);	
			sql = "insert into orderform values(seq_o_no.curval,?,?,?,?,?,sysdate)";
			psmt2.setString(1, g_no);
			psmt2.setString(2, f_no);
			psmt2.setString(3, num);
			psmt2.setString(4, time);
			psmt2.setString(5, text);
			psmt2.executeUpdate();
			priceall = priceall + Integer.parseInt(num) * Integer.parseInt(price);
		}
		
		dto = new OrderDTO();
		dto.setTime(time);
		dto.setId(user);
		dto.setContents(text);
		dto.setOrdertype(((Integer)type).toString());
		dto.setPriceall(((Integer)priceall).toString());
		
		sql ="select s.s_no from seller s join food f on s.s_no = f.s_no where f.f_no = ?";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, f_no);
		rs = psmt.executeQuery();
			if(rs.next()) {
				s_no = rs.getString(1);
			}
		
		sql = "select tname,addr,addr2 from seller where s_no = ?";	
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, s_no);
		rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setTname(rs.getString(1));
				dto.setAddr(rs.getString(2)+" "+rs.getString(3));
			}
			
		sql = "select tel from customer where id = ?";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, user);
		rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setTel(rs.getString(1));
			}
		}catch(Exception e) {e.printStackTrace();}
		
		list.add(dto);
		
		sql = "delete cart where g_no = ?";
		try {
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, g_no);
		psmt.executeUpdate();
		}catch(Exception e) {e.printStackTrace();}
		return list;
	}
	
	
}
