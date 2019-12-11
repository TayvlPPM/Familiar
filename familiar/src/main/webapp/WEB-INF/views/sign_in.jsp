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
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="<spring:url value='/resources/css/style.css'/>" rel="stylesheet">
<title>Sign in</title>
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
			<h3 class="sing-up-title">LOG IN TO YOUR ACCOUNT</h3>
			<form action="/process_login" method="post">
				<div class="form-group ${errors ? 'has error' : ''}">
					<div class="inp">
		            <input type="text" name='username' placeholder="User name" required autofocus>
						<span class="label">User name</span>
						<span class="border"></span>
					</div><br>
		        </div>

		        <div class="${errors ? 'has error' : ''}">
					<div class="inp">
		            <input type="password" name='password' placeholder="Password"
		                   required>
						<span class="label">Password</span>
						<span class="border"></span>
					</div><br>
		            <input type="hidden" name="${_csrf.parameterName}"
		                   value="${_csrf.token}"/>
		        </div>

		        <button class="button2" type="submit">Sign In</button>
		        <a class="sign-link" href="/sign_up">Sign Up</a>
			</form>
		</div>
	</main>
</body>
</html>