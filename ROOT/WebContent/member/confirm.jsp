<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="mybatis.SqlSessionUtil" %>
<%@ page import="org.apache.ibatis.session.*"%>
<%@ page import="org.apache.ibatis.io.*"%>
<%@ page import="java.util.*" %>
<%@ page import="pojo.member" %>

<%
	//���ᰪ �ޱ�
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	int r=0;
	SqlSessionFactory fac=(SqlSessionFactory)application.getAttribute("factory");
	SqlSession ss=fac.openSession();
	
	try{
		//�۾�
		//SqlSession ��ü...
		HashMap joinMap=new HashMap();
			joinMap.put("id",id);
			joinMap.put("pw",pw);
			joinMap.put("name",name);
			
		/*
		pojo�� �̿�...
		Member me=new Member();
			me.id=id;
			me.setName(name);
			me.setPass(pass);
		int rst1=sql.insert("mem.join-2",me);
		*/
		//r==>1
		r+=ss.insert("member.join",joinMap);
		r+=ss.insert("member.joinPoint",joinMap);
	
			if (r == 2) {
				out.println("ȸ�������� �����մϴ�!!");
				ss.commit();
			} else {
				out.println("ȸ������ ����!!!");
				ss.rollback();
			}
	}catch(Exception e){
		e.printStackTrace();
		ss.rollback();
		out.println("Exception error�߻�!!");
	}finally{
		//����
		ss.close();	
	}

	
%>
