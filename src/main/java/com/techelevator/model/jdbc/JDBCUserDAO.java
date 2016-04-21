package com.techelevator.model.jdbc;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public void addMember(String name, String username, String phone, String license) {
		
		String sqlAddMember = "INSERT INTO members (member_name, member_username, member_phone, member_license) " +
							  "VALUES (?, ?, ?, ?)";
		jdbcTemplate.update(sqlAddMember, name, username, phone, license);
		
	}

	@Override
	public List<String> returnAllMemberUsernames() {
		List<String> usernameList = new ArrayList<>();
		String sqlReturnUsernames = "SELECT member_username FROM members";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlReturnUsernames);
		while(results.next()) {
			String username = results.getString("member_username");
			usernameList.add(username);
		}
		return usernameList;
	}
	
	

	
}
