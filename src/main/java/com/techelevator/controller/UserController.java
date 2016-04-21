package com.techelevator.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.model.Basket;
import com.techelevator.model.LoginCheck;
import com.techelevator.model.Tool;
import com.techelevator.model.ToolDAO;
import com.techelevator.model.UserDAO;

@Controller
@SessionAttributes({"loginCheck", "basket"})
public class UserController {
	
	private ToolDAO toolDAO;
	private UserDAO userDAO;
	
	@Autowired
	public UserController(ToolDAO toolDAO, UserDAO userDAO) {
		this.toolDAO = toolDAO;
		this.userDAO = userDAO;
	}
	
	@RequestMapping(path="/createUser", method=RequestMethod.GET)
	public String createUserAccount(Map<String, Object> model) {
		LoginCheck loginCheck = (LoginCheck)model.get("loginCheck");
		if(loginCheck.isLoggedIn()) {
			return "addMember";
		} else {
			return "greetingPage";
		}
	}
	
	
	@RequestMapping(path="/addMember", method=RequestMethod.POST)
	public String addMember(Map<String, Object> model,
							@RequestParam(name="name") String name) {
		LoginCheck loginCheck = (LoginCheck)model.get("loginCheck");
		if(loginCheck.isLoggedIn()) {
			return "addMember";
		} else {
			return "greetingPage";
		}
	}
	
	
	
	
}