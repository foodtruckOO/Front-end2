package com.sajo.foodtruck.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class OrderDAO {

	private Connection conn;
	private ResultSet rs;
	private ResultSet rs2;
	private PreparedStatement psmt;
	private PreparedStatement psmt2;
	//생성자]
	public OrderDAO(ServletContext context) {
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
			if(rs2 !=null) rs2.close();
			if(psmt !=null) psmt.close();
			if(psmt2 !=null) psmt2.close();
			if(conn !=null) conn.close();
		} catch (Exception e) {}
	}
	
	public List order(String user,String time, String ordertype, String text) {
		List list = new Vector<>();
		String g_no = null;
		int type = 0 ;
		String price = null;
		String num = null ;
		String f_no = null;
		String s_no = null;
		int priceall = 0 ;
		
		OrderDTO dto = new OrderDTO();
		switch(ordertype) {
			
		case "mobile" :
			type = 1;
			break ;
		case "card" :
			type = 2;
			break ;
		case "cardDirect" :
			type = 3;
			break;
		case "cash" :
			type = 4;
			break;
		}

		
		String sql = "select g_no from customer where id = ?";
		try {
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, user);
		rs = psmt.executeQuery();
		if(rs.next()) {
			dto = new OrderDTO();
			g_no = rs.getString(1);
		}
		}catch(Exception e) {e.printStackTrace();}
		
		sql = "select c.f_no,c.num,f.price,f.fname from cart c join food f on c.f_no = f.f_no where g_no = ?";  
		try {
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, g_no);
		rs = psmt.executeQuery();
		if(rs.next()) {
			dto = new OrderDTO();
			f_no = rs.getString(1);
			dto.setF_no(f_no);
			num = rs.getString(2);
			dto.setNum(num);
			price = rs.getString(3);
			dto.setPrice(price);
			dto.setFname(rs.getString(4));
			list.add(dto);		
			sql = "insert into orderform values(seq_o_no.nextval,?,?,?,?,?,sysdate,0)";
			
		    psmt2 = conn.prepareStatement(sql);
			
			psmt2.setString(1, g_no);
			psmt2.setString(2, f_no);
			psmt2.setString(3, num);
			psmt2.setString(4, time);
			psmt2.setString(5, text);
			psmt2.executeUpdate();
			
			priceall = priceall + Integer.parseInt(num) * Integer.parseInt(price);
		}
		while(rs.next()) {
			dto = new OrderDTO();
			f_no = rs.getString(1);
			dto.setF_no(f_no);
			num = rs.getString(2);
			dto.setNum(num);
			price = rs.getString(3);
			dto.setPrice(price);
			dto.setFname(rs.getString(4));
			list.add(dto);	
			sql = "insert into orderform values(seq_o_no.curval,?,?,?,?,?,sysdate,0)";
			psmt2.setString(1, g_no);
			psmt2.setString(2, f_no);
			psmt2.setString(3, num);
			psmt2.setString(4, time);
			psmt2.setString(5, text);
			psmt2.executeUpdate();
			priceall = priceall + Integer.parseInt(num) * Integer.parseInt(price);
		}
		
		dto = new OrderDTO();
		dto.setTime(time);
		dto.setId(user);
		dto.setContents(text);
		dto.setOrdertype(((Integer)type).toString());
		dto.setPriceall(((Integer)priceall).toString());
		
		sql ="select s.s_no from seller s join food f on s.s_no = f.s_no where f.f_no = ?";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, f_no);
		rs = psmt.executeQuery();
			if(rs.next()) {
				s_no = rs.getString(1);
			}
		
		sql = "select tname,addr,addr2 from seller where s_no = ?";	
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, s_no);
		rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setTname(rs.getString(1));
				dto.setAddr(rs.getString(2)+" "+rs.getString(3));
			}
			
		sql = "select tel from customer where id = ?";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, user);
		rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setTel(rs.getString(1));
			}
		}catch(Exception e) {e.printStackTrace();}
		
		list.add(dto);
		
		sql = "delete cart where g_no = ?";
		try {
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, g_no);
		psmt.executeUpdate();
		}catch(Exception e) {e.printStackTrace();}
		return list;
	}
	public String check(String user) {
		String sql = "select COUNT(*) from orderform o join food f on o.f_no = f.f_no join seller s on f.s_no = s.s_no where s.id = ? and o.confirm = 0";
		int count = 0 ;
		String ordercheck;
		try {
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, user);
		rs = psmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt("COUNT(*)");
		}
		}catch(Exception e) {e.printStackTrace();}
		
		if(count!=0) {
			ordercheck = "Y";
		}
		else ordercheck = "N";
		
		return ordercheck;
	}
	public void edit(String user) {
		String sql = "update (select o.* from orderform o join food f on o.f_no = f.f_no join seller s on f.s_no = s.s_no where s.id = ? and o.confirm = 0) set confirm = 1";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user);
			psmt.executeUpdate();
		}catch(Exception e) {e.printStackTrace();}
	}
	public String timecheck(String user) {
		String postdate = null;
		String time = null;
		Date datetime = null;
		Date currenttime = null;
		String yn = "N" ;
		String sql = "select o.* from orderform o join food f on o.f_no = f.f_no join seller s on f.s_no = s.s_no where s.id = ? and to_char(o.postdate,'yyyymmdd')=to_char(sysdate,'yyyymmdd')";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user);
			rs = psmt.executeQuery();
			while(rs.next()) {
				postdate = rs.getString(7);
				time = rs.getString(5);
				if(time.contains("PM")) {
					int inttime = Integer.parseInt(time.substring(0,2));
					inttime = inttime + 12;
					time = time.replace(time.substring(0, 2),String.valueOf(inttime));
					time = time.replace("PM", "").trim();
					postdate = postdate.split(" ")[0];
					
					//System.out.println(time);
					//System.out.println(postdate);
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd:hh:mm",Locale.KOREA);
					datetime = sf.parse(postdate+":"+time,new ParsePosition(0));
					//System.out.println(datetime);
					long longdatetime = datetime.getTime();
					Date today = new Date();
					//System.out.println(today);
					long longtoday = today.getTime();
					long result = longtoday-longdatetime;
					//System.out.println(result/1000/60);
					if((result/1000/60)==-30) {
						yn = "30";
					}
					else if((result/1000/60)==-10) {
						yn = "10";
					}
				}
				else {
					time = time.replace("AM", "").trim();
					postdate = postdate.split(" ")[0];
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd:hh:mm",Locale.KOREA);
					datetime = sf.parse(postdate+":"+time,new ParsePosition(0));
					long longdatetime = datetime.getTime();
					Date today = new Date();
					long longtoday = today.getTime();
					long result = longtoday-longdatetime;
					if((result/1000/60)==-30) {
						yn = "30";
					}
					else if((result/1000/60)==-10) {
						yn = "10";
					}
					
				}
				
			}
			
		}catch(Exception e) {e.printStackTrace();}
		
		return yn;
	}
	
	
}
