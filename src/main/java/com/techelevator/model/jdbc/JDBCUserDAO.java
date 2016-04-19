package com.techelevator.model.jdbc;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.UserDAO;

@Component
public class JDBCUserDAO implements UserDAO {
	
	
private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCUserDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public boolean checkLibrarianLogin(String username, String password) {
		
		boolean doesLibrarianExist = false;
		String sqlSearchForLibrarian = "SELECT * FROM librarian_users " +
									   "WHERE UPPER(librarian_username) = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForLibrarian, username.toUpperCase());
		
		while(results.next()) {
			String databasePassword = results.getString("librarian_password");
			if(databasePassword.equals(password)) {
				doesLibrarianExist = true;
			}
		}
		return doesLibrarianExist;
	}

	
}
