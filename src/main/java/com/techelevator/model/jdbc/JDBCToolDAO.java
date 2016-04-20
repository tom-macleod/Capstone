package com.techelevator.model.jdbc;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Tool;
import com.techelevator.model.ToolDAO;

@Component
public class JDBCToolDAO implements ToolDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCToolDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	

	@Override
	public List<Tool> returnAllTools() {
		List<Tool> toolList = new ArrayList<>();
		String sqlReturnAllTools = "SELECT COUNT(*) AS number_available, tool.tool_id, tool.name, tool.tool_category_id, tool.description, tool.loan_period_in_days " +
								   "FROM tool, tool_inventory " +
								   "WHERE tool.tool_id = tool_inventory.tool_id " +
								   "GROUP BY tool.tool_id " +
								   "ORDER BY tool.tool_id";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlReturnAllTools);
		
		while(results.next()) {
			Tool toolToAdd = new Tool();
			toolToAdd.setToolName(results.getString("name"));
			toolToAdd.setDescription(results.getString("description"));
			toolToAdd.setToolId(results.getInt("tool_id"));
			toolToAdd.setToolCatId(results.getInt("tool_category_id"));
			toolToAdd.setLoanPeriod(results.getInt("loan_period_in_days"));
			toolToAdd.setNumAvailable(results.getInt("number_available"));
			toolList.add(toolToAdd);
		}
		return toolList;
	}


	@Override
	public Tool readToolById(int toolId) {
		Tool tool = new Tool();
		String sqlSearchToolById = "SELECT * FROM tool " +
								   "WHERE tool_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchToolById, toolId);
		
		while(results.next()) {
			tool.setToolName(results.getString("name"));
			tool.setDescription(results.getString("description"));
			tool.setToolId(results.getInt("tool_id"));
			tool.setToolCatId(results.getInt("tool_category_id"));
			tool.setLoanPeriod(results.getInt("loan_period_in_days"));
		}
		
		return tool;
	}


	@Override
	public boolean checkAvailability(Tool tool, int toolId) {
		int quantity = tool.getQuantity();
		int stock = -1;
		
		String sqlCheckStock = "SELECT * FROM tool_inventory " +
							   "WHERE tool_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlCheckStock, toolId);
		while(results.next()) {
			stock++;
		}
		if(quantity > stock) {
			return false;
		} else {
			return true;
		}
		
	}

}
