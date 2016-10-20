<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	//연결
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");

	int r = 0;

	//접속
	Connection con = null;
	
	//중복값 입력과 같은 데이터 저장 외의 문제가 발생할 경우를 대비하여 Exception 처리를 해주는 것이 정석이다.
	try{
		con=DriverManager.getConnection
		("jdbc:oracle:thin:@121.134.125.131:1521:xe", "betterfly","oracle");
		con.setAutoCommit(false);
	
		//작업
		PreparedStatement joinPs = con.prepareStatement("insert into member2 values(?, ?, ?, sysdate)");
		PreparedStatement shipPs = con.prepareStatement("insert into membership values(?,1,100)");
	
			joinPs.setString(1, id);
			joinPs.setString(2, pw);
			joinPs.setString(3, name);
			r += joinPs.executeUpdate();
		
			shipPs.setString(1, id);
			r += shipPs.executeUpdate();
	
		if (r == 2) {
			out.println("회원가입을 축하합니다!!");
			con.commit();
		} else {
			out.println("회원가입 실패!!!");
			con.rollback();
		}
	}catch(Exception e){
		e.printStackTrace();
		con.rollback();
		out.println("Exception error발생!!");
	}

	//종료
	con.close();
%>