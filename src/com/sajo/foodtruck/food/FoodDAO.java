package com.sajo.foodtruck.food;

import java.net.InetAddress;
import java.net.UnknownHostException;
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

import com.sajo.foodtruck.foodtruck.FoodtruckDTO;

public class FoodDAO {

	
	
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	private InetAddress ip;
	//생성자]
	public FoodDAO(ServletContext context) {
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
				ip = InetAddress.getLocalHost();
			} catch (SQLException | UnknownHostException e) {				
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
	
	public List<FoodDTO> selectList(String s_no){
		List<FoodDTO> list = new Vector<FoodDTO>();
		//페이징 미 적용
		String sql="SELECT s.id,F.* FROM SELLER S JOIN FOOD F ON S.S_NO = F.S_NO WHERE S.S_NO=?"; 
		
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, s_no);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
			FoodDTO dto = new FoodDTO();
			dto.setId(rs.getString(1));
			dto.setF_no(rs.getString(2));
			dto.setS_no(rs.getString(3));
			dto.setT_no(rs.getString(4));
			dto.setfName(rs.getString(5));
			dto.setPicture(rs.getString(7));
			dto.setPrice(rs.getString(8));
			dto.setIp(ip.getHostAddress());
			list.add(dto);
			}////////////while
		}///try
		catch(Exception e) {e.printStackTrace();}
		return list;
	}
	
	public FoodDTO selectOne(String f_no) {
		FoodDTO dto = new FoodDTO();
		String sql="select s.id,f.* from food f join seller s on f.s_no =s.s_no where f_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, f_no);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto= new FoodDTO();
				dto.setId(rs.getString(1));
				dto.setF_no(rs.getString(2));
				dto.setS_no(rs.getString(3));
				dto.setT_no(rs.getString(4));
				dto.setfName(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setPicture(rs.getString(7));
				dto.setPrice(rs.getString(8));
				dto.setIp(ip.getHostAddress());
			}
		}catch(Exception e) {e.printStackTrace();}
		
		return dto;
	}
	
}
