<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setAttribute("addr", request.getLocalAddr());
%>

<div align="center">
	copyright&copy; <b>betterFLY App corp.</b> <br/>
		ur connect Address : ${addr }
</div>