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
	
	public Tool returnToolById(int tool_id) {
		for(Tool t : toolBasket) {
			if(t.getToolId() == tool_id) {
				return t;
			}
		}
		return null;
	}
	
	public void removeToolById(int tool_id) {
		Tool tool = returnToolById(tool_id);
		toolBasket.remove(tool);
	}
	
	
}
