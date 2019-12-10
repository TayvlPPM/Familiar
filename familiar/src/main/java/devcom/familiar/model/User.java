package devcom.familiar.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "User")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Long id;
	
	@Column(name = "first_name", nullable = false)
	private String firstName;
	
	@Column(name = "last_name", nullable = false)
	private String lastName;
	
	@Column(name = "birth_date", nullable = false)
	private Date birthDate;
	
	@Column(name = "email", nullable = false)
	private String email;
	
	@Column(name = "user_name", nullable = false)
	private String userName;
	
	@Column(name = "password", nullable = false)
	private String password;
	
	@Column(name = "is_deleted", nullable = false)
	private boolean isDeleted;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "userByUserId", cascade = CascadeType.ALL)
	private List<UserRoleRef> userRolesByUserId;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "userByUserId", cascade = CascadeType.REMOVE)
	private List<UserGroupRef> userGroupRefsbyUserID;
	
	@OneToMany(mappedBy = "taskOwner", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Task> tasks;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Notification> userNotifications;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isDeleted() {
		return isDeleted;
	}

	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	public List<UserRoleRef> getUserRolesByUserId() {
		return userRolesByUserId;
	}

	public void setUserRolesByUserId(List<UserRoleRef> userRolesByUserId) {
		this.userRolesByUserId = userRolesByUserId;
	}

	public List<Task> getTasks() {
		return tasks;
	}

	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}

	public List<Notification> getUserNotifications() {
		return userNotifications;
	}

	public void setUserNotifications(List<Notification> userNotifications) {
		this.userNotifications = userNotifications;
	}

	public List<UserGroupRef> getUserGroupRefsbyUserID() {
		return userGroupRefsbyUserID;
	}

	public void setUserGroupRefsbyUserID(List<UserGroupRef> userGroupRefsbyUserID) {
		this.userGroupRefsbyUserID = userGroupRefsbyUserID;
	}
}
