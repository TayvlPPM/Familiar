package devcom.familiar.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import devcom.familiar.enums.UserRole;
import devcom.familiar.model.Role;
import devcom.familiar.model.User;
import devcom.familiar.model.UserRoleRef;
import devcom.familiar.repository.RoleRepository;
import devcom.familiar.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Override
	public Optional<User> findByUserName(String userName) {
		return userRepository.findByUserName(userName);
	}

	@Override
	public User save(User newUser, String roleName) {
        try {
            List<UserRoleRef> userRoles = new ArrayList<>();
            UserRoleRef userRole = new UserRoleRef();
            Role role = roleRepository.findByRoleName(UserRole.valueOf(roleName));
            userRole.setRoleByRoleId(role);
            userRole.setUserByUserId(newUser);
            userRoles.add(userRole);
            newUser.setUserRolesByUserId(userRoles);
            
            User savedUser = userRepository.save(newUser);
            userRole.setUserByUserId(savedUser);

            return savedUser;
        } catch (Exception e) {
            System.err.println(e.getMessage());
            throw e;
        }
		
	}
}
