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
			<div class="flying-window-title">
				<p>Create a new task</p>
				<button id="close-task-window" class="close-button"><i class="material-icons">cancel</i></button>
			</div>
			<br style="line-height: 10px">
			<br style="line-height: 10px">
			<input type="text" placeholder="Name" class="create-task-title">
            <br style="line-height: 10px">
			<textarea rows="10" cols="10" placeholder="Task description" class="create-task-description"></textarea>
			<br style="line-height: 10px">
			<div class="dropdown">
				<button onclick="dropdownGroups()" class="choose-group-btn">Choose a group<i class=" small material-icons" style="vertical-align: middle">expand_more</i></button>
				<div id="myDropdown" class="group-list-content">
					<p>some groups</p>
				</div>
			</div>
			<br style="line-height: 10px">
			<p class="subtask-title">Subtasks</p>
			<div class="subtask-container">
				<button id="create-sub-task-btn" class="flying-window-add-btn">Add</button>
			</div>
			<br style="line-height: 10px">
			<button id="send-request" class="flying-window-done-btn">Done</button>
		</div>
	</div>
	<!-- Tasks Window End -->

	<!-- Sub Tasks Window Start -->
	<div id="create-sub-task-window" class="flying-window">
		<div class="flying-window-form">
		<div class="flying-window-title">
			<p>Create a new sub task</p>
			<button id="close-sub-task-window" class="close-button"><i class="material-icons">cancel</i></button>
		</div>
			<br style="line-height: 10px">
			<br style="line-height: 10px">
			<input type="text" placeholder="Name" class="create-task-title">
			<br style="line-height: 10px">
			<textarea rows="10" cols="10" placeholder="Description" class="create-task-description"></textarea>
			<br style="line-height: 10px">
			<button class="flying-window-done-btn">Done</button>
		</div>
	</div>
	<!-- Sub Tasks Window End -->

	<!-- Group Window Start -->
	<div id="create-group-window" class="flying-window">
		<div class="flying-window-form">
			<div class="flying-window-title">
				<p>Create a new group</p>
				<button id="close-group-window" class="close-button"><i class="material-icons">cancel</i></button>
			</div>
			<br style="line-height: 10px">
			<br style="line-height: 10px">
			<input type="text" placeholder="Name" class="create-task-title">
			<br style="line-height: 10px">
			<div class="group-member-block">
				<p class="group-member-block-title">Members</p>
				<button  class="create-group-add">Add</button>
			</div>
			<div class="group-color-block">
				<p class="group-color-block-title">Choose a color</p>
				<div class="color-palette">
					<button id="1" class="some-color" style="background-color: #70104f" onclick="getColor(this.id)"> </button>
					<button id="2" class="some-color" style="background-color: #9a2b4c" onclick="getColor(this.id)"> </button>
					<button id="3" class="some-color" style="background-color: #bcdfe5" onclick="getColor(this.id)"> </button>
					<button id="4" class="some-color" style="background-color: #49bed9" onclick="getColor(this.id)"> </button>
					<button id="5" class="some-color" style="background-color: #842e79" onclick="getColor(this.id)"> </button>
					<button id="6" class="some-color" style="background-color: #672741" onclick="getColor(this.id)"> </button>
					<button id="7" class="some-color" style="background-color: #85cdcc" onclick="getColor(this.id)"> </button>
					<button id="8" class="some-color" style="background-color: #15819d" onclick="getColor(this.id)"> </button>
					<button id="9" class="some-color" style="background-color: #d5208d" onclick="getColor(this.id)"> </button>
					<button id="10" class="some-color" style="background-color: #eb5561" onclick="getColor(this.id)"> </button>
					<button id="11" class="some-color" style="background-color: #235240" onclick="getColor(this.id)"> </button>
					<button id="12" class="some-color" style="background-color: #b0d7ed" onclick="getColor(this.id)"> </button>
					<button id="13" class="some-color" style="background-color: #f9c3d0" onclick="getColor(this.id)"> </button>
					<button id="14" class="some-color" style="background-color: #f18787" onclick="getColor(this.id)"> </button>
					<button id="15" class="some-color" style="background-color: #619565" onclick="getColor(this.id)"> </button>
					<button id="16" class="some-color" style="background-color: #94b1d9" onclick="getColor(this.id)"> </button>
					<button id="17" class="some-color" style="background-color: #e9b0b0" onclick="getColor(this.id)"> </button>
					<button id="18" class="some-color" style="background-color: #fabfa7" onclick="getColor(this.id)"> </button>
					<button id="19" class="some-color" style="background-color: #99b59f" onclick="getColor(this.id)"> </button>
					<button id="20" class="some-color" style="background-color: #094c9b" onclick="getColor(this.id)"> </button>
					<button id="21" class="some-color" style="background-color: #f8e0d4" onclick="getColor(this.id)"> </button>
					<button id="22" class="some-color" style="background-color: #ffeda5" onclick="getColor(this.id)"> </button>
					<button id="23" class="some-color" style="background-color: #c7e6db" onclick="getColor(this.id)"> </button>
					<button id="24" class="some-color" style="background-color: #123764" onclick="getColor(this.id)"> </button>
					<button class="palette" onclick="document.getElementById('colorWell').click()" >+</button>
				</div>
			</div>
			<br style="line-height: 10px">
			<button class="flying-window-done-btn">Done</button>
			<input style="visibility: hidden" type="color" placeholder="" id="colorWell" >
		</div>
	</div>
	<!-- Group Window End -->

	<script>
		//color picking
		function getColor(buttonId) {
			myDivObj = document.getElementById(buttonId);
			let myDivObjBgColor = window.getComputedStyle(myDivObj).backgroundColor;
			alert(myDivObjBgColor);

		}
		// Sub Task Window script start
		function showSubTaskWindow() {
			let window = document.getElementById('create-sub-task-window');
			window.style.display = 'flex';
		}

		function hideSubTaskWindow() {
			let window = document.getElementById('create-sub-task-window');
			window.style.display = 'none';
		}

		document.getElementById('create-sub-task-btn').addEventListener('click', showSubTaskWindow);
		document.getElementById('close-sub-task-window').addEventListener('click', hideSubTaskWindow);
		// Sub Task Window script end

		// Create Group script start
		function showGroupWindow() {
			let window = document.getElementById('create-group-window');
			window.style.display = 'flex';
		}

		function hideGroupWindow() {
			let window = document.getElementById('create-group-window');
			window.style.display = 'none';
		}

		document.getElementById('create-group-btn').addEventListener('click', showGroupWindow);
		document.getElementById('close-group-window').addEventListener('click', hideGroupWindow);
		// Create Group Window script end


		function dropdownGroups() {
			document.getElementById("myDropdown").classList.toggle("show");
		}

		window.onclick = function(event) {
			if (!event.target.matches('.choose-group-btn')) {
				var dropdowns = document.getElementsByClassName("group-list-content");
				var i;
				for (i = 0; i < dropdowns.length; i++) {
					var openDropdown = dropdowns[i];
					if (openDropdown.classList.contains('show')) {
						openDropdown.classList.remove('show');
					}
				}
			}
		}

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