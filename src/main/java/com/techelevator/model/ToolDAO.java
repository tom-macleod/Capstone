package com.techelevator.model;

import java.util.List;

public interface ToolDAO {

	public List<Tool> returnAllTools();
	public Tool readToolById(int tool_id);
}
