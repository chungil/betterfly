<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sid=(String)session.getAttribute("logId");
	int money=Integer.parseInt(request.getParameter("money"));
	int r=0;
	
		//연결
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@121.134.125.131:1521:xe", "betterfly", "oracle");
		con.setAutoCommit(false);
		
		try{
		//작업			
		PreparedStatement ps=con.prepareStatement("insert into rechargelog values(rechargelog_seq.nextval,?,?,sysdate)");
			
			//전달받은 값은 일단 디비에 넣고...
			ps.setString(1, sid);
			ps.setInt(2,money);
			r+=ps.executeUpdate();
			
			//아이디 존재 확인
// 			ResultSet rs = ps.executeQuery();
			//Query를 가져오는건 select에서만 되니까 여기선 로그인 작업 할 수 없음
			
			//포인트 적립해주기
			if(r==1){
				PreparedStatement shipPs = con.prepareStatement("update membership set point=point+?/100 where id=?");
				shipPs.setObject(1, money);
				shipPs.setObject(2,sid);
				r += shipPs.executeUpdate();
			}
			
			request.setAttribute("money", money);
			request.setAttribute("rst", r);
			//커밋하기
			if(r==2){
				con.commit();
			}else{
				con.rollback();
			}
	
		}catch(Exception e){
			e.printStackTrace();
			out.println("Exception 오류 발생!");
		}finally{
			con.close();
		}
%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<c:choose>
		<c:when test="${rst eq 2 }">
			<div class="container">
			  <div class="panel-group">
			     <div class="panel panel-success">
			      <div class="panel-heading">포인트 적립</div>
			      <div class="panel-body">"${num }" 포인트가 적립되었습니다. <br/> <i>2초후 페이지가 이동됩니다.</i></div>
			    </div>
			  </div>
			</div>
		</c:when>
			<c:otherwise>
				<div class="container">
				  <div class="panel-group">
				    <div class="panel panel-danger">
				      <div class="panel-heading">포인트 적립</div>
				      <div class="panel-body">포인트 적립을 실패했습니다. <br/> <i>2초후 페이지가 이동됩니다.</i></div>
				    </div>
				  </div>
				</div>
			</c:otherwise>
	</c:choose>
<meta http-equiv="refresh" content="2;url='/'" />