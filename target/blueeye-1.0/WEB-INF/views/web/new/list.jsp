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
	          <h2 class="section-title">Thể loại: ${category}</h2>
	        </div>
	        <div class="col-lg-8 mb-5 mb-lg-0">
			<form id="formSubmit">
	          <div class="row">
	            <c:forEach var="item" items="${model.listResult}">
	            <div class="col-md-6 mb-4">
	              <article class="card article-card article-card-sm h-100">
	                <a href="<c:url value='/bai-viet?id=${item.id}'/>">
	                  <div class="card-image">
	                    <div class="post-info"> 
	                    	<span class="text-uppercase">${item.modifiedDate}</span>
	                    </div>
	                    <img loading="lazy" decoding="async" src="<c:url value='/assets/web/img/${item.thumbnail}'/>" alt="Post Thumbnail" class="w-100">
	                  </div>
	                </a>
	                <div class="card-body px-0 pb-0">
	                  <ul class="post-meta mb-2">
	                    <li> <a href="<c:url value='/bai-viet/the-loai?categoryCode=${item.categoryCode}'/>">${item.categoryCode}</a><!-- sửa chỗ này -->
	                    </li>
	                  </ul>
	                  <h2><a class="post-title" href="<c:url value='/bai-viet?id=${item.id}'/>">${item.title}</a></h2>
	                  <p class="card-text">${item.shortDescription}</p>
	                </div>
	              </article>
	            </div>
	            </c:forEach>
	            <div class="col-12">
         			<div class="mt-4">
         				<nav class="mb-md-50">
       						<ul class="pagination" id="pagination"></ul>
						</nav>
         			</div>
	            </div>
	            <input type="hidden" value="" id="page" name="page"/>
				<input type="hidden" value="" id="limit" name="limit"/>	
				<input type="hidden" value="${categoryCode}" id="categoryCode" name="categoryCode"/>	
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
	            		$('#limit').val(4);
						$('#page').val(page);
						$('#formSubmit').submit();
					}
	            }
	        });
		});
	</script>
</body>
</html>