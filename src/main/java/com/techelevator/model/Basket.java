package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

public class Basket {

	List<Tool> toolBasket;
	
	public Basket() {
		toolBasket = new ArrayList<>();
	}
	
	public void addToBasket(Tool tool) {
		toolBasket.add(tool);
	}
	
	public List<Tool> getToolBasket() {
		return toolBasket;
	}
	
}
