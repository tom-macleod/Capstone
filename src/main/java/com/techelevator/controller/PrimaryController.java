package com.techelevator.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		addBasket(model);
		addLoginCheck(model);
		return "greetingPage";
	}
	
	@RequestMapping(path="/mainPage", method=RequestMethod.GET)
	public String displayMainPage(Map<String, Object> model) {
		displayAllTools(model);
		LoginCheck loginCheck = (LoginCheck)model.get("loginCheck");
		if(loginCheck.isLoggedIn()) {
			return "mainPage";
		} else {
			return "greetingPage";
		}
	}
	
	@RequestMapping(path="/addTool", method=RequestMethod.POST)
	public String addToolToBasket(Map<String, Object> model,
								  @RequestParam(name="toolId") int toolId) {
		LoginCheck loginCheck = (LoginCheck)model.get("loginCheck");
		if(loginCheck.isLoggedIn()) {
			displayAllTools(model);
			
			Basket basket = (Basket)model.get("basket");
			Tool sessionTool = basket.returnToolById(toolId);
			if(sessionTool != null) {
				boolean check = toolDAO.checkAvailability(sessionTool, toolId);
				if(check) {
					return runAddTool(model, toolId, basket);
				} else {
					List<Tool> basketList = basket.getToolBasket();
					model.put("basketList", basketList);
					return "mainPage";
				}
			} else {
				return runAddTool(model, toolId, basket);
			}
		} else {
			return "redirect:/";
		}
	}


	

	
	
	// ****** Additional Methods ******
	
	
	private String runAddTool(Map<String, Object> model, int toolId, Basket basket) {
		Tool tool = toolDAO.readToolById(toolId);
		addTool(model, tool);
		List<Tool> basketList = basket.getToolBasket();
		model.put("basketList", basketList);
		return "mainPage";
	}
	
	private void addTool(Map<String, Object> model, Tool tool) {
		Basket basket = (Basket)model.get("basket");
		basket.addToBasket(tool);
		model.put("basket", basket);
	}
	
	private void addLoginCheck(Map<String, Object> model) {
		if(model.get("loginCheck") == null) {
			LoginCheck loginCheck = new LoginCheck();
			model.put("loginCheck", loginCheck);
		}
	}
	
	private void addBasket(Map<String, Object> model) {
		if(model.get("loginCheck") == null) {
			Basket basket = new Basket();
			model.put("basket", basket);
		}
	}
	
	private void displayAllTools(Map<String, Object> model) {
		List<Tool> toolList = toolDAO.returnAllTools();
		model.put("toolList", toolList);
	}
	
}
