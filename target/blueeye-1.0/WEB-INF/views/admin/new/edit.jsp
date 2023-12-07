<%@ include file = "/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:url var="newURL" value="/quan-tri/bai-viet/danh-sach"/> 
<c:url var="editNewURL" value="/quan-tri/bai-viet/chinh-sua"/> 
<c:url var="newAPI" value="/api/new"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa bài viết</title>
</head>
<body>
	<div id="layoutSidenav_content">
		<div class = "container mt-2 mb-2">
			<c:if test="${not empty message}">
				<div class="alert alert-${alert}">
				  ${message}
				</div>
			</c:if>
			<form:form id="formSubmit" modelAttribute="model" enctype="multipart/form-data">
				<div class="mb-3 row">
					<div class="col-sm-2" align="right">
						<label for="categoryCode" class="col-form-label">Thể loại:</label>
					</div>
					<div class="col-sm-10">
						<form:select path="categoryCode" id="categoryCode" cssClass="form-control col-xs-10 col-sm-2">
							<form:option value="" label="--chọn thể loại--"/>
							<form:options items="${categories}"/>
						</form:select>
					</div>
				</div>
				<div class="mb-3 row">
					<div class="col-sm-2" align="right">
				    	<label for="title" class="col-form-label" >Tên bài viết:</label>
				    </div>
				    <div class="col-sm-10">
				      <form:input path="title" cssClass="form-control col-xs-10 col-sm-5"/>
				    </div>
				</div>
				<div class="mb-3 row">
					<div class="col-sm-2" align="right">
				    	<label for="thumbnail" class="col-form-label" >Ảnh đại diện:</label>
				    	<%-- <form:label path="thumbnail" class="col-form-label">Ảnh đại diện:</form:label> --%>
				    </div>
				    <div class="col-sm-10">
				      <input type="file" class="form-control col-xs-10 col-sm-5" id="thumbnail" name="thumbnail">
				    </div>
				</div>
			    <div class="mb-3 row">
				    <div class="col-sm-2" align="right">
				    	<label for="shortDescription" class="col-form-label" >Mô tả ngắn::</label>
				    </div>
				    <div class="col-sm-10">
						<form:textarea path="shortDescription" class="form-control" rows="5" id="shortDescription"/>
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
				<form:hidden path="id" id="newId"/>
				<div class="">
					<div class="ml-5 col-md-9">
						<c:if test="${not empty model.id}">
							<button class="btn btn-info" type="button" id="btnAddOrUpdateNew">
								<i class="ace-icon fa fa-check bigger-110"></i>
								Cập nhật bài viết
							</button>
						</c:if>
						<c:if test="${empty model.id}">
							<button class="btn btn-info" type="button" id="btnAddOrUpdateNew">
								<i class="ace-icon fa fa-check bigger-110"></i>
								Thêm mới bài viết
							</button>
						</c:if>

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
	    editor = CKEDITOR.replace('content', );
	});

	$('#btnAddOrUpdateNew').click(function (e) {
	    e.preventDefault();
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function(i,v){
			data["" + v.name + ""] = v.value;
	    });
	    data["content"] = editor.getData();
	    var id = $('#newId').val();
	    if(id == ""){
		    addNew(data);
		} else {
			updateNew(data);
		}
	});

	function addNew(data){
		$.ajax({
            url: '${newAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${editNewURL}?id="+result.id+"&message=insert_success";
            },
            error: function (error) {
            	window.location.href = "${newURL}?page=1&limit=2&message=error_system";
            }
        });
	}

	function updateNew(data){
		$.ajax({
            url: '${newAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${editNewURL}?id="+result.id+"&message=update_success";
            },
            error: function (error) {
            	window.location.href = "${editNewURL}?id="+result.id+"&message=error_system";
            }
        });
	}
</script>	
</body>
</html>