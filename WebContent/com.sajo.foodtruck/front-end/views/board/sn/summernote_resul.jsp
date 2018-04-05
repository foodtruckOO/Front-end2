<?
$content = $_POST['content'];
?>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery.form/3.51/jquery.form.min.js'></script>

<!-- include summernote css/js-->
<link href="/sn/summernote.css" rel="stylesheet">
<script src="/sn/summernote.min.js"></script>

<!-- include summernote-ko-KR -->
<script src="/sn/lang/summernote-ko-KR.js"></script>
</head>
<body>
	<div id="summernote">
		<?=$content?>
	</div>
<script>
$(document).ready(function() {
});

</script>
</body>
</html>