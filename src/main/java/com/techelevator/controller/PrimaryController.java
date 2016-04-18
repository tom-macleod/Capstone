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

@Controller
public class PrimaryController {
	
	private ToolDAO toolDAO;
	
	@Autowired
	public PrimaryController(ToolDAO toolDAO) {
		this.toolDAO = toolDAO;
	}

	@RequestMapping(path="/", method=RequestMethod.GET)
	public String displayGreetingPage(Map<String, Object> model) {
		List<Tool> toolList = toolDAO.returnAllTools();
		model.put("toolList", toolList);
		return "greetingPage";
	}
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
	public String handleLogin(Map<String, Object> model,
							  @RequestParam(name="username") String username,
							  @RequestParam(name="password") String password) {
		model.put("username", username);
		model.put("password", password);
		List<Tool> toolList = toolDAO.returnAllTools();
		model.put("toolList", toolList);
		return "mainPage";
	}
	
}
