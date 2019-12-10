package devcom.familiar.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user_group_ref")
public class UserGroupRef implements Serializable, Comparable<UserGroupRef> {
	private static final long serialVersionUID = 7094126413591238011L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false)
    private User userByUserId;

    @ManyToOne
    @JoinColumn(name = "group_id", referencedColumnName = "id", nullable = false)
    private Group groupByGroupsId;

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

    public Group getGroupByGroupsId() {
        return groupByGroupsId;
    }

    public void setGroupByGroupsId(Group groupByGroupsId) {
        this.groupByGroupsId = groupByGroupsId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserGroupRef that = (UserGroupRef) o;

        if (getUserByUserId() != null ? !getUserByUserId().equals(that.getUserByUserId()) : that.getUserByUserId() != null)
            return false;
        return getGroupByGroupsId() != null ? getGroupByGroupsId().equals(that.getGroupByGroupsId()) : that.getGroupByGroupsId() == null;
    }

    @Override
    public int hashCode() {
        int result = getUserByUserId() != null ? getUserByUserId().hashCode() : 0;
        result = 31 * result + (getGroupByGroupsId() != null ? getGroupByGroupsId().hashCode() : 0);
        return result;
    }

    @Override
    public int compareTo(UserGroupRef o) throws NullPointerException {
        if (o == null) {
            throw new NullPointerException();
        }
        int diff =  this.getUserByUserId().getId().intValue() - o.getUserByUserId().getId().intValue();
        if (diff != 0)
            return diff;

        return this.getGroupByGroupsId().getId().intValue() - o.getGroupByGroupsId().getId().intValue();
    }
}
