<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blue Eye</title>
</head>
<body>
	
	        <div class="col-12">
	          <h2 class="section-title">Nội dung tìm kiếm: ${s}</h2>
	        </div>
	        <div class="col-lg-8 mb-5 mb-lg-0">
			<form id="formSubmit">
	          <div class="row">
	          	<div class="col-12 mb-4">
	              <article class="card article-card">
		            <c:forEach var="item" items="${model.listResult}">
		            	<div class="mb-3">
		            		<h3><a class="post-title" href="<c:url value='/bai-viet?id=${item.id}'/>">${item.title}</a></h3>
		            		<h5>${item.shortDescription}</h5>
		            	</div>	
		            </c:forEach>
		          </article>
		        </div>    
	            <div class="col-12">
         			<div class="mt-4">
         				<nav class="mb-md-50">
       						<ul class="pagination" id="pagination"></ul>
						</nav>
         			</div>
	            </div>
	            <input type="hidden" value="" id="page" name="page"/>
				<input type="hidden" value="" id="limit" name="limit"/>	
				<input type="hidden" value="${s}" id="s" name="s"/>	
	           </div>
			  </form>
	          </div>
	       
	<script type="text/javascript">
		var totalPages = ${model.totalPage}
		var currentPage = 1
		if(${model.page} != null){
			currentPage = ${model.page}
		}
		$(function () {
	        window.pagObj = $('#pagination').twbsPagination({
	            totalPages: totalPages,
	            visiblePages: 3,
	            startPage: currentPage,
	            first: '<<',
	            prev: '<',
	            next: '>',
	            last: '>>',
	            onPageClick: function (event, page) {
	            	if (currentPage != page) {
	            		$('#limit').val(2);
						$('#page').val(page);
						$('#formSubmit').submit();
					}
	            }
	        });
		});
	</script>
</body>
</html>