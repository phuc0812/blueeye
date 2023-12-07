<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %> 

			<div class="col-lg-4">
			  <div class="widget-blocks">
			    <div class="row">
			      <div class="col-lg-12">
			        <div class="widget">
			          <div class="widget-body">
			            <img loading="lazy" decoding="async" src="<c:url value='/assets/user/img/${admin.thumbnail}'/>" alt="About Me" class="w-100 author-thumb-sm d-block">
			            <h2 class="widget-title my-3">${admin.name}</h2>
			            <p class="mb-3 pb-2">Hi guys! My name is Lê Phúc. This is my demo web. Nice to meet you!</p> 
			            <a href="<c:url value='/gioi-thieu'/>" class="btn btn-sm btn-outline-primary">Know More</a>
			          </div>
			        </div>
			      </div>
			      <div class="col-lg-12 col-md-6">
			        <div class="widget">
			          <h2 class="section-title mb-3">Liên hệ</h2>
			          <div class="widget-body">
			          	<span><a href="#"><i class="fab fa-facebook"></i></a></span>
			          	<span><a href="#"><i class="fab fa-youtube" style="color: red"></i></a></span>
			          </div>
		          	</div>
		          </div>
			    </div>
			  </div>
			</div>