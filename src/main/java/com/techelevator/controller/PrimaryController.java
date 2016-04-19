package com.techelevator.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.Tool;
import com.techelevator.model.ToolDAO;
import com.techelevator.model.UserDAO;

@Controller
public class PrimaryController {
	
	private ToolDAO toolDAO;
	private UserDAO userDAO;
	
	@Autowired
	public PrimaryController(ToolDAO toolDAO, UserDAO userDAO) {
		this.toolDAO = toolDAO;
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/", method=RequestMethod.GET)
	public String displayGreetingPage(Map<String, Object> model) {
		displayAllTools(model);
		return "greetingPage";
	}
	
	

	
	
	// ****** Additional Methods ******
	
	private void displayAllTools(Map<String, Object> model) {
		List<Tool> toolList = toolDAO.returnAllTools();
		model.put("toolList", toolList);
	}
	
}
