<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="mybatis.SqlSessionUtil"%>
<%@ page import="org.apache.ibatis.session.*"%>
<%@ page import="org.apache.ibatis.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="pojo.Visitbook"%>
<%@page import="java.sql.*"%>

<%
	//���ᰪ �ޱ�
	
	String sid = (String) session.getAttribute("logId");
	String memo = request.getParameter("memo");
	String ip = request.getRemoteAddr();
	int r = 0;

	//sqlfactory����...!
	SqlSessionFactory fac = (SqlSessionFactory) application.getAttribute("factory");
	SqlSession ss = fac.openSession();

	try {
		//�۾�
		//map�̿�...
// 		HashMap memoMap = new HashMap();
// 			memoMap.put("writer", sid);
// 			memoMap.put("memo", memo);
// 			memoMap.put("ip", ip);
// 		//r==>1
// 		r= ss.insert("visit.newMemo", memoMap);

		//pojo�̿�
		Visitbook vb=new Visitbook();
			vb.writer=(String)session.getAttribute("logId");
			vb.memo=request.getParameter("memo");
			vb.ip=request.getRemoteAddr()	;
		r=ss.insert("visit.newMemo",vb);
	
		if (r == 1) {
%>
		<script type="text/javascript">
			alert("�Խñ� ��ϿϷ�!");
			document.location.href = "/?menu=allview";
		</script>
<%
		ss.commit();
		} else {
			ss.rollback();
		}
	} catch (Exception e) {
		e.printStackTrace();
		ss.rollback();
		out.println("Exception error�߻�!!");
	} finally {
		//����
		ss.close();
	}
%>