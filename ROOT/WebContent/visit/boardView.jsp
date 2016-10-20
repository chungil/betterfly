<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="mybatis.SqlSessionUtil" %>
<%@ page import="org.apache.ibatis.session.*"%>
<%@ page import="org.apache.ibatis.io.*"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//���丮 ����
	SqlSessionFactory fac=(SqlSessionFactory)application.getAttribute("factory");
	SqlSession ss=fac.openSession();
	
	//�Ķ���� ����
	String sid=(String)session.getAttribute("logId");
	int num=Integer.parseInt(request.getParameter("num"));
		String memo=null;
	
	//�۾�
	try{
// 		HashMap boardMap=ss.selectOne("visit.boardView", num);
		List<HashMap> boardMap=ss.selectList("visit.boardView",num);
		for(int i=0;i<boardMap.size();i++){	
			HashMap m=boardMap.get(i);
				memo=String.valueOf(m.get("MEMO"));
				request.setAttribute("memo", memo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ss.close();
		}
%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div class="container">
  <h2>����</h2>
    <div class="form-group">
      <textarea name="memo" class="form-control" rows="10" id="comment" readonly="readonly" style="resize:none;">${memo}</textarea>
    </div>
</div>

<div align="right">
 	<input type="button" value="���" onclick="location.href='/?menu=allview'">
	<input type="button" value="�ۻ���" onclick="javascript:move()" >
</div>

<script>
function move() {
	if(confirm("������ �����Ͻðڽ��ϱ�??")) {
			location.href="/visit/removeMemo.jsp?num=<%=num %>";
	}
}
</script>
