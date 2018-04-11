package com.sajo.foodtruck.foodtruck;

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

public class NoRegisterTruckDAO {

	
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	private InetAddress ip;
	
	//생성자]
	public NoRegisterTruckDAO(ServletContext context) {
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
	
	public List<NoRegisterTruckDTO> selectList(){
		List<NoRegisterTruckDTO> list = new Vector<NoRegisterTruckDTO>();
		NoRegisterTruckDTO dto;
		String sql = "SELECT * FROM FOODTRUCKS";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto = new NoRegisterTruckDTO();
				dto.setF_no(rs.getString(1));
				dto.setTname(rs.getString(2));
				dto.setAddr(rs.getString(3)+" "+rs.getString(4));
				dto.setTel(rs.getString(5));
				dto.setAttachedfile(rs.getString(6));
				dto.setIp(ip.getHostAddress());
				list.add(dto);
			}
		}catch(Exception e) {e.printStackTrace();}
		
		return list;
	}
	public List selectArea(String area) {
		String sql = null ; 
		switch(area) {
			case "all" : area = "all";
			break;
			case "seoul" : area = "서울";
			break;
			case "incheon" : area = "인천";
			break;
			case "gyeonggi" : area = "경기";
			break;
			case "daejeon" : area = "대전";
			break;
			case "daegu" : area = "대구";
			break;
			case "busan" : area = "부산";
			break;
			case "gita" : area = "gita";
			
		}
		
		List<NoRegisterTruckDTO> list = new Vector<NoRegisterTruckDTO>();
		if(area.equals("all")) {
			sql= "select * from foodtrucks";	
				
				try {
					psmt = conn.prepareStatement(sql);
					rs = psmt.executeQuery();
					while(rs.next()) {
						NoRegisterTruckDTO dto = new NoRegisterTruckDTO();
						dto.setF_no(rs.getString(1));
						dto.setTname(rs.getString(2));
						dto.setAddr(rs.getString(3)+" "+rs.getString(4));
						dto.setTel(rs.getString(5));
						dto.setAttachedfile(rs.getString(6));
						dto.setIp(ip.getHostAddress());
						list.add(dto);
					}
				}catch(Exception e) {e.printStackTrace();}
			
		}
		
		else if(area.equals("gita")) {
			
			sql="select * from foodtrucks f where f.addr not like '서울%' and f.addr not like '인천%' and f.addr not like '경기%' " + 
			   " and f.addr not like '대전%' and f.addr not like '대구%' and f.addr not like '부산%'"; 
			
				try {
					psmt = conn.prepareStatement(sql);
					rs = psmt.executeQuery();
				
					while(rs.next()) {
						NoRegisterTruckDTO dto = new NoRegisterTruckDTO();
						dto.setF_no(rs.getString(1));
						dto.setTname(rs.getString(2));
						dto.setAddr(rs.getString(3)+" "+rs.getString(4));
						dto.setTel(rs.getString(5));
						dto.setAttachedfile(rs.getString(6));
						dto.setIp(ip.getHostAddress());
						list.add(dto);
						
					}
				
				}
				catch(Exception e) {e.printStackTrace();}
			
		}	
		else {
			
				sql="select * from foodtrucks f where f.addr like '"+area+"%' ";
				
				try {
					psmt = conn.prepareStatement(sql);
					rs = psmt.executeQuery();
				
					while(rs.next()) {
						NoRegisterTruckDTO dto = new NoRegisterTruckDTO();
						dto.setF_no(rs.getString(1));
						dto.setTname(rs.getString(2));
						dto.setAddr(rs.getString(3)+" "+rs.getString(4));
						dto.setTel(rs.getString(5));
						dto.setAttachedfile(rs.getString(6));
						dto.setIp(ip.getHostAddress());
						list.add(dto);
						
					}
				
				}
				catch(Exception e) {e.printStackTrace();}
				
		}
		
		
		return list;
		
	}
	public NoRegisterTruckDTO selectOne(String f_no) {
		
		NoRegisterTruckDTO dto = new NoRegisterTruckDTO();
		String sql = "select * from foodtrucks where f_no = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, f_no);
			rs = psmt.executeQuery();
			if(rs.next()) {
			dto.setF_no(rs.getString(1));
			dto.setTname(rs.getString(2));
			dto.setAddr(rs.getString(3)+" "+rs.getString(4));
			dto.setTel(rs.getString(5));
			dto.setAttachedfile(rs.getString(6));
			dto.setIp(ip.getHostAddress());
			}
		}catch(Exception e) {e.printStackTrace();}
		
		return dto;
	}
	
}
