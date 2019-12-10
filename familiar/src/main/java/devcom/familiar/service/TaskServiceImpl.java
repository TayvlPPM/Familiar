package devcom.familiar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import devcom.familiar.model.Task;
import devcom.familiar.repository.TaskRepository;

@Service
public class TaskServiceImpl implements TaskService {
	@Autowired
	private TaskRepository taskRepository;
	
	@Override
	public Task save(Task task) {
		return taskRepository.save(task);
	}

	@Override
	public List<Task> save(List<Task> tasks) {
		return taskRepository.saveAll(tasks);
	}

	@Override
	public List<Task> findAllByUserId(Long userId) {
		return taskRepository.findAllByUserId(userId);
	}
}
