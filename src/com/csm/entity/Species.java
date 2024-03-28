package com.csm.entity;

public class Species {

	private int Species_ID;
	private String Species_Type;
	private String Group;
	private String Lifestyle;
	private String Conservation;
	
	
	public Species(int species_ID, String species_Type, String group, String lifestyle, String conservation) {
		super();
		Species_ID = species_ID;
		Species_Type = species_Type;
		Group = group;
		Lifestyle = lifestyle;
		Conservation = conservation;
	}
	public Species(String species_Type, String group, String lifestyle, String conservation) {
		super();
		Species_Type = species_Type;
		Group = group;
		Lifestyle = lifestyle;
		Conservation = conservation;
	}
	
	public int getSpecies_ID() {
		return Species_ID;
	}
	public void setSpecies_ID(int species_ID) {
		Species_ID = species_ID;
	}
	public String getSpecies_Type() {
		return Species_Type;
	}
	public void setSpecies_Type(String species_Type) {
		Species_Type = species_Type;
	}
	public String getGroup() {
		return Group;
	}
	public void setGroup(String group) {
		Group = group;
	}
	public String getLifestyle() {
		return Lifestyle;
	}
	public void setLifestyle(String lifestyle) {
		Lifestyle = lifestyle;
	}
	public String getConservation() {
		return Conservation;
	}
	public void setConservation(String conservation) {
		Conservation = conservation;
	}
	
	
	
}
