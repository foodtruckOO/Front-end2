<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 메뉴 등록 -->
<div style="font-size: 2em; color: gray">메뉴 등록</div>
<hr>
<form>	
	<!-- ---------------------------------------------------------------------- -->
	<link rel="stylesheet"
		href="<c:url value='/bootstrap/js/fancy-file-uploader/fancy_fileupload.css'/>"
		type="text/css" media="all" />
	<div>
		<input id="thefiles" type="file" name="files" accept=".jpg, .png, image/jpeg, image/png" multiple style="display: none;">
		<input id="demo" type="file" name="files" accept=".jpg, .png, image/jpeg, image/png" multiple>
	</div>
	<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->
	<script type="text/javascript" src="<c:url value='/bootstrap/js/fancy-file-uploader/jquery.ui.widget.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/fancy-file-uploader/jquery.fileupload.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/fancy-file-uploader/jquery.iframe-transport.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/fancy-file-uploader/jquery.fancy-fileupload.js'/>"></script>
	<script type="text/javascript">
		$(function() {
			$('#thefiles').FancyFileUpload({
				params : {
					action : 'fileuploader'
				},
				maxfilesize : 1000000
			});
		});
		
		$('#demo').FancyFileUpload({

			  // send data to this url
			  'url' : '',

			  // key-value pairs to send to the server
			  'params' : {},

			  // editable file name?
			  'edit' : true,

			  // max file size
			  'maxfilesize' : -1,

			  // a list of allowed file extensions
			  'accept' : null,

			  // 'iec_windows', 'iec_formal', or 'si' to specify what units to use when displaying file sizes
			  'displayunits' : 'iec_windows',

			  // adjust the final precision when displaying file sizes
			  'adjustprecision' : true,

			  // the number of retries to perform before giving up
			  'retries' : 5,

			  // the base delay, in milliseconds, to apply between retries
			  'retrydelay' : 500,

			  // called for each item after it has been added to the DOM
			  'added' : null,

			  // called whenever starting the upload
			  'startupload' : null,

			  // called whenever progress is up<a href="https://www.jqueryscript.net/time-clock/">date</a>d
			  'continueupload' : null,

			  // called whenever an upload has been cancelled
			  'uploadcancelled' : null,

			  // called whenever an upload has successfully completed
			  'uploadcompleted' : null,

			  // jQuery File Upload options
			  'fileupload' : {},

			  // translation strings here
			  'lang<a href="https://www.jqueryscript.net/tags.php?/map/">map</a>' : {},

			  // A valid callback function that is called during initialization to allow for last second changes to the settings. 
			  // Useful for altering fileupload options on the fly. 
			  'preinit' : null,

			});
	</script>
	<!-- ---------------------------------------------------------------------- -->
	
	<button type="submit" class="btn btn-default">등록</button>
</form>