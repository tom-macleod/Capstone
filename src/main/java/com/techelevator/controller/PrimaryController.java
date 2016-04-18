package com.techelevator.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String displayMainPage(Map<String, Object> model) {
		List<Tool> toolList = toolDAO.returnAllTools();
		model.put("toolList", toolList);
		return "mainPage";
	}
	
}
