<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	
<%
	System.out.println(session.getAttribute("logId")); 
	session.setAttribute("logCheck",session.getAttribute("logId"));
%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<c:set var="log" value="${logCheck}"/>
<c:choose>
	<c:when test="${log ne null}">
	<div class="container">
	  <h2>내 글</h2>
		<form action="/visit/memoreg.jsp">
		    <div class="form-group">
		      <label for="comment">Comment:</label>
		      <textarea name="memo" class="form-control" rows="10" id="comment" style="resize:none;"></textarea>
		    </div>
			</div>
			
			<div align="right">
				<input type="submit" value="등록" style="height:50px; width:100px;"/>
			</div>
		</form>		
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
		      alert("로그인 후 사용해주세요!");
		      document.location.href="/?menu=allview";
		</script>	
	</c:otherwise>
</c:choose>	


