<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	//����
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");

	int r = 0;

	//����
	Connection con = null;
	
	//�ߺ��� �Է°� ���� ������ ���� ���� ������ �߻��� ��츦 ����Ͽ� Exception ó���� ���ִ� ���� �����̴�.
	try{
		con=DriverManager.getConnection
		("jdbc:oracle:thin:@121.134.125.131:1521:xe", "betterfly","oracle");
		con.setAutoCommit(false);
	
		//�۾�
		PreparedStatement joinPs = con.prepareStatement("insert into member2 values(?, ?, ?, sysdate)");
		PreparedStatement shipPs = con.prepareStatement("insert into membership values(?,1,100)");
	
			joinPs.setString(1, id);
			joinPs.setString(2, pw);
			joinPs.setString(3, name);
			r += joinPs.executeUpdate();
		
			shipPs.setString(1, id);
			r += shipPs.executeUpdate();
	
		if (r == 2) {
			out.println("ȸ�������� �����մϴ�!!");
			con.commit();
		} else {
			out.println("ȸ������ ����!!!");
			con.rollback();
		}
	}catch(Exception e){
		e.printStackTrace();
		con.rollback();
		out.println("Exception error�߻�!!");
	}

	//����
	con.close();
%>