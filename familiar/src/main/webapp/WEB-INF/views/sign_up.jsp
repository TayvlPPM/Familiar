<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Sign Up</title>

		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
  		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		
		<link href="<spring:url value='/resources/css/style.css'/>" rel="stylesheet">
	</head>
	<body>
		<main class="login-bg">
			<div class="title">
				<p>FAMILIAR</p>
				<p class = "small" >organizer</p>
			</div>
			<div class="info-blocks">
				<span class="a">BLOCK 1</span>
				<span class="b">BLOCK 2</span>
				<span class="c">BLOCK 3</span>
			</div>
			<div class="form">
				<h3 class="sing-up-title">CREATE YOUR ACCOUNT</h3>
				<form:form action="sign_up" method="post" modelAttribute="userForm" acceptCharset="UTF-8">
					<label for="firstName" class="inp">
					<spring:bind path="firstName" >
						 <form:input id="firstName" path="firstName" type="text"
						  placeholder="First Name" required="true" autofocus="true"/>
                        <form:errors path="firstName"/>
					</spring:bind>
						<span class="label">First name</span>
						<span class="border"></span>
					</label>

					<label for="lastName" class="inp">
					<spring:bind path="lastName">
						 <form:input id="lastName" path="lastName" type="text"
						  placeholder="Last Name" required="true"/>
                        <form:errors path="lastName"/>
					</spring:bind>
						<span class="label">Last name</span>
						<span class="border"></span>
					</label>

					<label for="userName" class="inp">
					<spring:bind path="userName">
						 <form:input id="userName" path="userName"
						  placeholder="User name" required="true"/>
                        <form:errors path="userName"/>
					</spring:bind>
						<span class="label">User name</span>
						<span class="border"></span>
					</label><br>

					<label for="email" class="inp">
					<spring:bind path="email">
						 <form:input id="email" path="email" type="email"
						  placeholder="Email" required="true"/>
                        <form:errors path="email"/>
					</spring:bind>
						<span class="label">Email</span>
						<span class="border"></span>
					</label><br>

					<label for="password" class="inp">
					<spring:bind path="password">
						 <form:password id="password" path="password" placeholder="Password" required="true"/>
                        <form:errors path="password"/>
					</spring:bind>
						<span class="label">Password</span>
						<span class="border"></span>
					</label><br>

					<label for="confirmPassword" class="inp">
					<spring:bind path="confirmPassword">
						 <form:password id="confirmPassword" path="confirmPassword" placeholder="Confirm password" 
						 required="true"/>
                        <form:errors path="confirmPassword"/>
					</spring:bind>
						<span class="label">Confirm password</span>
						<span class="border"></span>
					</label><br>
					<div class="position">
					<spring:bind path="checkTerms">
						 <form:checkbox id="checkTerms" path="checkTerms" required="true"/>
                        <form:errors path="checkTerms"/>
					</spring:bind>
					</div>
					<p class="policy">I accept the Terms of Use & Privacy Policy</p><br>
					<button class="button2" type="submit">Register</button>
					<p class="sign-in">Already have an account? <a class="sign-link" href="/sign_in">Sign in</a></p>
				</form:form>
			</div>
		</main>
	</body>
</html>