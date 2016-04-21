package com.techelevator.model;

public class LoginCheck {

	boolean isLoggedIn;
	String username;
	
	
	public LoginCheck() {
		isLoggedIn = false;
	}
	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public boolean isLoggedIn() {
		return isLoggedIn;
	}

	public void setLoggedIn(boolean isLoggedIn) {
		this.isLoggedIn = isLoggedIn;
	}
	
}
