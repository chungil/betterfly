<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="mybatis.SqlSessionUtil" %>
<%@ page import="org.apache.ibatis.session.*"%>
<%@ page import="org.apache.ibatis.io.*"%>
<%@ page import="java.util.*" %>

<%
	SqlSessionFactory fac=(SqlSessionFactory)application.getAttribute("factory");
	SqlSession ss=fac.openSession();
	
	int num=Integer.parseInt(request.getParameter("num"));
	System.out.println("boardView�κ��� ���� ��=="+num);
	int rst=0;
	
	try{
		HashMap m=new HashMap();
			m.put("NUM",num);
			
		rst+=ss.delete("visit.removeMemo",num);	
		
		if(rst==1){
			ss.commit();
			out.println("�����Ǿ����ϴ�.");
		}else{
			ss.rollback();
			out.println("���� �߻�!!");
		}
	}catch(Exception e){
		e.printStackTrace();
		out.println("�̻��� ���� �߻�!");
	}finally{
		ss.close();
	}
%>