<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %> 

<header class="navigation">
  <div class="container">
    <nav class="navbar navbar-expand-lg navbar-light px-0">
      <a class="navbar-brand order-1 py-0" href="<c:url value='/trang-chu'/>">
        <img loading="prelaod" decoding="async" class="img-fluid" src="<c:url value='/template/web/images/blueeye.png'/>" alt="Blue Eye" width="50" height="50">
      </a>
      <div class="navbar-actions order-3 ml-0 ml-md-4">
        <button aria-label="navbar toggler" class="navbar-toggler border-0" type="button" data-toggle="collapse"
          data-target="#navigation"> <span class="navbar-toggler-icon"></span>
        </button>
      </div>
      <form action="<c:url value='/tim-kiem'/>" class="search order-lg-3 order-md-2 order-3 ml-auto">
        <input id="search-query" name="s" type="search" placeholder="Search..." autocomplete="off">
      </form>
      <div class="collapse navbar-collapse text-center order-lg-2 order-4" id="navigation">
        <ul class="navbar-nav mx-auto mt-3 mt-lg-0">
          <li class="nav-item"> <a class="nav-link" href="<c:url value='/trang-chu'/>">Trang chủ</a>
          </li>
          <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" role="button"
              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Bài viết
            </a>
            <div class="dropdown-menu"> 
              <c:forEach var="item" items="${categories}">
              	<a class="dropdown-item" href="<c:url value='/bai-viet/the-loai?categoryCode=${item.code}'/>">${item.name}</a>
              </c:forEach>
            </div>
          </li>
          <li class="nav-item"> <a class="nav-link" href="<c:url value='/gioi-thieu'/>">About</a>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</header>