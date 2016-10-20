<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>충전하세요!</title>
</head>
<body>
<style>
br {
	height: 50;
}
</style>

<div align="center">
	<fieldset>
		<form action="/member/recharge.jsp">
			<legend>
				<font color="blue" size="8px"><b>>포인트 충전<</b></font>
			</legend>
			<b>충전금액</b> 
			<select name="money" style="font-family:맑은 고딕" >
				<option value="30000">30000(+300pt)</option>
				<option value="10000">10000(+100pt)</option>
				<option value="5000">5000(+50pt)</option>
				<option value="3000">3000(+30pt)</option>
			</select>
			<br /> 
			<hr />
			<input type="submit" value="충전">
		</form>
	</fieldset>
</div>
</body>
</html>