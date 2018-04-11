package com.sajo.foodtruck.mypage;

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

public class T_MenuDAO {
	//멤버변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	//생성자]
	public T_MenuDAO(ServletContext context) {
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
	}
	
	//자원반납용]
	public void close() {
		try {
			if(rs !=null) rs.close();
			if(psmt !=null) psmt.close();
			if(conn !=null) conn.close();
		} catch (Exception e) {}
	}

	//푸드타입 가져오기
	public List<T_Menu_TypeDTO> foodtype (){
		System.out.println("T_MenuDAO foodtype");
		
		List<T_Menu_TypeDTO> list = new Vector<T_Menu_TypeDTO>();
		try {
			String sql="SELECT * FROM foodtype";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				T_Menu_TypeDTO dto = new T_Menu_TypeDTO();
				dto.setTno(rs.getString(1));
				dto.setType(rs.getString(2));
				list.add(dto);
			}
		}
		catch (Exception e) {System.out.println("T_MenuDAO foodtype");e.printStackTrace();}
		return list;
	}

	//s_NO 가져오기
	public String getSellerNo(String user) {
		System.out.println("T_MenuDAO getSellerNo");
		
		String sql="SELECT s_no from seller where id=?";
		String result = "";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user);
			rs = psmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
		}
		catch (Exception e) {System.out.println("T_MenuDAO getSellerNo");e.printStackTrace();}
		return result;
	}
	
	//메뉴등록
	public int insertMenu(T_Menu_FoodDTO dto) {
		System.out.println("T_MenuDAO insertMenu");
		
		int affected = 0;
		String sql="INSERT INTO food VALUES (SEQ_FOOD.NEXTVAL,?,?,?,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getSno());
			psmt.setString(2, dto.getTno());
			psmt.setString(3, dto.getFname());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getNewPicture());
			psmt.setString(6, dto.getPrice());
			affected = psmt.executeUpdate();
		}
		catch (Exception e) {System.out.println("T_MenuDAO insertMenu");e.printStackTrace();}
		finally {close();}				
		return affected;
	}
	
	//메뉴 뿌리기
	public List<T_Menu_FoodDTO> selectMenu(String no){
		System.out.println("T_MenuDAO selectMenu");
		List<T_Menu_FoodDTO> list = new Vector<T_Menu_FoodDTO>();
		String sql = "SELECT fname, content, picture, price, f_no FROM food where s_no=? ORDER BY f_no DESC";//내림차순(큰~작)
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			while(rs.next()) {
				T_Menu_FoodDTO dto = new T_Menu_FoodDTO();
				dto.setFname(rs.getString(1));
				dto.setContent(rs.getString(2));
				dto.setNewPicture(rs.getString(3));
				dto.setPrice(rs.getString(4));
				dto.setFno(rs.getString(5));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("T_MenuDAO selectMenu error");
			e.printStackTrace();
		}
		finally {close();}				
		return list;
	}
	
	//메뉴 삭제
	public int deleteMenu(String no) {
		System.out.println("T_MenuDAO deleteMenu");
		int affected = 0;
		String sql = "DELETE from food where f_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			affected = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("T_MenuDAO deleteMenu error");
			e.printStackTrace();
		}
		finally {close();}				
		return affected;
	}
	
	//메뉴 수정
	public int updateMenu(T_Menu_FoodDTO dto) {
		System.out.println("T_MenuDAO updateMenu");
		int affected = 0;
		String sql = "UPDATE food SET t_no=?, fname=?,content=?, picture=?, price=? where f_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTno());
			psmt.setString(2, dto.getFname());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getNewPicture());
			psmt.setString(5, dto.getPrice());
			psmt.setString(6, dto.getFno());
			affected = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("T_MenuDAO updateMenu error");
			e.printStackTrace();
		}
		finally {close();}				
		return affected;
	}

	//푸드트럭 메인 이미지 등록
	/*
	public int insertMainFoodtruck(T_ImgTruckpageDTO dto){
		System.out.println("T_MenuDAO insertFoodtruck");
		int affected = 0;
		String sql="INSERT INTO IMAGES VALUES (?, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getSno());
			psmt.setString(2, dto.getNewImg());
			affected = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("T_MenuDAO insertFoodtruck error");
			e.printStackTrace();
		}
		finally {close();}				
		return affected;
	}*/
	
	
	//푸드트럭 서브 이미지 뿌리기
	public List<T_ImgDTO> selectSubImage(String no){
		System.out.println("T_MenuDAO selectSubImage");
		List<T_ImgDTO> list = new Vector<T_ImgDTO>();
		String sql = "SELECT img FROM images where s_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			while(rs.next()) {
				T_ImgDTO dto = new T_ImgDTO();
				dto.setNewImg(rs.getString(1));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("T_MenuDAO selectSubImage error");
			e.printStackTrace();
		}
		finally {close();}				
		return list;
	}
	//푸드트럭 서브 이미지 등록
	public int insertSubFoodtruck(T_ImgDTO dto){
		System.out.println("T_MenuDAO insertFoodtruck");
		int affected = 0;
		String sql="INSERT INTO IMAGES VALUES (?, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getSno());
			psmt.setString(2, dto.getNewImg());
			affected = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("T_MenuDAO insertFoodtruck error");
			e.printStackTrace();
		}
		finally {close();}				
		return affected;
	}
}
