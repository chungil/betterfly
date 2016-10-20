<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="mybatis.SqlSessionUtil"%>
<%@ page import="org.apache.ibatis.session.*"%>
<%@ page import="org.apache.ibatis.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="pojo.member"%>
<%@page import="java.sql.*"%>

<%
	//연결값 받기
	String sid = (String) session.getAttribute("logId");

	//sqlfactory접속...!
	SqlSessionFactory fac = (SqlSessionFactory) application.getAttribute("factory");
	SqlSession ss = fac.openSession();
	
	try{
		List<HashMap> myMap=ss.selectList("member.myPage",sid);
		for(int i=0;i<myMap.size();i++){
			HashMap m=myMap.get(i);
				request.setAttribute("name", m.get("NAME"));
				request.setAttribute("id", m.get("ID"));
				request.setAttribute("pw", m.get("PW"));
				request.setAttribute("name", m.get("NAME"));
				request.setAttribute("date", m.get("JOINDATE"));
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		ss.close();
	}
%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div class="container">
  <h2>회원정보</h2>
  <p><font color="blue"><b>${name }</b>님의 회원정보 입니다.</font></p>
  <table class="table">
    <thead>
      <tr>
        <th>I D</th>
        <th>비밀번호</th>
        <th>이 름 </th>
        <th>가입일</th>
      </tr>
    </thead>
    <tbody>
      <tr class="info">
        <td>${id }</td>
        <td>${pw }</td>
        <td>${name }</td>
        <td>${date }</td>
      </tr>
    </tbody>
  </table>
</div>

