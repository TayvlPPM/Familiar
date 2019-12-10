package devcom.familiar.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import devcom.familiar.form.TaskForm;
import devcom.familiar.model.Task;
import devcom.familiar.model.User;
import devcom.familiar.service.TaskService;
import devcom.familiar.service.UserService;

@Controller
@RequestMapping("/tasks")
public class TasksController {
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private UserService userService;
	
	@PostMapping
	public ResponseEntity<?> createNewTask(
			@RequestParam(name = "tasks", required = true) String tasksJSON,
			Principal principal
	) {
		try {
			List<TaskForm> taskFormsList = 
				new ObjectMapper()
					.readValue(
						tasksJSON, 
						new TypeReference<List<TaskForm>>() {}
					);
			User user = 
				userService.findByUserName(principal.getName())
					.orElse(null);
			
			if(user == null) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			
			List<Task> newTasks = 
				convertTasksFormListToTasksList(
					taskFormsList, 
					user,
					getParentTaskId(taskFormsList, user)
				);
			
			if(newTasks != null && !newTasks.isEmpty()) {
				taskService.save(newTasks);	
			}
		} catch (IOException e) {
			System.err.println(e.getMessage());
			
		}
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	private List<Task> convertTasksFormListToTasksList(
			List<TaskForm> tasksFormList, 
			User user,
			Long parentTaskId
		) {
		List<Task> newTasks = new ArrayList<>();
		for (TaskForm taskForm : tasksFormList) {
			if(taskForm.isParent()) {
				continue;
			}
			newTasks.add(convertTaskFormToTaskEntity(taskForm, user, null));
		}
		
		return null;
	}
	
	private Task convertTaskFormToTaskEntity(TaskForm taskForm, User user, Long parentTaskId) {
		Task task = new Task();
		task.setDescription(taskForm.getDescription());
		task.setTitle(taskForm.getTitle());
		task.setTaskOwner(user);
		task.setP_ID(parentTaskId);
		return task;
	}
	
	private Long getParentTaskId(List<TaskForm> tasksFormList, User user) {
		Long parentLongTaskId = 0L;
		for (TaskForm taskForm : tasksFormList) {
			if(taskForm.isParent()) {
				parentLongTaskId = 
					taskService.save(
						convertTaskFormToTaskEntity(
								taskForm,
								user,
								null
						)
					).getT_ID();
			}
		}
		return parentLongTaskId;
	}
}
