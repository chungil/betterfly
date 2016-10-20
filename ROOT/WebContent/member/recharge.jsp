<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sid=(String)session.getAttribute("logId");
	int money=Integer.parseInt(request.getParameter("money"));
	int r=0;
	
		//����
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@121.134.125.131:1521:xe", "betterfly", "oracle");
		con.setAutoCommit(false);
		
		try{
		//�۾�			
		PreparedStatement ps=con.prepareStatement("insert into rechargelog values(rechargelog_seq.nextval,?,?,sysdate)");
			
			//���޹��� ���� �ϴ� ��� �ְ�...
			ps.setString(1, sid);
			ps.setInt(2,money);
			r+=ps.executeUpdate();
			
			//���̵� ���� Ȯ��
// 			ResultSet rs = ps.executeQuery();
			//Query�� �������°� select������ �Ǵϱ� ���⼱ �α��� �۾� �� �� ����
			
			//����Ʈ �������ֱ�
			if(r==1){
				PreparedStatement shipPs = con.prepareStatement("update membership set point=point+?/100 where id=?");
				shipPs.setObject(1, money);
				shipPs.setObject(2,sid);
				r += shipPs.executeUpdate();
			}
			
			request.setAttribute("money", money);
			request.setAttribute("rst", r);
			//Ŀ���ϱ�
			if(r==2){
				con.commit();
			}else{
				con.rollback();
			}
	
		}catch(Exception e){
			e.printStackTrace();
			out.println("Exception ���� �߻�!");
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
			      <div class="panel-heading">����Ʈ ����</div>
			      <div class="panel-body">"${num }" ����Ʈ�� �����Ǿ����ϴ�. <br/> <i>2���� �������� �̵��˴ϴ�.</i></div>
			    </div>
			  </div>
			</div>
		</c:when>
			<c:otherwise>
				<div class="container">
				  <div class="panel-group">
				    <div class="panel panel-danger">
				      <div class="panel-heading">����Ʈ ����</div>
				      <div class="panel-body">����Ʈ ������ �����߽��ϴ�. <br/> <i>2���� �������� �̵��˴ϴ�.</i></div>
				    </div>
				  </div>
				</div>
			</c:otherwise>
	</c:choose>
<meta http-equiv="refresh" content="2;url='/'" />