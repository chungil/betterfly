<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String m=request.getParameter("menu");	
	String target=null;
	
	if(m!=null){
		switch(m){
		case "visit" : 
			target="layout.jsp?nav=/member/login.jsp&article=home.jsp";
			break;
		case "join" : 
			target="layout.jsp?nav=/member/login.jsp&article=/member/join.jsp";
			break;
		default : 
		%> 
			<h1><b>�������� �߸� �����ؾ��� </b></h1>
<% 
		}
		pageContext.forward(target);
	}else{
		pageContext.forward("layout.jsp?nav=/member/login.jsp&article=home.jsp");
	}
%>