package com.techelevator.model;

import java.time.LocalDate;
import java.util.List;

public interface ToolDAO {

	public List<Tool> returnAllTools();
	public Tool readToolById(int tool_id);
	public boolean checkAvailability(Tool tool, int tool_id);
	public void loanTool(List<Tool> basketList, String patronLicense);
	public List<Loan> returnAllLoans();
	public void returnTools(int toolInventoryId);
	public double calculateTotalFees(boolean cleanCheck, LocalDate dueDate, int categoryId, String memberLicense);
	public LocalDate returnDueDateByLocalDate(int toolInventoryId);
	public int getCategoryIdByInventoryId(int inventoryId);
	public double calculateLateFees(LocalDate dueDate, int categoryId);
	public double calculateCleanFees(boolean cleanCheck);
	public double calculateGasFees(int categoryId);
	public boolean checkIfMemberHasFees(String patronLicense);
}
