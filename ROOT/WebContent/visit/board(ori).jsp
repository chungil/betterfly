<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
	
<%
	System.out.println(session.getAttribute("logId")); // 출력되는거
	if(session.getAttribute("logId")!=null){ 
%>	
	<head>
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
	
	
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

	
<%
}else{
	%>
	<script type="text/javascript">
	      alert("로그인 후 사용해주세요!");
	      document.location.href="/?menu=allview";
	</script>
	<%
}
%>
</body>
	</html>