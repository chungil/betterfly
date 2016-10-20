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
					System.out.println("val값:::"+val);
				
				%>
				<legend>
					<b>로그인</b>
				</legend>
				<b>ID&nbsp;&nbsp;</b><input type="checkbox" checked="checked" name="save"/>
				<span style="font-size:8pt">아이디 기억</span> <br/>
				<input type="email" required="required" placeholder="email형식으로 입력" name="id" value=<%=val %> /><br /> 
				
			
				<%
				}else{ 
				//쿠키 체크를 하지 않는 경우... 아이디 새로 입력해아할 때
				%>
				
				<legend>
					<b>로그인</b>
				</legend>
				<b>ID&nbsp;&nbsp;</b><input type="checkbox" name="save"/>
				<span style="font-size:8pt">아이디 기억</span>
				<br/>
				
				<input type="email" required="required" placeholder="email형식으로 입력" name="id" /><br /> 
				<%  }		%>
				
					
				<b>PASS</b> <input	type="password" required="required" name="pw" /><br />
				<hr />
				
				<input type="submit" value="로그인">
			</form>
		</fieldset>
		<a href="/?menu=join"><b>[회원가입]</b></a>
	</div>
	<%
	
		}else {%>
	<div >
		<fieldset style="width: 500">
			<legend>
				<b>&gt;나의정보&lt;</b>
			</legend>
		<ul>
			<li><a href="/?menu=myPage">내 정보</a></li>
			<li><a href="/?menu=recharge">포인트 충전</a></li>
			<li><a href="/?menu=search">충전내역 확인</a></li>
			
			<li><a href="/member/logout.jsp">로그아웃</a></li>
		</ul>
		</fieldset>
	</div>
	<%} %>