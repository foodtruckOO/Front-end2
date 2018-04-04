package com.sajo.foodtruck.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class CartDAO {

	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	//생성자]
	public CartDAO(ServletContext context) {
		//커넥션 풀 미 사용-커넥션 객체 메모리에 직접 생성 코드
		
		/*try {
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
			if(psmt !=null) psmt.close();
			if(conn !=null) conn.close();
		} catch (Exception e) {}
	}
	
	public void insert(String f_no, String user) {
		String sql = "select g_no from customer where id=?";
		String g_no = null ; 
		try {
			psmt= conn.prepareStatement(sql);
			psmt.setString(1, user);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				g_no = rs.getString(1);
			}
		}catch(Exception e) {e.printStackTrace();}
		
		
		
		
		sql = "select num from cart where f_no=?";
		String num = null ;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, f_no);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
			num=rs.getString(1);
			}
			if(num==null) {
				sql = "insert into cart values(?,?,?)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, g_no);
				psmt.setString(2, f_no);
				psmt.setInt(3, 1);
				psmt.executeUpdate();
			}
			else {
				sql = "update cart set num=? where f_no = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, (Integer.parseInt(num)+1));
				psmt.setString(2, f_no);
				psmt.executeUpdate();
			}
		}
		catch(Exception e) {e.printStackTrace();}
	}
}
