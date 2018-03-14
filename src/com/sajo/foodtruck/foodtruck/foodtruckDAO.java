package com.sajo.foodtruck.foodtruck;
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


public class foodtruckDAO {
	//멤버변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	//생성자]
	public foodtruckDAO(ServletContext context) {
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
			DataSource source=(DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jdbc/FT");
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
	////////////////////////////
	//전체 목록 가져오기]
	/*
	 * 페이징 로직 추가하기
	 * DAO에서 할일
	 * 1. 전체목록 쿼리를 구간 쿼리로 변경
	 * 2. 총 레코드수 구하는 메소드 추가
	 * 
	 * 
	 */
	public List<foodtruckDTO> selectList(){
		List<foodtruckDTO> list = new Vector<foodtruckDTO>();
		//페이징 미 적용
		String sql="SELECT S.*, t.MAIN_IMG from SELLER s JOIN TRUCKPAGE t on s.s_no=t.s_no";
		
		//페이징 적용-구간쿼리로 변경
		//검색용 쿼리 추가
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
			foodtruckDTO dto = new foodtruckDTO();
			dto.setS_no(rs.getString(1));
			dto.setTname(rs.getString(5));
			dto.setImg(rs.getString(10));
			dto.setRegidate(rs.getDate(9));
			dto.setAddr(rs.getString(6));
			dto.setId(rs.getString(2));
			list.add(dto);
			}////////////while
		}///try
		catch(Exception e) {e.printStackTrace();}
		
		return list;
	}//////////////////////////////
	
	
	public List<foodtruckDTO> selectImg(String key) {
		
		List<foodtruckDTO> list = new Vector<foodtruckDTO>();
		String sql = "SELECT S.*, t.MAIN_IMG,t.INTRO from SELLER s JOIN TRUCKPAGE t on s.s_no=t.s_no where s.s_no =? " ;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				foodtruckDTO dto = new foodtruckDTO();
				dto.setId(rs.getString(2));
				dto.setTname(rs.getString(5));
				dto.setImg(rs.getString(10));
				dto.setIntro(rs.getString(11));
				list.add(dto);
			}
			
		}
		catch(Exception e) {e.printStackTrace();}
		
		sql="SELECT S.*, IMG from SELLER s JOIN IMAGES i on s.s_no=i.s_no where s.s_no = ? ";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);			
			rs = psmt.executeQuery();
		
			while(rs.next()) {
				foodtruckDTO dto = new foodtruckDTO();
				dto.setId(rs.getString(2));
				dto.setTname(rs.getString(5));
				dto.setImg(rs.getString(10));
				list.add(dto);
			}
		
		}
		catch(Exception e) {e.printStackTrace();}
		
		return list;
	}
	
	/////////////////////////////////////////

}
