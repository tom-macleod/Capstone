package com.techelevator.model;

import java.util.List;

public interface ToolDAO {

	public List<Tool> returnAllTools();
	public Tool readToolById(int tool_id);
	public boolean checkAvailability(Tool tool, int tool_id);
	public void loanTool(List<Tool> basketList, String patronLicense);
}
