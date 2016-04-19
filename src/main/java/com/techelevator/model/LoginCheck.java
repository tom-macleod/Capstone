package com.techelevator.model;

public class LoginCheck {

	boolean isLoggedIn;
	
	public LoginCheck() {
		isLoggedIn = false;
	}

	public boolean isLoggedIn() {
		return isLoggedIn;
	}

	public void setLoggedIn(boolean isLoggedIn) {
		this.isLoggedIn = isLoggedIn;
	}
	
}
