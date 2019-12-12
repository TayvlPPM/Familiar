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
	<script src="<spring:url value='/resources/js/jquery/jquery-3.4.1.min.js'/>"></script>
<title>Home</title>
</head>
<body>
	<div class="main-bg"></div>
	<main class="home-page">
		<header>
			<div class="F-logo">F</div>
			<div class="buttons">
				<button id="create-task-btn" class="create-task-button"><i class="large material-icons" style="vertical-align: top; font-size: 22px;">add_circle_outline</i>Create Task</button>
				<button id="create-group-btn" class="create-group-button"><i class="large material-icons" style="vertical-align: top; font-size: 22px;">group_add</i> Create Group</button>
			</div>
			<div id="logout"><a href="<c:url value="/logout" />" class="logout-button">Logout</a></div>
		</header>
		<section class="tasks-container">
			<c:forEach var="task" items="${tasks}">
				<div class="task">
					<p class="task-title">${task.title}</p><br>
					<p class="task-description">${task.description}</p>
				</div>
			</c:forEach>			
		</section>
	</main>
	
	<!-- Tasks Window Start -->
	<div id="create-task-window" class="flying-window">
		<div class="flying-window-form">
			<button id="close-task-window" class="close-button"><i class="material-icons">cancel</i></button>
			<h3>CREATE Task</h3>
			<input type="text" placeholder="title">
			<textarea rows="10" cols="10"></textarea>
			<button id="send-request">Create</button>
		</div>
	</div>
	<!-- Tasks Window End -->
	
	<script>
		$(function(){
			function createTaskBtnClick() {
				showWindow('create-task-window');
			}
			
			function sendCreateTaskForm() {
				alert("in send");
				var title = document.querySelector('#create-task-window input[type="text"]').value;
				var description = document.querySelector('#create-task-window textarea').value;
				var arrayOfObjects = [{title: title, description: description, parent: true}];
				console.log(arrayOfObjects);
				$.ajax({
					url: '/tasks',
					method: 'post',
					data: {tasks: JSON.stringify(arrayOfObjects)},
					success: function() {
						hideWindow();
						location.reload();
					}
				});
			}
			
			function showWindow(windowId) {
				let window = document.getElementById(windowId);
				window.style.display = 'flex';
			}
			
			function hideWindow() {
				let window = document.getElementById('create-task-window');
				window.style.display = 'none';
			}
			
			document.getElementById('create-task-btn').addEventListener('click', createTaskBtnClick);
			document.getElementById('close-task-window').addEventListener('click', hideWindow);
			document.querySelector('#send-request').addEventListener('click', sendCreateTaskForm);
		});
	</script>
</body>
</html>