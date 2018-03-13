<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/resources/js/jquery-3.3.1.min.js" var="jq"></spring:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Entry Mahasiswa</title>
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
			$('#insert-mhs').modal();
		})
		
		//save
		$('#btn-save').on('click',function(evt){
			evt.preventDefault();
			var name = $('#insert-name').val();
			var jurusan = $('#insert-jurusan').val();
			var mhs = {
				'name' : name,
				'jurusan' : {
					'id' : jurusan
				}
			};
			console.log(mhs);
			//ajax
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/mhs/save',
				data : JSON.stringify(mhs),
				contentType : 'application/json',
				success : function(){
					window.location = '${pageContext.request.contextPath}/mhs';
				}, error : function(){
					alert('save failed');
				}
				
			});
			
		}); //end save
		
		//update modal
		$('.update').on('click', function(evt){
			evt.preventDefault();
			var id = $(this).attr('id');
			console.log(id);
			
			//ajax ambil data
			$.ajax({
				url : '${pageContext.request.contextPath}/mhs/get-one/'+id,
				type : 'GET',
				dataType : 'json',
				success : function(mhs){
					setEditMahasiswa(mhs);
					$('#edit-mhs').modal();
				},
				error : function(){
					alert('fail ambil data');
				}
			});
			
			
		});
		
		//set edit mahasiswa
		function setEditMahasiswa(mhs){
			$('#input-id').val(mhs.id);
			$('#input-name').val(mhs.name);
			$('#jurusan').val(mhs.jurusan.id);
		}
		
		//eksekusi update
		$('#btn-update').on('click', function(){
			var mhs = {
					id : $('#input-id').val(),
					name : $('#input-name').val(),
					jurusan : {
						id : $('#jurusan').val()
					}
			}
			//new save after update
			console.log(mhs);
			
			$.ajax({
				url : '${pageContext.request.contextPath}/mhs/update',
				type : 'PUT',
				data : JSON.stringify(mhs),
				contentType : 'application/json',
				success : function(data){
					window.location = '${pageContext.request.contextPath}/mhs';
				},
				error : function(){
					alert('Update Gagal');
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
				url : '${pageContext.request.contextPath}/mhs/delete/'+id,
				type : 'DELETE',
				success : function(data){
					window.location = '${pageContext.request.contextPath}/mhs';
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
	<button type="button" class="save btn btn-primary">Add New Mahasiswa</button>
	</br></br>
	<table id="emp-table" class="table table-sm table-striped table-bordered" cellspacing="0" width="100%">
		<thead class="thead-dark">
			<th>ID</th>
			<th>Name</th>
			<th>Jurusan</th>
			<th>Action</th>
		</thead>
		<tbody>
			<c:forEach items="${mhss }" var="mhs">
				<tr>
					<td>${mhs.id }</td>
					<td>${mhs.name }</td>
					<td>${mhs.jurusan.nameJurusan }</td>
					<td>
						<a id="${mhs.id }" class="update btn btn-info btn-sm" href="#">Edit</a> |
						<a id="${mhs.id }" class="delete btn btn-danger btn-sm" href="#">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

	<!-- call modal -->
	<%@ include file="modal/insert-modal-mhs.jsp" %>
	<%@ include file="modal/edit-modal-mhs.jsp" %>
	<%@ include file="modal/delete-modal.html" %>

</body>
</html>