<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/resources/js/jquery-3.3.1.min.js" var="jq"></spring:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Entry Customer</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css" />
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
<script type="text/javascript" src="${jq }"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/parsley.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/parsley.min.js"/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<style type="text/css">
	input.parsley-error
		{
		  color: #B94A48 !important;
		  background-color: #F2DEDE !important;
		  border: 1px solid #EED3D7 !important;
		}
</style>

<script type="text/javascript">
	jQuery(document).ready(function(){
		
		//setup datatables
		$('#emp-table').DataTable();
		
		function getValid(validate){
			validate.validate();	
			return validate.isValid();
		}
		
		//save
		$('.save').on('click',function(evt){
			evt.preventDefault();
			$('#insert-cust').modal();
		})
		
		$('#btn-save').on('click',function(evt){
			validate = $('#insert-form').parsley();
			validate.validate();
			if(validate.isValid()){
		
				evt.preventDefault();
				var custName = $('#insert-name-cust').val();
				var address = $('#insert-address').val();
				var contact = $('#insert-contact').val();
				var cust = {
						'custName' : custName,
						'address' : address,
						'contact' : contact
					};
				console.log(cust);
			
				//ajax
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/customer/save',
					data : JSON.stringify(cust),
					contentType : 'application/json',
					success : function(){
						window.location = '${pageContext.request.contextPath}/customer';
					}, error : function(){
						alert('save failed');
					}
					
				});
			}
		});
		//end save
		
		//update
		$('.update').on('click', function(evt){
			evt.preventDefault();
			var id = $(this).attr('id');
			console.log(id);
			
			//ajax ambil data
			$.ajax({
				url : '${pageContext.request.contextPath}/customer/get-one/'+id,
				type : 'GET',
				dataType : 'json',
				success : function(cust){
					setEditCustomer(cust);
					$('#edit-cust').modal();
				},
				error : function(){
					alert('fail ambil data');
				}
			});
			
			
		});
		
		//set edit Customer
		function setEditCustomer(cust){
			$('#edit-id').val(cust.id);
			$('#edit-name').val(cust.custName);
			$('#edit-address').val(cust.address);
			$('#edit-contact').val(cust.contact);
		}
		
		//eksekusi update
		$('#btn-update').on('click', function(){
			var cust = {
					id : $('#edit-id').val(),
					custName : $('#edit-name').val(),
					address : $('#edit-address').val(),
					contact : $('#edit-contact').val(),
					
			}
			//new save after update
			console.log(cust);
			
			$.ajax({
				url : '${pageContext.request.contextPath}/customer/update',
				type : 'PUT',
				data : JSON.stringify(cust),
				contentType : 'application/json',
				success : function(data){
					window.location = '${pageContext.request.contextPath}/customer';
				},
				error : function(){
					alert('Update Gagal');
				}
			});
		});
		//end update
		
		
		//delete
		$('.delete').on('click', function(evt){
			evt.preventDefault;
			var id = $(this).attr('id');
			
			$('#btn-delete').attr('del-id',id);
			$('#delete-cust').modal();
			console.log(id);
			
		})
		
		$('#btn-delete').on('click', function(){
			var id = $('#btn-delete').attr('del-id');
			
			$.ajax({
				url : '${pageContext.request.contextPath}/customer/delete/'+id,
				type : 'DELETE',
				success : function(data){
					window.location = '${pageContext.request.contextPath}/customer';
				},
				error : function(){
					alert('gagal');
				}
			})			
		});//end delete

	});
</script>
</head>
<body>
<div class="container">
	</br></br>
	<button type="button" class="save btn btn-primary">Add New Customer</button>
	</br></br>
	<table id="emp-table" class="table table-sm table-striped table-bordered" cellspacing="0" width="100%">
		<thead class="thead-dark">
			<th>ID</th>
			<th>Name</th>
			<th>Address</th>
			<th>Contact</th>
			<th>Action</th>
		</thead>
		<tbody>
			<c:forEach items="${customers }" var="cust">
				<tr>
					<td>${cust.id }</td>
					<td>${cust.custName }</td>
					<td>${cust.address }</td>
					<td>${cust.contact }</td>
					<td>
						<a id="${cust.id }" class="update btn btn-info btn-sm" href="#">Edit</a> |
						<a id="${cust.id }" class="delete btn btn-danger btn-sm" href="#">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<!-- call modal -->
<%@ include file="modal/insert-modal-cust.jsp" %>
<%@ include file="modal/edit-modal-cust.jsp" %>
<%@ include file="modal/delete-modal.html" %>

</body>
</html>