package com.entity;

public class Appointments {

	private int appointmentId;
	private int userId;
	private String fullNameString;
	private String genderString;
	private String ageString;
	private String appointmentDateString;
	private String emailString;
	private String phoneNumberString;
	private String deseaseString;
	private int doctorId;
	private String fullAddressString;
	private String statuString;
	
	public Appointments(int userId, String fullNameString, String genderString, String ageString,
			String appointmentDateString, String emailString, String phoneNumberString, String deseaseString,
			int doctorId, String fullAddressString, String statuString) {
		super();
		this.userId = userId;
		this.fullNameString = fullNameString;
		this.genderString = genderString;
		this.ageString = ageString;
		this.appointmentDateString = appointmentDateString;
		this.emailString = emailString;
		this.phoneNumberString = phoneNumberString;
		this.deseaseString = deseaseString;
		this.doctorId = doctorId;
		this.fullAddressString = fullAddressString;
		this.statuString = statuString;
	}
	public Appointments() {
		super();
	}
	public int getAppointmentId() {
		return appointmentId;
	}
	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getFullNameString() {
		return fullNameString;
	}
	public void setFullNameString(String fullNameString) {
		this.fullNameString = fullNameString;
	}
	public String getGenderString() {
		return genderString;
	}
	public void setGenderString(String genderString) {
		this.genderString = genderString;
	}
	public String getAgeString() {
		return ageString;
	}
	public void setAgeString(String ageString) {
		this.ageString = ageString;
	}
	public String getAppointmentDateString() {
		return appointmentDateString;
	}
	public void setAppointmentDateString(String appointmentDateString) {
		this.appointmentDateString = appointmentDateString;
	}
	public String getEmailString() {
		return emailString;
	}
	public void setEmailString(String emailString) {
		this.emailString = emailString;
	}
	public String getPhoneNumberString() {
		return phoneNumberString;
	}
	public void setPhoneNumberString(String phoneNumberString) {
		this.phoneNumberString = phoneNumberString;
	}
	public String getDeseaseString() {
		return deseaseString;
	}
	public void setDeseaseString(String deseaseString) {
		this.deseaseString = deseaseString;
	}
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
	public String getFullAddressString() {
		return fullAddressString;
	}
	public void setFullAddressString(String fullAddressString) {
		this.fullAddressString = fullAddressString;
	}
	public String getStatuString() {
		return statuString;
	}
	public void setStatuString(String statuString) {
		this.statuString = statuString;
	}
}
