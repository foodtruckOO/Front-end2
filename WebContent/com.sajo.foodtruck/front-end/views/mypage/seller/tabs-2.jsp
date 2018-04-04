<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 

<script>
	$(function() {
		$('html, body').css({'height': '100%'});
	});
</script>
<!-- 메뉴 -->
<div class="col-md-4" >
	<div data-toggle="modal" data-target="#menuModal" style="cursor: pointer;">
		<!-- 메뉴 이미지 -->
		<div style="background-color: green; width: 100%; display: block; padding-top: 100%">
		</div>
	  	<!-- 가격 -->	
	  	<div style="height: 80PX; background-color: #efefe7;">
	  	</div>
  	</div>
</div>
<!-- 그림 세개당 한줄 -->



<!-- Modal -->
<div class="modal fade" id="menuModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>