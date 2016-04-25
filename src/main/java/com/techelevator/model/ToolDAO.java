package com.techelevator.model;

import java.time.LocalDate;
import java.util.List;

public interface ToolDAO {

	public List<Tool> returnAllTools();
	public Tool readToolById(int tool_id);
	public boolean checkAvailability(Tool tool, int tool_id);
	public void loanTool(List<Tool> basketList, String patronLicense);
	public List<Loan> returnAllLoans();
	public int returnTools(int toolInventoryId);
	public double calculateFees(boolean cleanCheck, LocalDate dueDate, int categoryId);
	public LocalDate returnDueDateByLocalDate(int toolCategoryId);
}
