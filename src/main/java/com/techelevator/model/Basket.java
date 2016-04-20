package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

public class Basket {

	List<Tool> toolBasket;
	
	public Basket() {
		toolBasket = new ArrayList<>();
	}
	
	public void addToBasket(Tool tool) {
		if(toolBasket.isEmpty()) {
			toolBasket.add(tool);
		} else {
			boolean check = false;
			for(Tool t : toolBasket) {
				if(t.getToolId() == tool.getToolId()) {
					check = true;
					t.setQuantity(t.getQuantity()+1);
				}
			}
			if(!check) {
				toolBasket.add(tool);
			}
		}
	}
	
	public List<Tool> getToolBasket() {
		return toolBasket;
	}
	
}
