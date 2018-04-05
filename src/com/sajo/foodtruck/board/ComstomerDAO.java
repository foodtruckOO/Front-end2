package com.sajo.foodtruck.board;
/*
 * DAO(Data Access Object):데이타에 접근해서 CRUD작업을
 *                         수행하는 업무처리 로직
 * 
 */
  
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

import com.sajo.foodtruck.LoginJoin.CusDTO;
import com.sajo.foodtruck.LoginJoin.PBKDF2;



public class ComstomerDAO {
	//멤버변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	//생성자]
	public ComstomerDAO(ServletContext context) {
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
	
	public List<ComstomerDTO> selectHList(){
		List<ComstomerDTO> list = new Vector<ComstomerDTO>();
		//페이징 미 적용
		String sql="SELECT cb.*,c.name from c_board cb join customer c on cb.g_no = c.g_no order by cb_no desc";
			//	+ "e.*,name FROM bbs b JOIN member m ON b.id=m.id ";
		
		//페이징 적용-구간쿼리로 변경
		//검색용 쿼리 추가
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				ComstomerDTO dto = new ComstomerDTO();
				dto.setCb_no(rs.getString(1));
				dto.setG_no(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setAttachedfile(rs.getString(5));
				dto.setPostdate(rs.getDate(6));
				dto.setName(rs.getString(7));
				list.add(dto);
			}////////////while
		}///try
		catch(Exception e) {e.printStackTrace();}
		
		return list;
	}//////////////////////////////
	//글등록
	public void write(String title,String content, String file, String user) {
		String sql ;
		String name=null;
		String g_no=null;
		sql="select * from customer where id='"+user+"'";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
			name = rs.getString(4);
			g_no = rs.getString(1);
			}////////////while
		}///try
		catch(Exception e) {e.printStackTrace();}
		
		sql="INSERT INTO c_board values(SEQ_c_board.nextval,?,?,?,?,sysdate)";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, g_no);
			psmt.setString(2,title);
			psmt.setString(3, content);
			psmt.setString(4, file);	
			psmt.executeUpdate();
		} catch (Exception e) {	e.printStackTrace();}
		
		
	}/////////////
	
	//상세보기용]
	public ComstomerDTO selectOne(String key) {
		ComstomerDTO dto=null;
		String sql="select cb.*,c.name from c_board cb join customer c on cb.g_no=c.g_no where cb.cb_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new ComstomerDTO();
				dto.setCb_no(rs.getString(1));
				dto.setG_no(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setAttachedfile(rs.getString(5));
				dto.setPostdate(rs.getDate(6));
				dto.setName(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return dto;
	}//////////////////////////////
	//수정용
	public void update(String cb_no,String title,String content,String file,String user) {
		
		String sql="UPDATE c_board SET title=?,content=?,attachedfile=? WHERE cb_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,title);
			psmt.setString(2, content);
			psmt.setString(3, file);
			psmt.setString(4, cb_no);
			psmt.executeUpdate();
		} 
		catch (Exception e) {	e.printStackTrace();}
		
	}///////////////////////////////////////
	
	//삭제용
	public void delete(String cb_no) {
		
	   String sql="Delete from c_board where cb_no=?";
	   try {
		   psmt= conn.prepareStatement(sql);
		   psmt.setString(1, cb_no);
		   psmt.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
	}///////////////
	//다운로드 수 업데이트용]
	public void updateDownCount(String key) {
		
		String sql="UPDATE dataroom SET downcount=downcount+1 WHERE cb_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			psmt.executeUpdate();
		} catch (Exception e) {e.printStackTrace();}	
	}//////////////////////
	
	
}///////////////////////
