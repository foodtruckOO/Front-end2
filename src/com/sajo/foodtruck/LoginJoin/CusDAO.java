package com.sajo.foodtruck.LoginJoin;
/*
 * DAO(Data Access Object):데이타에 접근해서 CRUD작업을
 *                         수행하는 업무처리 로직
 * 
 */
  
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.DriverManager;
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

import sun.reflect.generics.tree.BottomSignature;
 
public class CusDAO {
	//멤버변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	//생성자]
	public CusDAO(ServletContext context) {
		//커넥션 풀 미 사용-커넥션 객체 메모리에 직접 생성 코드
		/*
		try {
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
	}////////////////////////
	
	//회원여부 판단용]
		public boolean isMember(String id,String pwd) {		
			String sql="SELECT pwd FROM CUSTOMER WHERE id=?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);			
				rs = psmt.executeQuery();
				if(rs.next()) {
					String hashValue=rs.getString(1);
					if(PBKDF2.validatePassword(pwd, hashValue))
						return true;
					else return false;
				}
				return false;
			}
			catch(Exception e) {
				e.printStackTrace();
				return false; 
			}
			
		}////////////////////////////	
		
	//아이디 중복확인용
	public boolean confirmId(String id) {	
		String sql="SELECT id FROM (select id from customer union select id from seller) WHERE id=?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);			
			rs = psmt.executeQuery();
			while(rs.next()) {
				if(rs.getString("id").equals(id)) {
					return true;
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace(); 
		}
		return false;
	}/////////////////////////////	
}////////////////////////
