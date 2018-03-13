<%@page import="model.PBKDF2"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="model.SellerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  
	//한글처리
	//id passwd name 가져오기
	request.setCharacterEncoding("utf-8");
	
	String f_no = request.getParameter("fno");
	String id = request.getParameter("id");
	String pass = request.getParameter("pwd");
	String name = request.getParameter("name");
	String tname = request.getParameter("tname");
	String addr = request.getParameter("roadAddrPart1");
	String tel = request.getParameter("phone");
	pass = PBKDF2.createHash(pass);
 
	Connection conn = null;
	String url = "jdbc:oracle:thin://localhost:1521:orcl";
	String user = "FT";
	String pwd = "FT";
	PreparedStatement pstmt = null;
	String sql = "";
	
	try { 
		//1단계 드라이버 로더
		Class.forName("oracle.jdbc.OracleDriver");
		//2단계 디비연결
		conn = DriverManager.getConnection(url, user, pwd);
		//out.println("연결성공");
		//3단계 sql문 생성 Statement PreparedStatement CallableStatement
		//PreparedStatement CallableStatement
		sql = "insert into SELLER values(SEQ_SEL.NEXTVAL,?,?,?,?,?,?,?,sysdate)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setString(4, f_no);
		pstmt.setString(5, tname);
		pstmt.setString(6, addr);
		pstmt.setString(7, tel);
		
		
		//4단계 실행
		pstmt.executeUpdate();
		//out.println("회원가입성공");
		//request.getRequestDispatcher("/com.sajo.foodtruck/front-end/views/main.jsp").forward(request, response);
		out.println("<script>");
		out.println("window.opener.location.reload();");
		out.println("window.close();");
		out.println("alert('회원가입 성공!');");
		out.println("</script>");
	} catch (Exception e) {
		e.printStackTrace();
		out.println(e.getMessage());
	} finally {
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException ex) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException ex) {
			}
	}
%>