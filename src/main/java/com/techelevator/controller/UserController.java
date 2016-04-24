package com.techelevator.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
@Transactional
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
			displayAllTools(model);
			return "greetingPage";
		}
	}
	
	@RequestMapping(path="/addMember", method=RequestMethod.POST)
	public String addMember(Map<String, Object> model,
							@RequestParam(name="name") String name,
							@RequestParam(name="phone") String phone,
							@RequestParam(name="license") String license) {
		LoginCheck loginCheck = (LoginCheck)model.get("loginCheck");
		if(loginCheck.isLoggedIn()) {
			userDAO.addMember(license, name, phone);
			return "redirect:/mainPage";
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(path="/logout", method=RequestMethod.GET)
	public String Handlelogout(Map<String, Object> model) {
		displayAllTools(model);
		setLoginToFalse(model);
		emptyBasket(model);
		return "greetingPage";
	}


	
	
	
	// ***** Additional Methods *****
	
	private void emptyBasket(Map<String, Object> model) {
		Basket basket = (Basket)model.get("basket");
		List<Tool> basketList = basket.getToolBasket();
		basketList.clear();
		model.put("basketList", basketList);
	}
	
	private void setLoginToFalse(Map<String, Object> model) {
		LoginCheck loginCheck = (LoginCheck)model.get("loginCheck");
		loginCheck.setLoggedIn(false);
		loginCheck.setUsername("");
		model.put("loginCheck", loginCheck);
	}
	
	private void displayAllTools(Map<String, Object> model) {
		List<Tool> toolList = toolDAO.returnAllTools();
		model.put("toolList", toolList);
	}
	
	
	
}
