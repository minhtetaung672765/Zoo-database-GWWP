package com.csm.entity;

public class Enclosures {
	
	private int Enclosure_ID;
	private String Enclosure_Type;
	private String Location;
	
	public Enclosures(int enclosure_ID, String enclosure_Type, String location) {
		super();
		Enclosure_ID = enclosure_ID;
		Enclosure_Type = enclosure_Type;
		Location = location;
	}
	public Enclosures(String enclosure_Type, String location) {
		super();
		Enclosure_Type = enclosure_Type;
		Location = location;
	}
	
	public int getEnclosure_ID() {
		return Enclosure_ID;
	}
	public void setEnclosure_ID(int enclosure_ID) {
		Enclosure_ID = enclosure_ID;
	}
	public String getEnclosure_Type() {
		return Enclosure_Type;
	}
	public void setEnclosure_Type(String enclosure_Type) {
		Enclosure_Type = enclosure_Type;
	}
	public String getLocation() {
		return Location;
	}
	public void setLocation(String location) {
		Location = location;
	}
		
}
