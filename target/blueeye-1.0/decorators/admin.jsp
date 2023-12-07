<%@ include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Trang chủ</title>
        <link href="<c:url value='/template/admin/css/styles.css'/>" rel="stylesheet"/>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
    	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
        <link rel="shortcut icon" href="<c:url value='/template/admin/images/blueeye.png'/>" type="image/x-icon">
		<link rel="icon" href="<c:url value='/template/admin/images/blueeye.png'/>" type="image/x-icon">
		
		<!-- sweetalert -->
		<script src="<c:url value='/template/admin/sweetalert/sweetalert2.min.js'/>"></script>
		<link href="<c:url value='/template/admin/sweetalert/sweetalert2.min.css'/>" rel="stylesheet"/>
		
		<!-- CKEditor -->
		<script src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
		
</head>
<body class="sb-nav-fixed">
        <!-- header -->
        <%@ include file="/common/admin/header.jsp" %>
        
        <div id="layoutSidenav">
	        <!-- menu -->
	        <%@ include file="/common/admin/menu.jsp" %>
	        <!-- body -->
        	<dec:body/>
        </div>
        
        <!-- footer -->
        <script src="<c:url value='/template/admin/paging/jquery.twbsPagination.js'/>" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<c:url value='/template/admin/js/scripts.js'/>"></script>
</body>
</html>
