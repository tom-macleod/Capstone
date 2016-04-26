package com.techelevator.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.model.Basket;
import com.techelevator.model.Loan;
import com.techelevator.model.LoginCheck;
import com.techelevator.model.Patron;
import com.techelevator.model.Tool;
import com.techelevator.model.ToolDAO;
import com.techelevator.model.UserDAO;

@Controller
@Transactional
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
			getPatrons(model);
			Basket basket = (Basket)model.get("basket");
			addBasketToModel(model, basket);
			return "mainPage";
		} else {
			return "greetingPage";
		}
	}

	
	@RequestMapping(path="/addTool", method=RequestMethod.POST)
	public String addToolToBasket(Map<String, Object> model,
								  @RequestParam(name="toolId") int toolId) {
		LoginCheck loginCheck = (LoginCheck)model.get("loginCheck");
		displayAllTools(model);
		if(loginCheck.isLoggedIn()) {
			getPatrons(model);
			Basket basket = (Basket)model.get("basket");
			Tool sessionTool = basket.returnToolById(toolId);
			if(sessionTool != null) {
				boolean check = toolDAO.checkAvailability(sessionTool, toolId);
				if(check) {
					return runAddTool(model, toolId, basket);
				} else {
					addBasketToModel(model, basket);
					return "mainPage";
				}
			} else {
				return runAddTool(model, toolId, basket);
			}
		} else {
			return "redirect:/";
		}
	}


	@RequestMapping(path="/checkout", method=RequestMethod.POST)
	public String returnCheckout(Map<String, Object> model,
								 @RequestParam(name="patronFull") String patronFull) {
		LoginCheck loginCheck = (LoginCheck)model.get("loginCheck");
		if(loginCheck.isLoggedIn()) {
			String patronLicense = addPatronDetailsToModel(model, patronFull);
			boolean areFeesUnpaid = toolDAO.checkIfMemberHasFees(patronLicense);
			if(areFeesUnpaid) {
				return "feeUnpaid";
			} else {
				Basket basket = (Basket)model.get("basket");
				addBasketToModel(model, basket);
				return "checkout";
			}
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping(path="/confirmCheckout", method=RequestMethod.POST)
	public String confirmCheckout(Map<String, Object> model,
								  @RequestParam(name="patronLicense") String patronLicense) {
		LoginCheck loginCheck = (LoginCheck)model.get("loginCheck");
		if(loginCheck.isLoggedIn()) {
			checkoutBasket(model, patronLicense);
			return "redirect:/mainPage";
		} else {
			return "redirect:/";
		}
	}

	
	@RequestMapping(path="/loanRecord", method=RequestMethod.GET)
	public String displayLoanRecord(Map<String, Object> model) {
		LoginCheck loginCheck = (LoginCheck)model.get("loginCheck");
		if(loginCheck.isLoggedIn()) {
			List<Loan> loanList = toolDAO.returnAllLoans();
			model.put("loanList", loanList);
			return "/loanRecord";
		} else {
			displayAllTools(model);
			return "greetingPage";
		}
	}
	
	@RequestMapping(path="/removeItem", method=RequestMethod.GET)
	public String removeItemFromBasket(Map<String, Object> model,
									   @RequestParam(name="toolId") int toolId) {
		displayAllTools(model);
		LoginCheck loginCheck = (LoginCheck)model.get("loginCheck");
		if(loginCheck.isLoggedIn()) {
			getPatrons(model);
			Basket basket = (Basket)model.get("basket");
			basket.removeToolById(toolId);
			addBasketToModel(model, basket);
			return "mainPage";
		} else {
			displayAllTools(model);
			return "greetingPage";
		}
	}
	
	@RequestMapping(path="/returnTool", method=RequestMethod.GET)
	public String returnToolConfirmationPage(Map<String, Object> model,
											 @RequestParam(name="toolInventoryId") int toolInventoryId,
											 @RequestParam(name="toolName") String toolName,
											 @RequestParam(name="memberLicense") String memberLicense,
											 @RequestParam(name="patronName") String patronName) {
		model.put("toolInventoryId", toolInventoryId);
		model.put("toolName", toolName);
		model.put("memberLicense", memberLicense);
		model.put("patronName", patronName);
		return "returnConfirmation";
	}
	
	@RequestMapping(path="/confirmReturn", method=RequestMethod.POST)
	public String confirmToolReturn(Map<String, Object> model,
									@RequestParam(name="cleanCheck") boolean cleanCheck,
								    @RequestParam(name="memberLicense") String memberLicense,
								    @RequestParam(name="toolInventoryId") int toolInventoryId) {
		int categoryId = toolDAO.getCategoryIdByInventoryId(toolInventoryId);
		LocalDate dueDate = toolDAO.returnDueDateByLocalDate(toolInventoryId);
		putAllFeesIntoModel(model, cleanCheck, memberLicense, categoryId, dueDate);
		toolDAO.returnTools(toolInventoryId);
		return "returnResults";
	}

	
	
	
	
	// ****** Additional Methods ******
	
	
	private void putAllFeesIntoModel(Map<String, Object> model, boolean cleanCheck, String memberLicense,
			int categoryId, LocalDate dueDate) {
		Double totalFees = toolDAO.calculateTotalFees(cleanCheck, dueDate, categoryId, memberLicense);
		Double lateFees = toolDAO.calculateLateFees(dueDate, categoryId);
		Double cleanFees = toolDAO.calculateCleanFees(cleanCheck);
		Double gasFees = toolDAO.calculateGasFees(categoryId);
		model.put("totalFees", totalFees);
		model.put("lateFees", lateFees);
		model.put("cleanFees", cleanFees);
		model.put("gasFees", gasFees);
	}
	
	private void checkoutBasket(Map<String, Object> model, String patronLicense) {
		Basket basket = (Basket)model.get("basket");
		List<Tool> basketList = basket.getToolBasket();
		toolDAO.loanTool(basketList, patronLicense);
		basketList.clear();
		model.put("basketList", basketList);
	}
	
	private String addPatronDetailsToModel(Map<String, Object> model, String patronFull) {
		String[] tempArray = patronFull.split(" ");
		String patronName = "";
		for(int i = 0; i < tempArray.length-1; i++) {
			patronName = patronName.concat(tempArray[i])+" ";
		}
		String patronLicense = tempArray[tempArray.length-1];
		model.put("patronName", patronName);
		model.put("patronLicense", patronLicense);
		return patronLicense;
	}
	
	private void addBasketToModel(Map<String, Object> model, Basket basket) {
		List<Tool> basketList = basket.getToolBasket();
		model.put("basketList", basketList);
	}
	
	private void getPatrons(Map<String, Object> model) {
		List<Patron> patronList = userDAO.returnAllPatrons();
		model.put("patronList", patronList);
	}
	
	private String runAddTool(Map<String, Object> model, int toolId, Basket basket) {
		Tool tool = toolDAO.readToolById(toolId);
		if(tool.getNumAvailable() < 1) {
			return "mainPage";
		} else {
			addTool(model, tool);
			addBasketToModel(model, basket);
			return "mainPage";
		}
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
		if(model.get("basket") == null) {
			Basket basket = new Basket();
			model.put("basket", basket);
		}
	}
	
	private void displayAllTools(Map<String, Object> model) {
		List<Tool> toolList = toolDAO.returnAllTools();
		model.put("toolList", toolList);
	}
	
}
