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
	          <h2 class="section-title">Trang chủ</h2>
	        </div>
	        <div class="col-lg-8 mb-5 mb-lg-0">
			<form id="formSubmit">
	          <div class="row">
	            <div class="col-12 mb-4">
	              <article class="card article-card">
	              <div id="demo" class="carousel slide" data-ride="carousel">
					  <ul class="carousel-indicators">
					    <li data-target="#demo" data-slide-to="0" class="active"></li>
					    <li data-target="#demo" data-slide-to="1"></li>
					    <li data-target="#demo" data-slide-to="2"></li>
					  </ul>
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					      <img loading="lazy" decoding="async" src="<c:url value='/assets/web/img/${firstModelOfList.thumbnail}'/>" alt="Post Thumbnail" class="w-100">
					      <div class="carousel-caption">
					        <h2 class="h1"><a class="post-title" style="color: white" href="<c:url value='/bai-viet?id=${firstModelOfList.id}'/>">${firstModelOfList.title}</a></h2>
						    <p class="card-text" style="color: white">${firstModelOfList.shortDescription}</p>
					      </div>   
					    </div>
					    <c:forEach var="item" items="${twoModelOfList}">
					    <div class="carousel-item">
					      <img loading="lazy" decoding="async" src="<c:url value='/assets/web/img/${item.thumbnail}'/>" alt="Post Thumbnail" class="w-100">
					      <div class="carousel-caption">
					        <h2 class="h1"><a class="post-title" style="color: white" href="<c:url value='/bai-viet?id=${item.id}'/>">${item.title}</a></h2>
						    <p class="card-text" style="color: white">${item.shortDescription}</p>
					      </div>   
					    </div>
					   </c:forEach> 
					  </div>
					  <a class="carousel-control-prev" href="#demo" data-slide="prev">
					    <span class="carousel-control-prev-icon"></span>
					  </a>
					  <a class="carousel-control-next" href="#demo" data-slide="next">
					    <span class="carousel-control-next-icon"></span>
					  </a>
					</div>
	                <%-- <a href="<c:url value='/bai-viet?id=${firstModelOfList.id}'/>">
	                  <div class="card-image">
	                    <div class="post-info"> 
	                      <span class="text-uppercase">${firstModelOfList.modifiedDate}</span>
	                    </div>
	                    <img loading="lazy" decoding="async" src="<c:url value='/assets/web/img/${firstModelOfList.thumbnail}'/>" alt="Post Thumbnail" class="w-100">
	                  </div>
	                </a>
	                <div class="card-body px-0 pb-1">
	                  <ul class="post-meta mb-2">
	                    <li> 
	                      <a href="<c:url value='/bai-viet/the-loai?categoryCode=${firstModelOfList.categoryCode}'/>">${firstModelOfList.categoryCode}</a>
	                    </li>
	                  </ul>
	                  <h2 class="h1"><a class="post-title" href="<c:url value='/bai-viet?id=${firstModelOfList.id}'/>">${firstModelOfList.title}</a></h2>
	                  <p class="card-text">${firstModelOfList.shortDescription}</p>
	                </div> --%>
	              </article>
	            </div>
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
	            startPage: currentPage,
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
