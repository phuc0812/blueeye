<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-us">

<head>
	<meta charset="utf-8">
	<title>BlueEye</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5">
	<meta name="description" content="This is meta description">
	<meta name="author" content="Themefisher">
	<link rel="shortcut icon" href="<c:url value='/template/web/images/blueeye.png'/>" type="image/x-icon">
	<link rel="icon" href="<c:url value='/template/web/images/blueeye.png'/>" type="image/x-icon">
  
	  <!-- theme meta -->
	  <meta name="theme-name" content="reporter" />

	<!-- # Google Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Neuton:wght@700&family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">

	<!-- # CSS Plugins -->
	<link rel="stylesheet" href="<c:url value='/template/web/plugins/bootstrap/bootstrap.min.css'/>">
	<!-- JS -->
	<script src="<c:url value='/template/web/plugins/jquery/jquery.min.js'/>"></script>
	<!-- # Main Style Sheet -->
	<link rel="stylesheet" href="<c:url value='/template/web/css/style.css'/>">
	<link rel="stylesheet" href="<c:url value='/template/web/scrolltotop/style.css'/>">
	
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
</head>

<body>

<!-- header -->
	<%@include file = "/common/web/header.jsp" %>
<!-- body -->
	<section class="section">
	    <div class="container">
	      <div class="row no-gutters-lg">
			<dec:body/>
			<%@include file = "/common/web/menu.jsp" %>
		  </div>
		</div>
	</section>
	<a id="button"><i class="fa fa-chevron-up fa-lg"></i></a>
<!-- footer -->
	<%@include file = "/common/web/footer.jsp" %>
	
	<script type="text/javascript">
		var btn = $('#button');
	
		$(window).scroll(function() {
		  if ($(window).scrollTop() > 300) {
		    btn.addClass('show');
		  } else {
		    btn.removeClass('show');
		  }
		});
	
		btn.on('click', function(e) {
		  e.preventDefault();
		  $('html, body').animate({scrollTop:0}, '300');
		});
		
		window.onbeforeunload = function() {
	        window.scrollTo(0, 0);
	    };
	</script>

<!-- paging -->
<script src="<c:url value='/template/web/paging/jquery.twbsPagination.js'/>" type="text/javascript"></script>
<!-- # JS Plugins -->
<script src="<c:url value='/template/web/plugins/bootstrap/bootstrap.min.js'/>"></script>
<!-- Main Script -->
<script src="<c:url value='/template/web/js/script.js'/>"></script>

</body>
</html>