<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="mybatis.SqlSessionUtil" %>
<%@ page import="org.apache.ibatis.session.*"%>
<%@ page import="org.apache.ibatis.io.*"%>
<%@ page import="java.util.*" %>

<%
	String sid=(String)session.getAttribute("logId");
	String start=request.getParameter("start");
	String end=request.getParameter("end");
	
	try{
		//연결
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@121.134.125.131:1521:xe", "betterfly", "oracle");
		con.setAutoCommit(false);
		
		//작업
		PreparedStatement ps=con.prepareStatement
		("select * from rechargelog where id=? and chargedate >=to_date(?) and chargedate <=to_date(?)+1");
		
		//전달받은 값은 일단 디비에 넣고...
			ps.setString(1, sid);
			ps.setString(2,start);
			ps.setString(3,end);
			
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			out.println("[I D : "+rs.getString("id")+"]"+" [충전 일시 : "+rs.getDate("chargedate")+"] [충전 금액 : "+rs.getInt("money")+"]"+"<br/>");
		}
		con.close();
	}catch(Exception e){
		e.printStackTrace();
		out.println("Exception 오류 발생!");
	}
%>