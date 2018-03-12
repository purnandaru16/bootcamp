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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css" />
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
<script type="text/javascript" src="${jq }"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<script type="text/javascript">
	jQuery(document).ready(function(){
		
		//setup datatables
		$('#emp-table').DataTable();
		
		$('.save').on('click',function(evt){
			evt.preventDefault();
			$('#insert-emp').modal();
		})
		
		//save
		$('#btn-save').on('click',function(evt){
			evt.preventDefault();
			var name = $('#insert-name').val();
			var email = $('#insert-email').val();
			var address = $('#insert-address').val();
			var salary = $('#insert-salary').val();
			var employee = {
				'name' : name,
				'email' : email,
				'address' : address,
				'salary' : salary
			};
			console.log(employee);
			//ajax
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/ajax-emp/save',
				data : JSON.stringify(employee),
				contentType : 'application/json',
				success : function(){
					window.location = '${pageContext.request.contextPath}/ajax-emp';
				}, error : function(){
					alert('save failed');
				}
				
			});
			
		}); //end save
		
		//update modal
		$('.update').on('click', function(evt){
			evt.preventDefault();
			var id = $(this).attr('id');
			
			//ajax ambil data
			$.ajax({
				url : '${pageContext.request.contextPath}/ajax-emp/get-one/'+id,
				type : 'GET',
				dataType : 'json',
				success : function(emp){
					$('#input-id').val(emp.id);
					$('#input-name').val(emp.name);
					$('#input-email').val(emp.email);
					$('#input-address').val(emp.address);
					$('#input-salary').val(emp.salary);
					//call modal id
					$('#modal-emp').modal();
				},
				error : function(){
					alert('fail ambil data');
				}
			});
			
			
		})
		//eksekusi update
		$('#btn-update').on('click', function(){
			var emp = {
					id : $('#input-id').val(),
					name : $('#input-name').val(),
					email : $('#input-email').val(),
					address : $('#input-address').val(),
					salary : $('#input-salary').val()
			}
			//new save after update
			console.log(emp);
			
			$.ajax({
				url : '${pageContext.request.contextPath}/ajax-emp/update',
				type : 'PUT',
				data : JSON.stringify(emp),
				contentType : 'application/json',
				success : function(data){
					window.location = '${pageContext.request.contextPath}/ajax-emp';
				},
				error : function(){
					alert('gagal');
				}
			})
		})//end update
		
		//delete
		$('.delete').on('click',function(evt){
			evt.preventDefault();
			var id = $(this).attr('id');
			
			$('#delete-id').val(id);
			//cara 2
			//$('btn-delete').attr('del-id', id);
			$('#delete-emp').modal();
		})
		//eksekusi delete
		$('#btn-delete').on('click', function(){
			var id = $('#delete-id').val();
			
			//cara2
			//var id = $('#btn-delete').attr('del-id');
			
			$.ajax({
				url : '${pageContext.request.contextPath}/ajax-emp/delete/'+id,
				type : 'DELETE',
				success : function(data){
					window.location = '${pageContext.request.contextPath}/ajax-emp';
				},
				error : function(){
					alert('gagal');
				}
			})
		})//end delete
	});
</script>
</head>
<body>
<div class="container">
	</br></br>
	<button type="button" class="save btn btn-primary">Add New Employee</button>
	</br></br>
	<table id="emp-table" class="table table-sm table-striped table-bordered" cellspacing="0" width="100%">
		<thead class="thead-dark">
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
			<th>Address</th>
			<th>Salary</th>
			<th>Aksi</th>
		</thead>
		<tbody>
			<c:forEach items="${emps }" var="emp">
				<tr>
					<td>${emp.id }</td>
					<td>${emp.name }</td>
					<td>${emp.email }</td>
					<td>${emp.address }</td>
					<td>${emp.salary }</td>
					<td>
						<a id="${emp.id }" class="update btn btn-info btn-sm" href="#">Edit</a> |
						<a id="${emp.id }" class="delete btn btn-danger btn-sm" href="#">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

	<!-- call modal -->
	<%@ include file="modal/insert-modal.html" %>
	<%@ include file="modal/edit-modal.html" %>
	<%@ include file="modal/delete-modal.html" %>

</body>
</html>