package com.sajo.foodtruck.event;
/*
 * DAO(Data Access Object):데이타에 접근해서 CRUD작업을
 *                         수행하는 업무처리 로직
 * 
 */
  
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



public class EventDAO {
	//멤버변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	private InetAddress ip; 
	//생성자]
	public EventDAO(ServletContext context) {
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
	public List<EventDTO> selectHList(){
		List<EventDTO> list = new Vector<EventDTO>();
		//페이징 미 적용
		String sql="SELECT E.*,a.id from EVENT e join administrator a on e.a_no=a.a_no where boardtype ='1' ORDER BY s_date";
			//	+ "e.*,name FROM bbs b JOIN member m ON b.id=m.id ";
		
		//페이징 적용-구간쿼리로 변경
		//검색용 쿼리 추가
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				EventDTO dto = new EventDTO();
				dto.setEno(rs.getString(1));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setTitlefile(rs.getString(11)+"/"+rs.getString(5));
				dto.setContentfile(rs.getString(11)+"/"+rs.getString(6));
				dto.setS_date(rs.getDate(7));
				dto.setE_date(rs.getDate(8));
				dto.setPostdate(rs.getDate(9));
				dto.setIp(ip.getHostAddress());
				list.add(dto);
			}////////////while
		}///try
		catch(Exception e) {e.printStackTrace();}
		
		return list;
	}//////////////////////////////
	//전체 레코드 수 얻기용]
	public EventDTO selectOne(String key) {
		EventDTO dto=null;
		String sql="SELECT e.*,a.id FROM EVENT e join administrator a on e.a_no=a.a_no WHERE eno=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new EventDTO();
				dto.setEno(rs.getString(1));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setTitlefile(rs.getString(11)+"/"+rs.getString(5));
				dto.setContentfile(rs.getString(11)+"/"+rs.getString(6));
				dto.setS_date(rs.getDate(7));
				dto.setE_date(rs.getDate(8));
				dto.setPostdate(rs.getDate(9));
				dto.setBoardtype(rs.getString(10));
				dto.setIp(ip.getHostAddress());
				
			}
			System.out.println(dto.getBoardtype());
		} catch (Exception e) {e.printStackTrace();}
		return dto;
	}/////////////////////////////////////////
	public List<EventDTO> selectAll() {

		List<EventDTO> list = new Vector<EventDTO>();
		//페이징 미 적용
		String sql="SELECT e.*,a.id from EVENT e join administrator a on e.a_no=a.a_no ORDER BY s_date";
		try {
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				EventDTO dto = new EventDTO();
				dto.setEno(rs.getString(1));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setTitlefile(rs.getString(11)+"/"+rs.getString(5));
				dto.setContentfile(rs.getString(11)+"/"+rs.getString(6));
				dto.setS_date(rs.getDate(7));
				dto.setE_date(rs.getDate(8));
				dto.setPostdate(rs.getDate(9));
				dto.setIp(ip.getHostAddress());
				list.add(dto);
			}////////////while
		}///try
		catch(Exception e) {e.printStackTrace();}
		
		return list;
	}
	public List selectLList() {
		List<EventDTO> list = new Vector<EventDTO>();
		//페이징 미 적용
		String sql="SELECT e.*,a.id from EVENT e join administrator a on e.a_no = a.a_no where boardtype ='2' ORDER BY s_date";
			//	+ "e.*,name FROM bbs b JOIN member m ON b.id=m.id ";
		
		//페이징 적용-구간쿼리로 변경
		//검색용 쿼리 추가
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				EventDTO dto = new EventDTO();
				dto.setEno(rs.getString(1));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setTitlefile(rs.getString(11)+"/"+rs.getString(5));
				dto.setContentfile(rs.getString(11)+"/"+rs.getString(6));
				dto.setS_date(rs.getDate(7));
				dto.setE_date(rs.getDate(8));
				dto.setPostdate(rs.getDate(9));
				dto.setIp(ip.getHostAddress());
				list.add(dto);
			}////////////while
		}///try
		catch(Exception e) {e.printStackTrace();}
		
		return list;
	
	}
	public List selectSList() {
		List<EventDTO> list = new Vector<EventDTO>();
		//페이징 미 적용
		String sql="SELECT t.*,s.id FROM TRUCK_EVENT t join seller s on t.s_no = s.s_no";
		try {
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				EventDTO dto = new EventDTO();
				dto.setEno(rs.getString(1));
				dto.setS_no(rs.getString(2));;
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setTitlefile(rs.getString(5));
				dto.setContentfile(rs.getString(6));
				dto.setS_date(rs.getDate(7));
				dto.setE_date(rs.getDate(8));
				dto.setPostdate(rs.getDate(9));
				dto.setIp(ip.getHostAddress());
				dto.setId(rs.getString(10));
				list.add(dto);
			}////////////while
		}///try
		catch(Exception e) {e.printStackTrace();}
		return list;
		
	}
	public EventDTO selectSOne(String s_no) {
		EventDTO dto=null;
		String sql="select t.*,s.id from truck_event t join seller s on t.s_no = s.s_no where t.s_no = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, s_no);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new EventDTO();
				dto.setEno(rs.getString(1));
				dto.setS_no(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setTitlefile(rs.getString(5));
				dto.setContentfile(rs.getString(6));
				dto.setS_date(rs.getDate(7));
				dto.setE_date(rs.getDate(8));
				dto.setPostdate(rs.getDate(9));
				dto.setId(rs.getString(10));
				dto.setIp(ip.getHostAddress());
				
			}
		} catch (Exception e) {e.printStackTrace();}
		return dto;
		
	}

}
