package com.techelevator.model.jdbc;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Loan;
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
		String sqlReturnAllTools = "SELECT COUNT(*) AS stock, tool.tool_id, tool.name, tool.tool_category_id, tool.description, tool.loan_period_in_days " +
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
			toolToAdd.setStock(results.getInt("stock"));
			toolList.add(toolToAdd);
		}
		for(Tool tool : toolList) {
			int tool_id = tool.getToolId();
			String sqlCheckAvailable = "SELECT COUNT (*) AS number_available FROM tool_inventory " +
										"WHERE available IS TRUE AND tool_id = ?";
			SqlRowSet avalilableResults = jdbcTemplate.queryForRowSet(sqlCheckAvailable, tool_id);
			while(avalilableResults.next()) {
				tool.setNumAvailable(avalilableResults.getInt("number_available"));
			}
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
		
		String sqlCheckAvailable = "SELECT COUNT (*) AS number_available FROM tool_inventory " +
								   "WHERE available IS TRUE AND tool_id = ?";
			SqlRowSet avalilableResults = jdbcTemplate.queryForRowSet(sqlCheckAvailable, toolId);
			while(avalilableResults.next()) {
			tool.setNumAvailable(avalilableResults.getInt("number_available"));
			}
		
		return tool;
	}


	@Override
	public boolean checkAvailability(Tool tool, int toolId) {
		int quantity = tool.getQuantity();
		int stock = -1;
		
		String sqlCheckStock = "SELECT * FROM tool_inventory " +
							   "WHERE tool_id = ? AND available IS TRUE";
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


	@Override
	public void loanTool(List<Tool> basketList, String patronLicense) {
		
		for(Tool t : basketList) {
			int tool_id = t.getToolId();
			int quantity = t.getQuantity();
			int loanPeriod = t.getLoanPeriod();
			List<Integer> inventoryIdList = new ArrayList<>();
			String sqlReturnInventoryId = "SELECT tool_inventory_id FROM tool_inventory " +
										  "WHERE tool_id = ? AND available IS TRUE " +
										  "LIMIT ?";
			SqlRowSet inventoryIdResults = jdbcTemplate.queryForRowSet(sqlReturnInventoryId, tool_id, quantity);
			while(inventoryIdResults.next()) {
				Integer inventoryId = inventoryIdResults.getInt("tool_inventory_id");
				inventoryIdList.add(inventoryId);
			}
			
			LocalDate loanDate = LocalDate.now();
			LocalDate dueDate = loanDate.plusDays(loanPeriod);
			
			for(Integer id : inventoryIdList) {
				String sqlInsertLoan = "INSERT INTO loans (tool_inventory_id, tool_id, member_license, due_date) " +
									   "VALUES (?, ?, ?, ?)";
				jdbcTemplate.update(sqlInsertLoan, id, tool_id, patronLicense, dueDate);
				
				String sqlUpdateInventory = "UPDATE tool_inventory " +
												"SET available = FALSE " +
												"WHERE tool_inventory_id = ?";
				jdbcTemplate.update(sqlUpdateInventory, id);
			}
			
			
		}
		
		
	}


	@Override
	public List<Loan> returnAllLoans() {
		
		List<Loan> loanList = new ArrayList<>();
		
		String sqlReturnAllLoans = "SELECT * FROM loans";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlReturnAllLoans);
		while(results.next()) {
			Loan loan = new Loan();
			loan.setLoanId(results.getInt("loan_id"));
			loan.setToolInventoryId(results.getInt("tool_inventory_id"));
			loan.setToolId(results.getInt("tool_id"));
			loan.setMemberLicense(results.getString("member_license"));
			loan.setDueDate(results.getDate("due_date").toLocalDate());
			loanList.add(loan);
		}
		for(Loan l : loanList) {
			String license = l.getMemberLicense();
			int toolId = l.getToolId();
			String sqlGetPatronName = "SELECT member_name FROM members " +
									  "WHERE member_license = ?";
			SqlRowSet patronResults = jdbcTemplate.queryForRowSet(sqlGetPatronName, license);
			while(patronResults.next()) {
				l.setPatronName(patronResults.getString("member_name"));
			}
			String sqlGetToolName = "SELECT name FROM tool " +
									  "WHERE tool_id = ?";
			SqlRowSet toolResults = jdbcTemplate.queryForRowSet(sqlGetToolName, toolId);
			while(toolResults.next()) {
			l.setToolName(toolResults.getString("name"));
			}
			
			
			
		}
		
		return loanList;
	}

}
