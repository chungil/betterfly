<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>

<%
		HashMap<String, String> logck = new HashMap<>();
		Cookie[] ar = request.getCookies();
		if (ar != null) {
			for (int i = 0; i < ar.length; i++) {
				logck.put(ar[i].getName(), ar[i].getValue());
			}
		}
		request.setAttribute("cmap", logck);
		
		
		if(session.getAttribute("logId")==null){ 
	
%>

<style>
br {
	height: 50;
}
</style>

<div align="center">
	<fieldset>
		<form action="/member/loginauth.jsp">
			<%
			
				String log="login";
				boolean r=logck.containsKey(log);

				if(r){
					String val=logck.get(log);
					System.out.println("val��:::"+val);
				
				%>
				<legend>
					<b>�α���</b>
				</legend>
				<b>ID&nbsp;&nbsp;</b><input type="checkbox" checked="checked" name="save"/>
				<span style="font-size:8pt">���̵� ���</span> <br/>
				<input type="email" required="required" placeholder="email�������� �Է�" name="id" value=<%=val %> /><br /> 
				
			
				<%
				}else{ 
				//��Ű üũ�� ���� �ʴ� ���... ���̵� ���� �Է��ؾ��� ��
				%>
				
				<legend>
					<b>�α���</b>
				</legend>
				<b>ID&nbsp;&nbsp;</b><input type="checkbox" name="save"/>
				<span style="font-size:8pt">���̵� ���</span>
				<br/>
				
				<input type="email" required="required" placeholder="email�������� �Է�" name="id" /><br /> 
				<%  }		%>
				
					
				<b>PASS</b> <input	type="password" required="required" name="pw" /><br />
				<hr />
				
				<input type="submit" value="�α���">
			</form>
		</fieldset>
		<a href="/?menu=join"><b>[ȸ������]</b></a>
	</div>
	<%
	
		}else {%>
	<div >
		<fieldset style="width: 500">
			<legend>
				<b>&gt;��������&lt;</b>
			</legend>
		<ul>
			<li><a href="/?menu=myPage">�� ����</a></li>
			<li><a href="/?menu=recharge">����Ʈ ����</a></li>
			<li><a href="/?menu=search">�������� Ȯ��</a></li>
			
			<li><a href="/member/logout.jsp">�α׾ƿ�</a></li>
		</ul>
		</fieldset>
	</div>
	<%} %>