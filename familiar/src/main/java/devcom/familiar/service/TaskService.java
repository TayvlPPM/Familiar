package devcom.familiar.service;

import java.util.List;

import devcom.familiar.model.Task;

public interface TaskService {
	Task save(Task task);
	List<Task> save(List<Task> tasks);
	List<Task> findAllByUserId(Long userId);
}
