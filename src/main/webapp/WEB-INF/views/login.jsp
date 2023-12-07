<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/common/taglib.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
</head>
<body>
	<div class="wrapper fadeInDown">
	  <div id="formContent">
	    <!-- Tabs Titles -->
	
	    <!-- Icon -->
	    <div class="fadeIn first">
	      <img src="<c:url value='/template/login/images/blueeye.png'/>" id="icon" alt="User Icon" />
	    </div>
	    
	    <!-- alert message -->
	    <c:if test="${param.incorrectAccount != null}">
	    	<div class="alert alert-danger">
	    		Username or password is incorrect
	    	</div>
	    </c:if>
	    <c:if test="${param.accessDenied != null}">
	    	<div class="alert alert-danger">
	    		You not authorize
	    	</div>
	    </c:if>
	
	    <!-- Login Form -->
	    <form action="j_spring_security_check" id="formLogin" method="post">
	      <input type="text" id="username" class="fadeIn second" name="j_username" placeholder="username">
	      <input type="password" id="password" class="fadeIn third" name="j_password" placeholder="password">
	      <input type="submit" class="fadeIn fourth" value="Log In">
	    </form>
	
	    <!-- Remind Passowrd -->
	    <div id="formFooter">
	      <a class="underlineHover" href="#">Forgot Password?</a>
	    </div>
	
	  </div>
	</div>
</body>
</html>