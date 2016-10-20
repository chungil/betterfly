<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<style>
input {
	font-family: 맑은 고딕;		
}
</style>
<div align="center">
	<fieldset style="width: 500">
		<legend>
			<b>&gt;충전내역확인&lt;</b>
		</legend>
		<form action="/">
			<input type="hidden" name="menu" value="findlog" />
			<b>기간</b>
			<input type="date" name="start"> ~ <input type="date" name="end">   
			<hr />
			<input type="submit" value="다음" />
		</form>
	</fieldset>
</div>

