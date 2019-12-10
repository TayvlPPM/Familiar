<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
 	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	
	<link href="<spring:url value='/resources/css/style.css'/>" rel="stylesheet">
<title>Sign in</title>
</head>
<body>
	<main class="login-bg">
		<div class="title">
			<h1>FAMILIAR</h1>
		</div>
		<div class="info-blocks">
		</div>
		<div class="form">
			<form action="/process_login" method="post">
				<div class="form-group ${errors ? 'has error' : ''}">
		            <input type="text" name='username' placeholder="User name" required autofocus>
		        </div>
		        <div class="${errors ? 'has error' : ''}">
		            <input type="password" name='password' placeholder="Password"
		                   required>
		            <input type="hidden" name="${_csrf.parameterName}"
		                   value="${_csrf.token}"/>
		        </div>
		        <button type="submit">Sign In</button>
		        <a href="/sign_up">Sign Up</a>
			</form>
		</div>
	</main>
</body>
</html>