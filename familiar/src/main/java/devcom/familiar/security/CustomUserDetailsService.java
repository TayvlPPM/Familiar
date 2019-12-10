package devcom.familiar.security;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import devcom.familiar.model.User;
import devcom.familiar.service.UserService;

public class CustomUserDetailsService implements UserDetailsService {
	@Autowired
	private UserService userService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.err.println("in user service");
		User user = 
			userService
				.findByUserName(username)
					.orElseThrow(() -> new UsernameNotFoundException(username));

        Set<GrantedAuthority> grantedAuthorities = 
        	user.getUserRolesByUserId().stream()
        		.map(ur -> 
        			new SimpleGrantedAuthority(
        				ur.getRoleByRoleId().getRoleName().name()
        			)
        		).collect(Collectors.toSet());
        
        return 
        	new org.springframework.security.core.userdetails.User(
        		user.getUserName(), 
        		user.getPassword(), 
        		grantedAuthorities
        	);
    }
}
