<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="mybatis.SqlSessionUtil"%>
<%@ page import="org.apache.ibatis.session.*"%>
<%@ page import="org.apache.ibatis.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="pojo.Visitbook"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="root" tagdir="/WEB-INF/tags" %>


<%
	SqlSessionFactory fac = (SqlSessionFactory) application.getAttribute("factory");
	SqlSession ss = fac.openSession();

	try {
		//작업#1
		List<Visitbook> map = ss.selectList("visit.allMemo");
			request.setAttribute("map", map);
// 			request.setAttribute("num", map);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		ss.close();
	}
%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<div class="container">
	<h2>글 목록</h2>
	<table class="table">
		<thead>
			<tr>
				<th>글 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${map}" var="mz">
				<tr>
					<td>
						<fmt:formatNumber value="${mz.num}"/>
					</td>
					<td><a href="/?menu=boardView&num=${mz.num }">${mz.memo }</a></td>
					<td>
						<root:formatId value="${vb.writer }" len="2"/>
					</td>
					<td>
						<fmt:formatDate value="${mz.writedate }" pattern="yyyy/MM/dd HH:mm" />
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div align="right">
	<form action="/">
		<input type="hidden" name="menu" value="board" />
		<button type="button" class="btn btn-success"
			onclick="location.href='/?menu=mymemo'">내글보기</button>
		<button type="submit" class="btn btn-primary" name="write">글쓰기</button>
	</form>
</div>

<div align="center">
	<ul class="pagination">
		<li class="active"><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
	</ul>
</div>

<%--         <td>${num }</td> --%>
<%-- 		<td> <a href="/?menu=boardView&num=<%=num%>"> ${memo }</a></td> --%>
<%--         <td>${writer }</td> --%>
<%--         <td>${date }</td> --%>


<%-- <i>${fn:substring(fn:substringBefore(vb.writer,'@') , 0, 2) }****@${fn:substringAfter(vb.writer,'@') } --%>
