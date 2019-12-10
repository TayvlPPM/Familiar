package devcom.familiar.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "task")
public class Task {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "T_ID", nullable = false)
	private Long T_ID;
	
	@Column(name = "P_ID", nullable = true)
	private Long P_ID;
	
	@Column(name = "title", nullable = false)
	private String title;
	
	@Column(name = "description", nullable = false)
	private String description;
	
    @Column(name = "creation_date")
    @Temporal(TemporalType.DATE)
    private Date creationDate = new Date();
    
    @Column(name = "is_completed", nullable = false, columnDefinition = "DEFAULT 0")
    private boolean isCompleted = false;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User taskOwner;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "group_id")
    private Group taskGroup;

	public Long getT_ID() {
		return T_ID;
	}

	public void setT_ID(Long t_ID) {
		T_ID = t_ID;
	}

	public Long getP_ID() {
		return P_ID;
	}

	public void setP_ID(Long p_ID) {
		P_ID = p_ID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public User getTaskOwner() {
		return taskOwner;
	}

	public void setTaskOwner(User taskOwner) {
		this.taskOwner = taskOwner;
	}

	public Group getTaskGroup() {
		return taskGroup;
	}

	public void setTaskGroup(Group taskGroup) {
		this.taskGroup = taskGroup;
	}

	public boolean isCompleted() {
		return isCompleted;
	}

	public void setCompleted(boolean isCompleted) {
		this.isCompleted = isCompleted;
	}
}
