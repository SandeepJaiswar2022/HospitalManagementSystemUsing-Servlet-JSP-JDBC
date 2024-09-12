package com.entity;

public class Doctors {

	private int id;
	private String fullNameString;
	private String qualificationString;
	private String specializationString;
	private String emailString;
	private String mobileNumberString;
	private String passwordString;
	public Doctors() {
		super();
	}
	public Doctors(String fullNameString, String qualificationString,
			String specializationString, String emailString, String mobileNumberString, String passwordString) {
		super();
		this.fullNameString = fullNameString;
		this.qualificationString = qualificationString;
		this.specializationString = specializationString;
		this.emailString = emailString;
		this.mobileNumberString = mobileNumberString;
		this.passwordString = passwordString;
	}
	public Doctors(int id, String fullNameString, String qualificationString, String specializationString,
			String emailString, String mobileNumberString, String passwordString) {
		super();
		this.id = id;
		this.fullNameString = fullNameString;
		this.qualificationString = qualificationString;
		this.specializationString = specializationString;
		this.emailString = emailString;
		this.mobileNumberString = mobileNumberString;
		this.passwordString = passwordString;
	}
	public String getFullNameString() {
		return fullNameString;
	}
	public void setFullNameString(String fullNameString) {
		this.fullNameString = fullNameString;
	}
	public String getQualificationString() {
		return qualificationString;
	}
	public void setQualificationString(String qualificationString) {
		this.qualificationString = qualificationString;
	}
	public String getSpecializationString() {
		return specializationString;
	}
	public void setSpecializationString(String specializationString) {
		this.specializationString = specializationString;
	}
	public String getEmailString() {
		return emailString;
	}
	public void setEmailString(String emailString) {
		this.emailString = emailString;
	}
	public String getMobileNumberString() {
		return mobileNumberString;
	}
	public void setMobileNumberString(String mobileNumberString) {
		this.mobileNumberString = mobileNumberString;
	}
	public String getPasswordString() {
		return passwordString;
	}
	public void setPasswordString(String passwordString) {
		this.passwordString = passwordString;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
