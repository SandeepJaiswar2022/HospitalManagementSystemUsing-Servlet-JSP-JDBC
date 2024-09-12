package com.entity;

public class Specialities {
	private Integer idInteger;
	private String specialityString;
	
	public Specialities(String specialityString) {
		super();
		this.specialityString = specialityString;
	}

	public Specialities() {
		super();
	}

	public Integer getIdInteger() {
		return idInteger;
	}

	public void setIdInteger(Integer idInteger) {
		this.idInteger = idInteger;
	}

	public String getSpecialityString() {
		return specialityString;
	}

	public void setSpecialityString(String specialityString) {
		this.specialityString = specialityString;
	}
}
