package com.techelevator.model;

import java.util.List;

public interface UserDAO {

	public boolean checkLibrarianLogin(String username, String password);
	public void addMember(String name, String username, String phone, String license);
	public List<String> returnAllMemberUsernames();
	
}
