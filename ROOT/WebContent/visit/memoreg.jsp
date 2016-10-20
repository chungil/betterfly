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
	//연결값 받기
	
	String sid = (String) session.getAttribute("logId");
	String memo = request.getParameter("memo");
	String ip = request.getRemoteAddr();
	int r = 0;

	//sqlfactory접속...!
	SqlSessionFactory fac = (SqlSessionFactory) application.getAttribute("factory");
	SqlSession ss = fac.openSession();

	try {
		//작업
		//map이용...
// 		HashMap memoMap = new HashMap();
// 			memoMap.put("writer", sid);
// 			memoMap.put("memo", memo);
// 			memoMap.put("ip", ip);
// 		//r==>1
// 		r= ss.insert("visit.newMemo", memoMap);

		//pojo이용
		Visitbook vb=new Visitbook();
			vb.writer=(String)session.getAttribute("logId");
			vb.memo=request.getParameter("memo");
			vb.ip=request.getRemoteAddr()	;
		r=ss.insert("visit.newMemo",vb);
	
		if (r == 1) {
%>
		<script type="text/javascript">
			alert("게시글 등록완료!");
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
		out.println("Exception error발생!!");
	} finally {
		//종료
		ss.close();
	}
%>