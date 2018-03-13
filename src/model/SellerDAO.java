package model;
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
 
public class SellerDAO {
	//멤버변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	//생성자]
	public SellerDAO(ServletContext context) {
		//커넥션 풀 미 사용-커넥션 객체 메모리에 직접 생성 코드
		/*
		try {
			//드라이버 로딩]
			Class.forName(context.getInitParameter("ORACLE_DRIVER"));
			//데이타베이스 연결]
			conn = DriverManager.getConnection(context.getInitParameter("ORACLE_URL"),"JSP","JSP");
		}
		catch(Exception e) {
			e.printStackTrace();
		}*/
		
		//커넥션 풀 사용:톰켓이 생성해 놓은 커넥션 객체 풀에서 가져다 쓰기
		try {
			InitialContext ctx = new InitialContext();
			DataSource source=(DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jdbc/ft");
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
		String sql="SELECT pwd FROM SELLER WHERE id=?";
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
	//전체 목록 가져오기]
	/*
	 * 페이징 로직 추가하기
	 * DAO에서 할일
	 * 1. 전체목록 쿼리를 구간 쿼리로 변경
	 * 2. 총 레코드수 구하는 메소드 추가
	 * 
	 * 
	 */
	public List<CusDTO> selectList(Map<String,Object> map){
		
		List<CusDTO> list = new Vector<CusDTO>();
		//페이징 미 적용
		//String sql="SELECT b.*,name FROM bbs b JOIN member m ON b.id=m.id ";
		//sql+=" ORDER BY postdate DESC";
		//페이징 적용-구간쿼리로 변경
		String sql="SELECT * FROM (SELECT T.*,ROWNUM R FROM (SELECT b.*,name FROM bbs b JOIN member m ON b.id=m.id ";
		//검색용 쿼리 추가
		if(map.get("searchColumn")!=null) {
			sql+=" WHERE "+map.get("searchColumn")+" LIKE '%"+map.get("searchWord")+"%' ";
			
		}		
		sql+=" ORDER BY postdate DESC) T) WHERE R BETWEEN ? AND ?";
		
		
		
		try {
			psmt = conn.prepareStatement(sql);
			//페이징을 위한 시작 및 종료 rownum설정]
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				CusDTO dto = new CusDTO();
				dto.setContent(rs.getString(4));
				dto.setId(rs.getString(2));
				dto.setNo(rs.getString(1));
				dto.setPostdate(rs.getDate(6));
				dto.setTitle(rs.getString(3));
				dto.setVisitcount(rs.getString(5));
				dto.setName(rs.getString(7));
				
				list.add(dto);
			}////////////while
		}///try
		catch(Exception e) {e.printStackTrace();}
		
		return list;
	}//////////////////////////////
	//전체 레코드 수 얻기용]
	public int getTotalRecordCount(Map<String,Object> map) {
		int totalCount =0;
		try {
			String sql="SELECT COUNT(*) FROM bbs b JOIN member M ON b.id=m.id ";
			//검색용 쿼리 추가
			if(map.get("searchColumn")!=null) {
				sql+=" WHERE "+map.get("searchColumn")+" LIKE '%"+map.get("searchWord")+"%' ";
				
			}		
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount =rs.getInt(1);
			System.out.println(totalCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}//////////////////////////	
	//입력용]
	public int insert(CusDTO dto) {
		int affected =0;
		String sql="INSERT INTO bbs(no,id,title,content) VALUES(SEQ_BBS.NEXTVAL,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());			
			affected = psmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}///////////////////////
	//조회수 업데이트]
	public void updateVisitCount(String key) {
		String sql="UPDATE bbs SET visitcount=visitcount+1 WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,key);
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}////////////////////////////////////////
	//상세보기용]
	public CusDTO selectOne(String key) {
		CusDTO dto=null;
		String sql="SELECT b.*,name FROM bbs b JOIN member m ON b.id=m.id ";
		sql+=" WHERE no =?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new CusDTO();
				dto.setContent(rs.getString(4));
				dto.setId(rs.getString(2));
				dto.setNo(rs.getString(1));
				dto.setPostdate(rs.getDate(6));
				dto.setTitle(rs.getString(3));
				dto.setVisitcount(rs.getString(5));
				dto.setName(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return dto;
	}//////////////////////////////
	//이전글/다음글 얻기]
	public Map<String,CusDTO> prevNNext(String key){
		Map<String,CusDTO> map = new HashMap<String,CusDTO>();		
		try {
			//이전글 얻기
			String sql="SELECT no,title FROM bbs WHERE no=(SELECT min(no) FROM bbs WHERE no > ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();			
			if(rs.next()) {//이전글이 있는 경우
				CusDTO dto= new CusDTO();
				dto.setNo(rs.getString(1));
				dto.setTitle(rs.getString(2));
				map.put("PREV",dto);
			}
			//다음글 얻기
			sql="SELECT no,title FROM bbs WHERE no=(SELECT max(no) FROM bbs WHERE no < ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();			
			if(rs.next()) {//다음글이 있는 경우
				CusDTO dto= new CusDTO();
				dto.setNo(rs.getString(1));
				dto.setTitle(rs.getString(2));
				map.put("NEXT",dto);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}		
		return map;
	}/////////////////////////////
	//수정용]
	public int update(CusDTO dto) {
		int affected =0;
		String sql="UPDATE bbs SET title=?,content=? WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNo());			
			affected = psmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}///////////////////////
	//삭제용]
	public int delete(String key) {
		int affected =0;
		String sql="DELETE FROM bbs WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);		
			affected = psmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}////////////////
	
}
