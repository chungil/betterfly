<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	session.invalidate();
	// 	pageContext.forward("/index.jsp");
%>
<c:redirect url="/">
</c:redirect>
