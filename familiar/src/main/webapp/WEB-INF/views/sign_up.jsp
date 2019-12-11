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
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link href="<spring:url value='/resources/css/style.css'/>" rel="stylesheet">
	</head>
	<body>
		<main class="login-bg">
			<div class="title">
				<p>FAMILIAR</p>
				<p class = "small" >organizer</p>
			</div>
			<table>
				<tr><th class="block-a"><i class="large material-icons" style="font-size: 50px;float: left">event</i> Create <b>tasks</b></th><th style="width: 20px"></th>
					<th class="block-b"><i class="large material-icons" style="font-size: 50px;float: left">share</i>Share with your <b>family</b></th><th style="width: 20px"></th>
					<th class="block-c"><i class="large material-icons" style="font-size: 50px;float: left">done_all</i> Make tasks <b>together</b></th></tr>
				<tr><td class="in-block-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</td><td style="width: 20px"></td>
					<td class="in-block-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</td><td style="width: 20px"></td>
					<td class="in-block-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</td></tr>
			</table>
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