package com.techelevator.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.Tool;
import com.techelevator.model.ToolDAO;
import com.techelevator.model.UserDAO;

@Controller
public class AuthenticationController {
	
	private ToolDAO toolDAO;
	private UserDAO userDAO;
	
	@Autowired
	public AuthenticationController(ToolDAO toolDAO, UserDAO userDAO) {
		this.toolDAO = toolDAO;
		this.userDAO = userDAO;
	}
	
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
	public String handleLogin(Map<String, Object> model,
							  @RequestParam(name="username") String username,
							  @RequestParam(name="password") String password,
							  HttpSession session) {
		displayAllTools(model);
		
		
		if(userDAO.checkLibrarianLogin(username, password)) {
			session.invalidate();
			return "mainPage";
		} else {
			return "redirect:/";
		}
		
		
	}
	
	
	
	
	// ****** Additional Methods ******
	
		private void displayAllTools(Map<String, Object> model) {
			List<Tool> toolList = toolDAO.returnAllTools();
			model.put("toolList", toolList);
		}
	
}
