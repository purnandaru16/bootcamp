<!-- Modal -->
<div class="modal fade" id="insert-cust" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">New Mahasiswa</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="insert-form">
					<div class="form-group">
						<input type="hidden" class="form-control" id="insert-id-cust" placeholder="Enter Id">
					</div>
					<div class="form-group">
						<label for="insert-name">Name</label> 
						<input data-parsley-required="true" type="text" class="form-control" id="insert-name-cust" placeholder="Enter Name">
					</div>
					<div class="form-group">
						<label for="insert-address">Address</label> 
						<input data-parsley-required="true" type="text" class="form-control" id="insert-address" placeholder="Enter Address">
					</div>
					<div class="form-group">
						<label for="insert-contact">Contact</label> 
						<input data-parsley-required="true" type="text" class="form-control" id="insert-contact" placeholder="Enter Contact">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" id="btn-save" class="btn btn-primary">Save</button>
			</div>
		</div>
	</div>
</div>
