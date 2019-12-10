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
	<script src="<spring:url value='/resources/js/jquery/jquery-3.4.1.min.js'/>"></script>
<title>Home</title>
</head>
<body>
	<div class="main-bg"></div>
	<main class="home-page">
		<header>
			<div>F</div>
			<div class="buttons">
				<a id="create-task-btn">Create Task</a>
				<a id="create-group-btn">Create Group</a>
			</div>
			<div id="logout"><a href="<c:url value="/logout" />">Logout</a></div>
		</header>
		<div class="tasks-container">

		</div>
	</main>

	<!-- Tasks Window Start -->
	<div id="create-task-window" class="flying-window">
		<div class="flying-window-form">
			<h3>CREATE Task</h3>
			<input type="text" placeholder="title">
			<textarea rows="10" cols="10"></textarea>
			<button>Create</button>
		</div>
	</div>
	<!-- Tasks Window End -->

	<script>
		$(function(){
			function createTaskBtnClick() {
				showWindow('create-task-window');
			}

			function sendCreateTaskForm() {
				var arrayOfObjects = [{title: 'title', description: 'description', isParent: true}];
				console.log(arrayOfObjects);
				$.ajax({
					url: '/tasks',
					method: 'post',
					data: {tasks: JSON.stringify(arrayOfObjects)},
					success: function() {
						hideWindow('create-task-window');
						location.reload();
					}
				});
			}

			function showWindow(windowId) {
				let window = document.getElementById(windowId);
				window.style.display = 'flex';
			}

			function hideWindow(windowId) {
				let window = document.getElementById(windowId);
				window.style.display = 'none';
			}

			document.getElementById('create-task-btn').addEventListener('click', createTaskBtnClick);
			document.querySelector('#create-task-window button').addEventListener('click', sendCreateTaskForm);
		});
	</script>
</body>
</html>