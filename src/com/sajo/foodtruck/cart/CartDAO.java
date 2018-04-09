package com.sajo.foodtruck.cart;

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
	
	public String insert(String f_no, String user) {
		String s_no = null;
		int count = 0;
		String sql ="select s_no from food where f_no=?";
			try {
				psmt= conn.prepareStatement(sql);
				psmt.setString(1, f_no);
				rs = psmt.executeQuery();
				if(rs.next()) {
					s_no =rs.getString(1);	
				}
			}catch(Exception e) {e.printStackTrace();}
		sql = "select count(*) from cart c join food f on c.f_no = f.f_no where s_no!=?";
			try {
				psmt=conn.prepareStatement(sql);
				psmt.setString(1, s_no);
				rs = psmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
			}catch(Exception e) {e.printStackTrace();}
			if(count!=0) {
				return "N";
			}
			
		
		sql = "select g_no from customer where id=?";
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
		
		return "Y";
	}
	
	
	public String detailinsert(String f_no, String user, String num) {
		String g_no = null ; 
		String count = null;
		String s_no = null;
		int cnt= 0;
		
		String sql ="select s_no from food where f_no=?";
		try {
			psmt= conn.prepareStatement(sql);
			psmt.setString(1, f_no);
			rs = psmt.executeQuery();
			if(rs.next()) {
				s_no =rs.getString(1);	
			}
		}catch(Exception e) {e.printStackTrace();}

		
			sql = "select count(*) from cart c join food f on c.f_no = f.f_no where s_no!=?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, s_no);
			rs = psmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}catch(Exception e) {e.printStackTrace();}
		if(cnt!=0) {
			return "N";
		}
		
		
		sql = "select g_no from customer where id=?";
		
		try {
			psmt= conn.prepareStatement(sql);
			psmt.setString(1, user);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				g_no = rs.getString(1);
			}
		}catch(Exception e) {e.printStackTrace();}
		
		sql = "select num from cart where f_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, f_no);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
			count=rs.getString(1);
			}
			
			if(count==null) {
				sql = "insert into cart values(?,?,?)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, g_no);
				psmt.setString(2, f_no);
				psmt.setString(3, num);
				psmt.executeUpdate();
			}
			else {
				sql = "update cart set num=? where f_no = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, Integer.parseInt(count)+Integer.parseInt(num));
				psmt.setString(2, f_no);
				psmt.executeUpdate();
			}
		}   catch (Exception e) {e.printStackTrace();}
		
		
		return "Y";
	}
	public List order(String user) {
		String g_no = null; 
		String f_no = null;
		String s_no = null;
		List<CartDTO> list = new Vector<CartDTO>();
		CartDTO dto = new CartDTO();
		String sql = "select g_no,name,tel from customer where id=?";
		int priceall=0;
		try {
			psmt= conn.prepareStatement(sql);
			psmt.setString(1, user);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				g_no = rs.getString(1);
				dto.setName(rs.getString(2));
				dto.setTel(rs.getString(3));
			}
		}catch(Exception e) {e.printStackTrace();}
		
		sql = "select f_no from cart where g_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, g_no);
			rs = psmt.executeQuery();
			if(rs.next()) {
				f_no = rs.getString(1);
			}
		}catch(Exception e) {e.printStackTrace();}
		
		sql = "select s_no from food where f_no = ?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, f_no);
				rs = psmt.executeQuery();
				if(rs.next()) {
					s_no = rs.getString(1);
				}
			}catch(Exception e) {e.printStackTrace();}
		
		sql = "select tname,addr,addr2 from seller where s_no = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, s_no);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setTname(rs.getString(1));
				dto.setAddr(rs.getString(2)+" "+rs.getString(3));
			}
		}catch(Exception e) {e.printStackTrace();}
			
		list.add(dto);
		
		
		
		sql =  "select f.fname,c.num,f.price,f.f_no,f.picture,s.id from food f join cart c on f.f_no = c.f_no join seller s on s.s_no = f.s_no where c.g_no=?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, g_no);
				rs = psmt.executeQuery();
				while(rs.next()) {
					dto = new CartDTO();
					dto.setFname(rs.getString(1));
					dto.setNum(rs.getString(2));
					dto.setPrice(rs.getString(3));
					dto.setF_no(rs.getString(4));
					dto.setPicture(rs.getString(5));
					dto.setS_id(rs.getString(6));
					priceall = priceall + rs.getInt(2)*rs.getInt(3);
					list.add(dto);
				}
			}catch(Exception e) {e.printStackTrace();}
			dto = new CartDTO();
			dto.setPriceall(((Integer)priceall).toString());
			list.add(dto);
			
			return list;
	}
	public void delete(String f_no) {
		String sql = "delete cart where f_no = ?";
		try {
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, f_no);
		psmt.executeUpdate();
		}catch(Exception e) {e.printStackTrace();}
		
	}
	public String search(String user) {
		String sql = "select count(*) from cart c join customer g on c.g_no = g.g_no where g.id=?";  
		int count = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user);
			rs = psmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {e.printStackTrace();}
		
			if(count==0)
				return "N";
			else
				return "Y";
				
	}
}
