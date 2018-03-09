<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/resources/js/jquery-3.3.1.min.js" var="jq"></spring:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Employee</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/employee/save"
		method="post">
		<input type="hidden" name="id" value="${emp.id }" />
		<input type="text" name="name" value="${emp.name }" placeholder="name" /></br> 
		<input type="text" name="email" value="${emp.email }" placeholder="email" /></br> 
		<input type="text" name="address" value="${emp.address }" placeholder="address" /></br>
		<input type="text" name="salary" value="${emp.salary }" placeholder="salary" /></br> 
		<input type="submit" name="save" value="save" />
	</form>
</body>
</html>