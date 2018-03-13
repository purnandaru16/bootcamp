<!-- Modal -->
<div class="modal fade" id="insert-mhs" tabindex="-1" role="dialog"
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
				<form>
					<div class="form-group">
						<input type="hidden" class="form-control" id="insert-id"
							placeholder="Enter Id">
					</div>
					<div class="form-group">
						<label for="input-name">Name</label> <input type="text"
							class="form-control" id="insert-name" placeholder="Enter Name">
					</div>
					<div class="form-group">
						<select id="insert-jurusan" class="custom-select custom-select-md">
							<option selected>Enter Jurusan</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>
					</div>
					<div class="form-group">
						<select id="insert-jurusan2" class="custom-select custom-select-md">
							<option selected>Enter Jurusan</option>
								<c:forEach var="list" items="${mylist}" varStatus="row">
		   							<option value="#">${item}</option>
								</c:forEach>
						</select>
					</div>
					<!-- <div class="form-group">
						<label for="input-jurusan">Jurusan</label> <input type="text"
							class="form-control" id="insert-jurusan" placeholder="Enter Jurusan">
					</div> -->
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" id="btn-save" class="btn btn-primary">Save</button>
			</div>
		</div>
	</div>
</div>