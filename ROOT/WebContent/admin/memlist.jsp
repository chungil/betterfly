<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
	try{	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con =null; 
		con=DriverManager.getConnection
				("jdbc:oracle:thin:@121.134.125.131:1521:xe", "betterfly","oracle");
	
		PreparedStatement ps = con.prepareStatement("select * from member2 m, membership s where m.id=s.id order by s.lv desc, s.point desc");
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()){
				do{
				String id=rs.getString("id");
				String name=rs.getString("name");
				Date d=rs.getDate("joindate");
				int lv=rs.getInt("lv");
				int point=rs.getInt("point");
				
				%>
				�� <strong><%=id %>(<%=name %>)</strong> | <%=d %> | <i><%=lv %>lv(<%=point %>pt)</i>
				<br/>
				<%
				}while(rs.next());
				//do-while >> if ��Ȳ�� ������ ���� �����ϰ� ���� while������ ��� �ݺ�����
			}else{
				out.println("�ش� ������ ����!!!");			
		}
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}finally{
// 		con.close(); �� ���� ������ ������?
	}
%>