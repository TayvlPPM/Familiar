package devcom.familiar.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import devcom.familiar.enums.UserRole;

@Entity
@Table(name = "Role")
public class Role {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Long id;
	
	@Column(name = "role", nullable = false)
	@Enumerated(EnumType.STRING)
	private UserRole roleName;
	
    @OneToMany(mappedBy = "roleByRoleId")
    private List<UserRoleRef> userRolesById;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public UserRole getRoleName() {
		return roleName;
	}

	public void setRoleName(UserRole roleName) {
		this.roleName = roleName;
	}

	public List<UserRoleRef> getUserRolesById() {
		return userRolesById;
	}

	public void setUserRolesById(List<UserRoleRef> userRolesById) {
		this.userRolesById = userRolesById;
	}
}
