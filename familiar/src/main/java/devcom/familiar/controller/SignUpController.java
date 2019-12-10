package devcom.familiar.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import devcom.familiar.form.UserForm;
import devcom.familiar.model.User;
import devcom.familiar.service.UserService;

@Controller
@RequestMapping("/sign_up")
public class SignUpController {

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private UserService userService;
	
	@GetMapping
	public String getRegistrationPage(Model model, Principal principal) {
    	if(principal == null) {
    		model.addAttribute("userForm", new UserForm());
    		return "/sign_up";
    	}
    	return "redirect:/home";
	}
	
	@PostMapping
	public String registerUser(
		@ModelAttribute("userForm") UserForm userForm,
		BindingResult bindingResult,
		Model model
	) {
		
		User newUser = convertFormToUser(userForm);
		userService.save(newUser, "USER");
		return "/sign_in";
	}
	
	private User convertFormToUser(UserForm userForm) {
		User user = new User();
		user.setFirstName(userForm.getFirstName());
		user.setLastName(userForm.getLastName());
		user.setUserName(userForm.getUserName());
		user.setEmail(userForm.getEmail());
		user.setPassword(passwordEncoder.encode(userForm.getPassword()));
		return user;
	}
}
