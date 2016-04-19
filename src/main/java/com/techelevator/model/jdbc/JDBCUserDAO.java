package com.techelevator.model.jdbc;

import javax.sql.DataSource;

import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.UserDAO;
import com.techelevator.security.PasswordHasher;

@Component
public class JDBCUserDAO implements UserDAO {
	
	
private JdbcTemplate jdbcTemplate;
private PasswordHasher passwordHasher;
	
	@Autowired
	public JDBCUserDAO(DataSource dataSource, PasswordHasher passwordHasher) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.passwordHasher = passwordHasher;
	}

	@Override
	public boolean checkLibrarianLogin(String username, String password) {
		
		boolean doesLibrarianExist = false;
		String sqlSearchForLibrarian = "SELECT * FROM librarian_users " +
									   "WHERE UPPER(librarian_username) = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForLibrarian, username.toUpperCase());
		
		while(results.next()) {
			String databaseSalt = results.getString("librarian_salt");
			String databasePassword = results.getString("librarian_password");
			String hashedPassword = passwordHasher.computeHash(password, Base64.decode(databaseSalt));
			
			if(databasePassword.equals(hashedPassword)) {
				doesLibrarianExist = true;
			}
		}
		return doesLibrarianExist;
	}

	
}
