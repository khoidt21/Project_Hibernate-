<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Registration Form</h1>
	<form action="UserControllerServlet" method="post">
		<table cellpadding="3pt">
			<tr>
				<td>User Name :</td>
				<td><input type="text" name="userName" size="30" /></td>
			</tr>
			<tr>
				<td>Password :</td>
				<td><input type="password" name="password1" size="30" /></td>
			</tr>
		</table>
		<p />
		<input type="submit" value="Register" />
	</form>
</body>
</html>