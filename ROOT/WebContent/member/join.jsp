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
				<b>회원가입</b>
			</legend>
			<b>ID</b> <input type="email" required="required"
				placeholder="email형식으로 입력" name="id" /><br /> <b>PASS</b> <input
				type="password" required="required" name="pw" /><br /> <b>NAME</b> <input
				type="text" required="required" name="name" /><br />
			<hr />
			<input type="submit" value="다음">
		</form>
	</fieldset>
</div>