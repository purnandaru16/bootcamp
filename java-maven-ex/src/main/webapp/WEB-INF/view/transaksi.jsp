<%@page import="com.xsis.ex.model.Barang"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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
<title>Transaksi</title>
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
		$('#tansaction-table').DataTable();
		
		function getValid(validate){
			validate.validate();	
			return validate.isValid();
		}
		
		//simpan di tabel pesanan
		$('#btn-pilih').on('click', function(){
			evt.preventDefault();
			var namaBarang = $('#insert-nama').val();
			var harga = $('#insert-harga').val();
			var jumlah = $('#select-jumlah').val();
			var status = 0;
			var order = {
				'namaBarang' : namaBarang,
				'harga' : harga,
				'jumlah' : address,
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
		});
		
		
		//disabled button pilih
		$('.pilih').on('click', function() {
			
		    $(this).prop('disabled', true);
		    
		});
		
		//tooltip
		$(function () {
			$('[data-toggle="tooltip"]').tooltip()
		})
		
		$().button('toggle');
		
	});
</script>
</head>
<body>
<div class="container">
	<br><br>
	<h3>Transaksi Penjualan</h3>
	<div class="row">
	  <div class="col-md-2">
	  	<label for="id-cust">ID Customer</label>
	  	<input type="text" class="form-control" id="id-cust" readonly value="1">
	  </div>
	  <div class="col-md-10"></div>
	</div>
	
	<hr class="style5">
	<table id="tansaction-table" class="table table-sm table-striped table-bordered" cellspacing="0" width="100%">
		<thead class="thead-dark">
			<th>Nama Barang</th>
			<th>Harga</th>
			<th>Jumlah</th>
			<th>Action</th>
		</thead>
		<tbody>
			<c:forEach items="${barangs }" var="brg">
				<tr>
					<td id="input-nama">${brg.namaBarang }</td>
					<td id="input-harga">${brg.harga }</td>
					<td>
						<select name="barang" id="select-jumlah" class="custom-select custom-select-sm">
			    			<%			
			    			for(int i=1;i<=10;i++){
			    				out.print("<option>"+i+"</option>");
			    			}
			    			%>
						</select>
					</td>
					<td>
						<a id="btn-pilih" class="pilih btn btn-info btn-sm" data-toggle="tooltip" data-placement="bottom" title="Pilih barang" data-toggle="button" aria-pressed="false" autocomplete="off" href="#">Pilih</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<hr class="style5">
	<div class="row">
	  <div class="col-md-10"></div>
	  <div class="col-md-2"><button type="button" class="cart btn btn-danger btn-block">Keranjang</button></div>
	</div>
		
</div>

<!-- call modal -->
<%@ include file="modal/insert-modal-brg.jsp" %>
<%@ include file="modal/edit-modal-brg.jsp" %>
<%@ include file="modal/delete-modal.html" %>

</body>
</html>