package com.sajo.foodtruck.map;
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
 
public class mapDAO {
	//멤버변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	//생성자]
	public mapDAO(ServletContext context) {
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

	
	//전체 목록 가져오기]
	/*
	 * 페이징 로직 추가하기
	 * DAO에서 할일
	 * 1. 전체목록 쿼리를 구간 쿼리로 변경
	 * 2. 총 레코드수 구하는 메소드 추가
	 * 
	 * 
	 */
	public List<mapDTO> selectList(int start,int end){
		
		List<mapDTO> list = new Vector<mapDTO>();
		String sql="select S.S_NO,S.TNAME,S.ADDR,S.TEL from (SELECT T.*,ROWNUM R FROM (SELECT * FROM SELLER ORDER BY REGIDATE DESC) T) S WHERE R BETWEEN ? AND ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			rs = psmt.executeQuery();
	
			while(rs.next()) {
				mapDTO dto = new mapDTO();
				dto.setS_no(rs.getString(1));
				dto.setTname(rs.getString(2));
				dto.setAddr(rs.getString(3));
				dto.setTel(rs.getString(4));
				
				list.add(dto);
			}////////////while
		}///try
		catch(Exception e) {e.printStackTrace();}
		
		return list;
	}//////////////////////////////
	
	
	public List<mapDTO> selectAllList(){
		
		List<mapDTO> list = new Vector<mapDTO>();
		String sql="select S_NO,TNAME,ADDR,TEL FROM SELLER";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
	
			while(rs.next()) {
				mapDTO dto = new mapDTO();
				dto.setS_no(rs.getString(1));
				dto.setTname(rs.getString(2));
				dto.setAddr(rs.getString(3));
				dto.setTel(rs.getString(4));
				
				list.add(dto);
			}////////////while
		}///try
		catch(Exception e) {e.printStackTrace();}
		
		return list;
	}//////////////////////////////	
	
	//전체 레코드수 얻기용
	public int getTotalRecordCount() {
		int total = 0 ;
		
		String sql = "SELECT COUNT(*) FROM SELLER";
		try{
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt(1);
			}
		}catch(Exception e) {e.printStackTrace();}
		
		return total;
	}
}
