<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String m=request.getParameter("menu");	
	String target=null;
	
	if(m!=null){
		switch(m){
		case "main" : 
			target="layout.jsp?nav=/member/login.jsp&article=home.jsp";
			break;
		case "join" : 
			target="layout.jsp?nav=/member/login.jsp&article=/member/join.jsp";
			break;
		case "adminmemlist":
			target="layout.jsp?nav=/member/login.jsp&article=/admin/memlist.jsp";
			break;
		case "recharge":
			target="layout.jsp?nav=/member/login.jsp&article=/member/pay.jsp";
			break;
		case "search":
			target="layout.jsp?nav=/member/login.jsp&article=/member/search.jsp";
			break;
		case "findlog":
			target="layout.jsp?nav=/member/login.jsp&article=/member/findlog.jsp";
			break;
		case "allview":
			target="layout.jsp?nav=/member/login.jsp&article=/visit/allview.jsp";
			break;
		case "board":
			target="layout.jsp?nav=/member/login.jsp&article=/visit/board.jsp";
			break;
		case "mymemo":
			target="layout.jsp?nav=/member/login.jsp&article=/visit/mymemo.jsp";
			break;
		case "boardView":
			target="layout.jsp?nav=/member/login.jsp&article=/visit/boardView.jsp";
			break;
		case "myPage":
			target="layout.jsp?nav=/member/login.jsp&article=/member/mypage.jsp";
			break;
		case "photoView":
			target="layout.jsp?nav=/member/login.jsp&article=/photo/photoView.jsp";
			break;
		default : %> 
			<h1><b>페이지를 잘못 접근해쓰요 </b></h1>
<% 
		}
		pageContext.forward(target);
	}else{
		pageContext.forward("layout.jsp?nav=/member/login.jsp&article=home.jsp");
	}
%>