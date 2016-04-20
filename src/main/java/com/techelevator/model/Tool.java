package com.techelevator.model;

public class Tool {

	private int toolId;
	private int toolCatId;
	private String toolName;
	private String description;
	private int loanPeriod;
	private int numAvailable;
	private int quantity;
	
	public Tool() {
		quantity = 1;
	}
	
	
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getNumAvailable() {
		return numAvailable;
	}
	public void setNumAvailable(int numAvailable) {
		this.numAvailable = numAvailable;
	}
	public int getToolId() {
		return toolId;
	}
	public void setToolId(int toolId) {
		this.toolId = toolId;
	}
	public int getToolCatId() {
		return toolCatId;
	}
	public void setToolCatId(int toolCatId) {
		this.toolCatId = toolCatId;
	}
	public String getToolName() {
		return toolName;
	}
	public void setToolName(String toolName) {
		this.toolName = toolName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getLoanPeriod() {
		return loanPeriod;
	}
	public void setLoanPeriod(int loanPeriod) {
		this.loanPeriod = loanPeriod;
	}
	
}
