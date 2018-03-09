<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/resources/js/jquery-3.3.1.min.js" var="jq"></spring:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Entry Employee</title>
<script type="text/javascript" src="${jq }"></script>
<script type="text/javascript">
	jQuery(document).ready(function(){
		//event listener delete
		$('.delete').on('click',function(){
			var id = $(this).attr('id');
			var conf = confirm("Delete this data?");
			if(conf==true){
				//delete data
				window.location = "${pageContext.request.contextPath}/employee/delete/"+id;
			}
			return false;
		})
	})
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/employee/save"
		method="post">
		<input type="text" name="name" placeholder="name" /></br> 
		<input type="text" name="email" placeholder="email" /></br> 
		<input type="text" name="address" placeholder="address" /></br> 
		<input type="text" name="salary" placeholder="salary" /></br>
		<input type="submit" name="save" value="save" />
	</form>
	</br></br>
	<table border="1">
		<thead>
			<th>Name</th>
			<th>Email</th>
			<th>Address</th>
			<th>Salary</th>
			<th>Aksi</th>
		</thead>
		<tbody>
			<c:forEach items="${emps }" var="emp">
				<tr>
					<td>${emp.name }</td>
					<td>${emp.email }</td>
					<td>${emp.address }</td>
					<td>${emp.salary }</td>
					<td>
						<a id="${emp.id }" class="update" href="${pageContext.request.contextPath}/employee/editpage/${emp.id}">Edit</a> |
						<a id="${emp.id }" class="delete" href="#">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>