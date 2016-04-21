package com.techelevator.model;

public interface UserDAO {

	public boolean checkLibrarianLogin(String username, String password);
	public void addMember(String name, String username, String phone, String license);
	
}
