<!-- Modal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal fade" id="edit-cust" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Mahasiswa</h5>
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
		    <label for="edit-name">Name</label>
		    <input type="text" class="form-control" id="edit-name" placeholder="Enter Name">
		  </div>
		  <div class="form-group">
			<label for="edit-address">Address</label> 
			<input data-parsley-required="true" type="text" class="form-control" id="edit-address" placeholder="Enter Address">
		  </div>
		  <div class="form-group">
			<label for="edit-contact">Contact</label> 
			<input data-parsley-required="true" type="text" class="form-control" id="edit-contact" placeholder="Enter Contact">
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