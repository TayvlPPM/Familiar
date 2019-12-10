package devcom.familiar.service;

import java.util.Optional;

import devcom.familiar.model.User;

public interface UserService {
	Optional<User> findByUserName(String email);
	User save(User newUser, String role);
}
