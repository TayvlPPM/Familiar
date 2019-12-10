package devcom.familiar.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import devcom.familiar.enums.UserRole;
import devcom.familiar.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{

	Role findByRoleName(UserRole userRole);

}
