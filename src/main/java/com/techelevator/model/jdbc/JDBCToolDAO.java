package com.techelevator.model.jdbc;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
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
	public boolean checkIfMemberHasFees(String patronLicense) {
		
		double fees = 0;
		String sqlGetMemberFees = 	"SELECT member_fees FROM members " +
									"WHERE member_license = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetMemberFees, patronLicense);
		while(results.next()) {
			fees = results.getDouble("member_fees");
			if(fees > 0){
				return true;
			} 
		}
		return false;
	}

	@Override
	public void loanTool(List<Tool> basketList, String patronLicense) {

		for (Tool t : basketList) {
			int tool_id = t.getToolId();
			int quantity = t.getQuantity();
			int loanPeriod = t.getLoanPeriod();
			List<Integer> inventoryIdList = new ArrayList<>();
			String sqlReturnInventoryId = "SELECT tool_inventory_id FROM tool_inventory "
					+ "WHERE tool_id = ? AND available IS TRUE " + "LIMIT ?";
			SqlRowSet inventoryIdResults = jdbcTemplate.queryForRowSet(sqlReturnInventoryId, tool_id, quantity);
			while (inventoryIdResults.next()) {
				Integer inventoryId = inventoryIdResults.getInt("tool_inventory_id");
				inventoryIdList.add(inventoryId);
			}

			LocalDate loanDate = LocalDate.now();
			LocalDate dueDate = loanDate.plusDays(loanPeriod);

			for (Integer id : inventoryIdList) {
				String sqlInsertLoan = "INSERT INTO loans (tool_inventory_id, tool_id, member_license, due_date) "
						+ "VALUES (?, ?, ?, ?)";
				jdbcTemplate.update(sqlInsertLoan, id, tool_id, patronLicense, dueDate);

				String sqlUpdateInventory = "UPDATE tool_inventory " + "SET available = FALSE "
						+ "WHERE tool_inventory_id = ?";
				jdbcTemplate.update(sqlUpdateInventory, id);
			}
		}
	}


	@Override
	public List<Loan> returnAllLoans() {
		
		List<Loan> loanList = new ArrayList<>();
		
		String sqlReturnAllLoans = "SELECT * FROM loans, members " +
								   "WHERE members.member_license = loans.member_license " +
								   "ORDER BY members.member_name, loans.due_date";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlReturnAllLoans);
		while(results.next()) {
			Loan loan = new Loan();
			loan.setLoanId(results.getInt("loan_id"));
			loan.setToolInventoryId(results.getInt("tool_inventory_id"));
			loan.setToolId(results.getInt("tool_id"));
			loan.setMemberLicense(results.getString("member_license"));
			loan.setDueDate(results.getDate("due_date").toLocalDate());
			loan.setPatronName(results.getString("member_name"));
			loanList.add(loan);
		}
		for(Loan l : loanList) {
			int toolId = l.getToolId();
			String sqlGetToolName = "SELECT name FROM tool " +
									  "WHERE tool_id = ?";
			SqlRowSet toolResults = jdbcTemplate.queryForRowSet(sqlGetToolName, toolId);
			while(toolResults.next()) {
			l.setToolName(toolResults.getString("name"));
			}
		}
		return loanList;
	}


	@Override
	public void returnTools(int toolInventoryId) {
		String sqlAddToInventory = "UPDATE tool_inventory " +
								   "SET available = TRUE " +
								   "WHERE tool_inventory_id = ?";
		jdbcTemplate.update(sqlAddToInventory, toolInventoryId);
		
		String sqlRemoveLoan = "DELETE FROM loans " +
							   "WHERE tool_inventory_id = ?";
		jdbcTemplate.update(sqlRemoveLoan, toolInventoryId);
										
	}
	
	


	@Override
	public double calculateTotalFees(boolean cleanCheck, LocalDate dueDate, int categoryId, String memberLicense) {
		
		long daysLate = 0;
		double fees = 0.00;
		double oldFees = 0.00;
		
		
		if(!cleanCheck) {
			fees += 5;
		}
		
		LocalDate currentDate = LocalDate.now();
		if(currentDate.isAfter(dueDate)) {
			daysLate = ChronoUnit.DAYS.between(dueDate, currentDate);
		}
		
		if(categoryId == 3) {
			fees += (daysLate * 0.5);
		} else {
			fees += daysLate;
		}
		
		if(categoryId == 2) {
			fees += 2;
		}
		
		
		String sqlGetOldFee = "SELECT member_fees FROM members " +
									"WHERE member_license = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetOldFee, memberLicense);
		while(results.next()) {
			oldFees = results.getDouble("member_fees");
		}
		fees += oldFees;
		String sqlAddMemberFees = "UPDATE members SET member_fees = ? " + 
								  "WHERE member_license = ?";
		jdbcTemplate.update(sqlAddMemberFees, fees, memberLicense); 
		
		return fees -= oldFees;
	}


	@Override
	public LocalDate returnDueDateByLocalDate(int toolInventoryId) {
		LocalDate dueDate = LocalDate.now();
		String sqlReturnDate = "SELECT due_date FROM loans " +
							   "WHERE tool_inventory_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlReturnDate, toolInventoryId);
		
		while(results.next()) {
			dueDate = results.getDate("due_date").toLocalDate();
			if(!dueDate.equals(LocalDate.now())) {
				return dueDate;
			}

		}
		return dueDate;
	}


	@Override
	public int getCategoryIdByInventoryId(int inventoryId) {
		int categoryId = 0;
		String sqlGetToolCategoryId = 	"SELECT tool.tool_category_id " +
				"FROM tool, tool_inventory " +
				"WHERE tool.tool_id = tool_inventory.tool_id " +
				"AND tool_inventory.tool_inventory_id = ?";
		SqlRowSet toolCategoryIdResults = jdbcTemplate.queryForRowSet(sqlGetToolCategoryId, inventoryId);
		while(toolCategoryIdResults.next()) {
		categoryId = toolCategoryIdResults.getInt("tool_category_id");
		}		
		return categoryId;
	}


	@Override
	public double calculateLateFees(LocalDate dueDate, int categoryId) {
		
		long daysLate = 0;
		double fees = 0;
		
		LocalDate currentDate = LocalDate.now();
		if(currentDate.isAfter(dueDate)) {
			daysLate = ChronoUnit.DAYS.between(dueDate, currentDate);
		}
		
		if(categoryId == 3) {
			fees += (daysLate * 0.5);
		} else {
			fees += daysLate;
		}
		
		return fees;
	}


	@Override
	public double calculateCleanFees(boolean cleanCheck) {
		double fees = 0;
		
		if(!cleanCheck) {
			fees += 5;
		}
		
		return fees;
	}


	@Override
	public double calculateGasFees(int categoryId) {
		double fees = 0;
		
		if(categoryId == 2) {
			fees += 2;
		}
		
		return fees;
	}


	@Override
	public boolean checkIfMemberHasReachedToolLimit(String patronLicense, int numberOfTools) {
		
		int numberCount = 0;
		String sqlCheckNumberOfTools = "SELECT COUNT(*) AS tool_count FROM loans " +
									   "WHERE member_license = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlCheckNumberOfTools, patronLicense);
		while(results.next()) {
			numberCount = results.getInt("tool_count");
		}
		numberCount += numberOfTools;
		
		if(numberCount > 7) {
			return true;
		} else {
			return false;
		}

	}


	@Override
	public boolean checkIfMemberHasReachedPowerToolLimit(String patronLicense, List<Tool> basketList) {
		
		int basketListPowerToolCount = 0;
		int powerToolCount = 0;
		List<Integer> toolIdList = returnToolIds(patronLicense);
		powerToolCount = returnPowerToolCount(powerToolCount, toolIdList);
		
		for(Tool t : basketList) {
			int basketCatId = t.getToolCatId();
			if(basketCatId < 3) {
				basketListPowerToolCount++;
			}
		}
		powerToolCount += basketListPowerToolCount;
		
		if(powerToolCount > 3) {
			return true;
		} else {
			return false;
		}
	}

	
	

	public List<Integer> returnToolIds(String patronLicense) {
		List<Integer> toolIdList = new ArrayList<>();
		String sqlReturnToolIds = "SELECT tool_id FROM loans " +
								  "WHERE member_license = ?";
		SqlRowSet toolIdResults = jdbcTemplate.queryForRowSet(sqlReturnToolIds, patronLicense);
		while(toolIdResults.next()) {
			Integer tempToolId = toolIdResults.getInt("tool_id");
			if(!tempToolId.equals(null)) {
				toolIdList.add(tempToolId);
			}
		}
		return toolIdList;
	}


	public int returnPowerToolCount(int powerToolCount, List<Integer> toolIdList) {
		for(Integer id : toolIdList) {
			int category_id = 3;
			String sqlCheckCategoryId = "SELECT tool_category_id FROM tool " +
										"WHERE tool_id = ?";
			SqlRowSet categoryResults = jdbcTemplate.queryForRowSet(sqlCheckCategoryId, id);
			while(categoryResults.next()) {
				category_id = categoryResults.getInt("tool_category_id");
				if(category_id < 3) {
					powerToolCount++;
				}
			}
		}
		return powerToolCount;
	}





	
}
