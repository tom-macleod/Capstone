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
		String sqlReturnAllTools = "SELECT * FROM tool ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlReturnAllTools);
		
		while(results.next()) {
			Tool toolToAdd = new Tool();
			toolToAdd.setToolName(results.getString("name"));
			toolToAdd.setDescription(results.getString("description"));
			toolToAdd.setToolId(results.getInt("tool_id"));
			toolToAdd.setToolCatId(results.getInt("tool_category_id"));
			toolToAdd.setLoanPeriod(results.getInt("loan_period_in_days"));
			toolList.add(toolToAdd);
		}
		return toolList;
	}

}
