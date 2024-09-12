package com.entity;

public class Users {

	private Integer idInteger;
	private String usernameString;
	private String passwordString;
	private String emailString;

	public Users() {
		super();
	}

	public Users(String usernameString, String passwordString, String emailString) {
		this.emailString = emailString;
		this.usernameString = usernameString;
		this.passwordString = passwordString;
	}

	public Integer getIdInteger() {
		return idInteger;
	}

	public void setIdInteger(Integer idInteger) {
		this.idInteger = idInteger;
	}

	public String getUsernameString() {
		return usernameString;
	}

	public void setUsernameString(String usernameString) {
		this.usernameString = usernameString;
	}

	public String getPasswordString() {
		return passwordString;
	}

	public void setPasswordString(String passwordString) {
		this.passwordString = passwordString;
	}

	public String getEmailString() {
		return emailString;
	}

	public void setEmailString(String emailString) {
		this.emailString = emailString;
	}

}
