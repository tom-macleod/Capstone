package com.techelevator.model;

import java.util.List;

public interface UserDAO {

	public boolean checkLibrarianLogin(String username, String password);
	public void addMember(String license, String phone, String name);
	public List<Patron> returnAllPatrons();
	
}
