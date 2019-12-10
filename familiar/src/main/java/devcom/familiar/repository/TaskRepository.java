package devcom.familiar.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import devcom.familiar.model.Task;

public interface TaskRepository extends JpaRepository<Task, Long>{
	@Query("select t from Task t where t.taskOwner.id = ?1")
	List<Task> findAllByUserId(Long userId);
}
