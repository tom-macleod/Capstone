package com.techelevator.model;

import java.time.LocalDate;

public class Loan {
	
	private int loanId;
	private int toolInventoryId;
	private int toolId;
	private String memberLicense;
	private LocalDate dueDate;
	private String patronName;
	private String toolName;
	
	
	
	
	public String getToolName() {
		return toolName;
	}
	public void setToolName(String toolName) {
		this.toolName = toolName;
	}
	public String getPatronName() {
		return patronName;
	}
	public void setPatronName(String patronName) {
		this.patronName = patronName;
	}
	public int getLoanId() {
		return loanId;
	}
	public void setLoanId(int loanId) {
		this.loanId = loanId;
	}
	public int getToolInventoryId() {
		return toolInventoryId;
	}
	public void setToolInventoryId(int toolInventoryId) {
		this.toolInventoryId = toolInventoryId;
	}
	public int getToolId() {
		return toolId;
	}
	public void setToolId(int toolId) {
		this.toolId = toolId;
	}
	public String getMemberLicense() {
		return memberLicense;
	}
	public void setMemberLicense(String memberLicense) {
		this.memberLicense = memberLicense;
	}
	public LocalDate getDueDate() {
		return dueDate;
	}
	public void setDueDate(LocalDate dueDate) {
		this.dueDate = dueDate;
	}

}
