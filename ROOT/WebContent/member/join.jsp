<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<style>
br {
	height: 50;
}
</style>

<div align="center">
	<fieldset>
		<form action="/member/confirm.jsp">
			<legend>
				<b>ȸ������</b>
			</legend>
			<b>ID</b> <input type="email" required="required"
				placeholder="email�������� �Է�" name="id" /><br /> <b>PASS</b> <input
				type="password" required="required" name="pw" /><br /> <b>NAME</b> <input
				type="text" required="required" name="name" /><br />
			<hr />
			<input type="submit" value="����">
		</form>
	</fieldset>
</div>