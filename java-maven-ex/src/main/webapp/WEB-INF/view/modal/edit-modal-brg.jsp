<!-- Modal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal fade" id="edit-brg" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Barang</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
		  	<input type="hidden" class="form-control" id="edit-id" placeholder="Enter ID">
		  </div>
		  <div class="form-group">
		    <label for="edit-name">Nama Barang</label>
		    <input type="text" class="form-control" id="edit-name" placeholder="Enter Nama Barang">
		  </div>
		  <div class="form-group">
			<label for="edit-address">Harga</label> 
			<input data-parsley-required="true" type="text" class="form-control" id="edit-harga" placeholder="Enter Harga">
		  </div>
		  <div class="form-group">
			<label for="edit-contact">Stok</label> 
			<input data-parsley-required="true" type="text" class="form-control" id="edit-stok" placeholder="Enter Stok">
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="btn-update" class="btn btn-primary">Update</button>
      </div>
    </div>
  </div>
</div>