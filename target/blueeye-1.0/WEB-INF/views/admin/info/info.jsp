<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<c:url var="updateInfoURL" value="/quan-tri/thong-tin"/>
<c:url var="infoAPI" value="/api/info"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin người quản trị</title>
</head>
<body>
	<div id="layoutSidenav_content">
		<div class = "container mt-2">
		<c:if test="${not empty message}">
			<div class="alert alert-${alert}">
			  ${message}
			</div>
		</c:if>
			<form:form id="formSubmit" modelAttribute="model" enctype="multipart/form-data">
				<div class="mb-3 row">
					<div class="col-sm-2" align="right">
				    	<label for="name" class="col-form-label" >Tên người quản trị:</label>
				    </div>
				    <div class="col-sm-10">
				      <form:input path="name" cssClass="form-control col-xs-10 col-sm-5"/>
				    </div>
				</div>
				<div class="mb-3 row">
					<div class="col-sm-2" align="right">
				    	<label for="thumbnail" class="col-form-label" >Ảnh đại diện:</label>
				    </div>
				    <div class="col-sm-10">
				      <input type="file" class="form-control col-xs-10 col-sm-5" id="thumbnail" name="thumbnail">
				    </div>
				</div>
				<div class="mb-3 row">
				    <div class="col-sm-2" align="right">
				    	<label for="content" class="col-form-label" >Nội dung:</label>
				    </div>
				    <div class="col-sm-10">
						<form:textarea path="content" class="form-control" rows="5" id="content"/>
					</div>
				</div>
				<div class="mb-3 row">
					<div class="col-sm-2" align="right">
				    	<label for="email" class="col-form-label" >Email:</label>
				    </div>
				    <div class="col-sm-10">
				      <form:input path="email" cssClass="form-control col-xs-10 col-sm-5"/>
				    </div>
				</div>
				<div class="mb-3 row">
					<div class="col-sm-2" align="right">
				    	<label for="facebook" class="col-form-label" >Facebook:</label>
				    </div>
				    <div class="col-sm-10">
				      <form:input path="facebook" cssClass="form-control col-xs-10 col-sm-5"/>
				    </div>
				</div>
				<form:hidden path="id"/>
				<div class="">
					<div class="ml-5 col-md-9">
						<button class="btn btn-info" type="button" id="btnUpdate">
							<i class="ace-icon fa fa-check bigger-110"></i>
							Cập nhật
						</button>

						&nbsp; &nbsp; &nbsp;
						<button class="btn btn-secondary" type="reset">
							<i class="ace-icon fa fa-undo bigger-110"></i>
							Hủy
						</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
<script type="text/javascript">
	var editor = '';
	$(document).ready(function(){
	    editor = CKEDITOR.replace('content');
	});

	$('#btnUpdate').click(function (e) {
	    e.preventDefault();
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function(i,v){
			data["" + v.name + ""] = v.value;
	    });
	    data["content"] = editor.getData();
	    updateInfo(data);
	});

	function updateInfo(data){
		$.ajax({
            url: "${infoAPI}",
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${updateInfoURL}?id="+result.id+"&message=update_success";
            },
            error: function (error) {
            	window.location.href = "${updateInfoURL}?id="+result.id+"&message=error_system";
            }
        });
	}
</script> 
</body>
</html>