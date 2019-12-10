package devcom.familiar.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sign_in")
public class LoginController {
	@GetMapping
	public String getLoginPage(Principal principal) {
    	if(principal == null) {
    		return "/sign_in";
    	}
    	
    	return "redirect:/home";
	}
}
