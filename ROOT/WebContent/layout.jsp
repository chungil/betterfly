<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setAttribute("nav", request.getParameter("nav"));
	request.setAttribute("article", request.getParameter("article"));
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>충일이네</title>
<style>
div.container {
	width: 100%;
	border: 1px solid gray;
}

header, footer {
	padding: 1em;
	color: white;
	background-color: black;
	clear: left;
	text-align: center;
}

nav.left{
	float: left;
	width: 220px;
	margin: 0;
	padding: 1em;
	max-width: 220px;
	overflow: auto;
}

nav.left ul {
	list-style-type: none;
	padding: 0;
}

nav.left ul a {
	text-decoration: none;
}

article {
	margin-left: 170px;
	border-left: 1px solid gray;
	padding: 1em;
	overflow: hidden;
	min-height: 500px;
	max-width:1200px;
}
</style>

</head>
<body>
	<div class="container">
		<header>
			<jsp:include page="header.jsp" flush="true" />
		</header>
		<nav class="left">
			<c:set var="nav" value="${param.nav}"/>
			<jsp:include page="${nav }" flush="true" />
		</nav>
		<article>
			<c:set var="article" value="${param.article}"/>
			<jsp:include page="${article }" flush="true" />
		</article>
		<footer>
			<jsp:include page="footer.jsp" flush="true" />
		</footer>
	</div>
</body>
</html>
