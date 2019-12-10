package devcom.familiar.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import devcom.familiar.model.User;
import devcom.familiar.service.TaskService;
import devcom.familiar.service.UserService;

@Controller
@RequestMapping("/home")
public class HomeController {
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private UserService userService;

	@GetMapping
	public String getHomePage(Principal principal, Model model) {
		User user = userService.findByUserName(principal.getName()).get();
		model.addAttribute("tasks", taskService.findAllByUserId(user.getId()));
		return "/home";
	}
}
