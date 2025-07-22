<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<form method="POST" action="/boards/insert">
<table border="1">
	
	<tr>
		<th>제목</th>
		<td><input type="text" name="biTitle" id="biTitle"></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><input type="text" name="uiName" id="${user.uiNum}"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="biContent" id="biContent"></textarea></td>
	</tr>
	
	<tr>
		<th colspan="3">
			<button>등록</button>
		</th>		
	</tr>
</table>
</form>
</body>
</html>