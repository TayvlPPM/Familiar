package devcom.familiar.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user_role_ref")
public class UserRoleRef {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "ID", nullable = false)
    private User userByUserId;

    @ManyToOne
    @JoinColumn(name = "Role_ID", referencedColumnName = "ID", nullable = false)
    private Role roleByRoleId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUserByUserId() {
		return userByUserId;
	}

	public void setUserByUserId(User userByUserId) {
		this.userByUserId = userByUserId;
	}

	public Role getRoleByRoleId() {
		return roleByRoleId;
	}

	public void setRoleByRoleId(Role roleByRoleId) {
		this.roleByRoleId = roleByRoleId;
	}
}
