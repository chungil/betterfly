<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="mybatis.SqlSessionUtil"%>
<%@ page import="org.apache.ibatis.session.*"%>
<%@ page import="org.apache.ibatis.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="pojo.member"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%
		String id = request.getParameter("id");
		String pass = request.getParameter("pw");
		String save = request.getParameter("save");
		//equals로 판단하면 nullpointerexception
	
		SqlSessionFactory fac = (SqlSessionFactory) application.getAttribute("factory");
		SqlSession sql = fac.openSession();
	
		try{
			HashMap map = new HashMap();
				map.put("id", id);
				map.put("pw", pass);
		
			List<member> rst = sql.selectList("member.login", map);
			request.setAttribute("rst", rst);
		if (rst.size() == 1) {
			
	%>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
			 <meta name="viewport" content="width=device-width, initial-scale=1">
				  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
				  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
				  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
						 
						<div class="container">
						  <div class="panel-group">
						     <div class="panel panel-success">
						      <div class="panel-heading">로그인 안내</div>
						      <div class="panel-body">로그인 되었습니다. <br/> <i>3초후 페이지가 이동됩니다.</i></div>
					    </div>
			</div>
	<%
	
			if(save!=null){
				Cookie logC=new Cookie("login",id);
					logC.setPath("/");
	// 				logC.setMaxAge(60*60*24*365); //1년
					logC.setMaxAge(Integer.MAX_VALUE); //최대 int범위
					response.addCookie(logC);
			}else{
				Cookie logC=new Cookie("login","goodbyeCookie");
				logC.setPath("/");
				logC.setMaxAge(0); //최대 int범위
				response.addCookie(logC);
			}
	
			//로그인성공 포인트 지급
			int r = sql.update("member.pointup", id);
			sql.commit();
			session.setAttribute("logId", id);
			System.out.println(session.getAttribute("logId"));
		} else {
	%>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
			 <meta name="viewport" content="width=device-width, initial-scale=1">
				  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
				  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
				  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
					 
					<div class="container">
					  <div class="panel-group">
					     <div class="panel panel-danger">
					      <div class="panel-heading">로그인 안내</div>
					      <div class="panel-body">비밀번호를 잘못입력하였습니다.. <br/> <i>3초후 페이지가 이동됩니다.</i></div>
				    </div>
			</div>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		sql.close();
	}
%>

<meta http-equiv="refresh" content="3;url='/'" />

