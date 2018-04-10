package com.sajo.foodtruck.review;
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


public class ReviewDAO {
	//멤버변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	//생성자]
	public ReviewDAO(ServletContext context) {
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
	public List<ReviewDTO> selectList(String s_no,int start,int end){
		List<ReviewDTO> list = new Vector<ReviewDTO>();
		//페이징 미 적용
		String sql="select g.star,g.onememo,c.name,g.postdate from (select t.*,rownum r from (select * from review order by postdate desc) t) g join customer c on g.g_no = c.g_no   where r between ? and ? and s_no = ?";
		//페이징 적용-구간쿼리로 변경
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			psmt.setString(3, s_no);
			rs = psmt.executeQuery();
			while(rs.next()) {
			ReviewDTO dto = new ReviewDTO();
			dto.setStar(rs.getString(1));
			dto.setCommen(rs.getString(2));
			dto.setC_name(rs.getString(3));
			dto.setCpostdate(rs.getDate(4));
			list.add(dto);
			}////////////while
		}///try
		catch(Exception e) {e.printStackTrace();}
		
		return list;
	}//////////////////////////////
	public void write(String s_no,String star, String commen, String user) {
		String sql ;
		String g_no = null;
		sql="select * from customer where id='"+user+"'";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
			g_no = rs.getString(1);
			}////////////while
		}///try
		catch(Exception e) {e.printStackTrace();}
		
		sql="INSERT INTO review values(SEQ_REVIEW.nextval,?,?,?,?,sysdate)";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,s_no);
			psmt.setString(2, g_no);
			psmt.setString(3, star);
			psmt.setString(4, commen);
			
			psmt.executeUpdate();
		} catch (Exception e) {	e.printStackTrace();}
		
		
	}
	
	public Map count(String s_no) {
			String count = null ;
			String starsum = null;
		
			String sql = "select sum(star) from review where s_no="+s_no;
			
			try {
			
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
				starsum = rs.getString(1);
				}
			}
			catch (Exception e) {	e.printStackTrace();}

			sql = "select count(r_no) from review where s_no="+s_no;
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
				count = rs.getString(1);
				}
			}
			
			catch (Exception e) {	e.printStackTrace();}
				
			Map map = new HashMap<String,String>();
			if(starsum==null) starsum = "0";
			map.put("count", count);
			map.put("starsum", starsum);
			
		return map;
	}
	public int getTotalRecordCount(String s_no) {
		int total = 0 ;
		String sql = "SELECT COUNT(*) FROM REVIEW WHERE s_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, s_no);
			rs = psmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt(1);
			}
		}catch(Exception e) {e.printStackTrace();}
		
		return total;
	}
	
	
	
	
	/////////////////////////////////////////

}
