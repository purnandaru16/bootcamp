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
<title>Entry Barang</title>
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
			$('#insert-brg').modal();
		})
		
		$('#btn-save').on('click',function(evt){
			validate = $('#insert-form').parsley();
			validate.validate();
			if(validate.isValid()){
		
				evt.preventDefault();
				var namaBarang = $('#insert-name-brg').val();
				var harga = $('#insert-harga').val();
				var stok = $('#insert-stok').val();
				var brg = {
						'namaBarang' : namaBarang,
						'harga' : harga,
						'stok' : stok
					};
				console.log(brg);
			
				//ajax
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/barang/save',
					data : JSON.stringify(brg),
					contentType : 'application/json',
					success : function(){
						window.location = '${pageContext.request.contextPath}/barang';
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
			var idBrg = $(this).attr('idBrg');
			console.log(idBrg);
			
			//ajax ambil data
			$.ajax({
				url : '${pageContext.request.contextPath}/barang/get-one/'+idBrg,
				type : 'GET',
				dataType : 'json',
				success : function(brg){
					setEditCustomer(brg);
					$('#edit-brg').modal();
				},
				error : function(){
					alert('fail ambil data');
				}
			});
			
			
		});
		
		//set edit Customer
		function setEditCustomer(brg){
			$('#edit-id').val(brg.idBrg);
			$('#edit-name').val(brg.custName);
			$('#edit-harga').val(brg.address);
			$('#edit-stok').val(brg.contact);
		}
		
		//eksekusi update
		$('#btn-update').on('click', function(){
			var cust = {
					idBrg : $('#edit-id').val(),
					namaBarang : $('#edit-name').val(),
					harga : $('#edit-harga').val(),
					stok : $('#edit-stok').val(),
					
			}
			//new save after update
			console.log(cust);
			
			$.ajax({
				url : '${pageContext.request.contextPath}/barang/update',
				type : 'PUT',
				data : JSON.stringify(brg),
				contentType : 'application/json',
				success : function(data){
					window.location = '${pageContext.request.contextPath}/barang';
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
			$('#delete-modal').modal();
			console.log(id);
			
		})
		
		$('#btn-delete').on('click', function(){
			var id = $('#btn-delete').attr('del-id');
			
			$.ajax({
				url : '${pageContext.request.contextPath}/barang/delete/'+id,
				type : 'DELETE',
				success : function(data){
					window.location = '${pageContext.request.contextPath}/barang';
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
	<button type="button" class="save btn btn-primary">Add Barang</button>
	</br></br>
	<table id="emp-table" class="table table-sm table-striped table-bordered" cellspacing="0" width="100%">
		<thead class="thead-dark">
			<th>ID</th>
			<th>Nama Barang</th>
			<th>Harga</th>
			<th>Stok</th>
			<th>Action</th>
		</thead>
		<tbody>
			<c:forEach items="${barangs }" var="brg">
				<tr>
					<td>${brg.idBrg }</td>
					<td>${brg.namaBarang }</td>
					<td>${brg.harga }</td>
					<td>${brg.stok }</td>
					<td>
						<a id="${brg.idBrg }" class="update btn btn-info btn-sm" href="#">Edit</a> |
						<a id="${brg.idBrg }" class="delete btn btn-danger btn-sm" href="#">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<!-- call modal -->
<%@ include file="modal/insert-modal-brg.jsp" %>
<%@ include file="modal/edit-modal-brg.jsp" %>
<%@ include file="modal/delete-modal.html" %>

</body>
</html>