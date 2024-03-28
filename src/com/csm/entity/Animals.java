package com.csm.entity;

public class Animals {

	private int Animal_ID;
	private String Animal_Name;
	private String Gender;
	private int Arrival_Year;
	private int Species_Species_ID;
	private int Enclosures_Enclosure_ID;
	private int Keepers_Keeper_ID;
	private int Diet_Diet_ID;
	
	//for report2
	private String Name;          // keeper name
	private int totalAnimals;
	

	public Animals(int animal_ID, String animal_Name, String gender, int arrival_Year, int species_Species_ID,
			int enclosures_Enclosure_ID, int keepers_Keeper_ID, int diet_Diet_ID) {
		super();
		Animal_ID = animal_ID;
		Animal_Name = animal_Name;
		Gender = gender;
		Arrival_Year = arrival_Year;
		Species_Species_ID = species_Species_ID;
		Enclosures_Enclosure_ID = enclosures_Enclosure_ID;
		Keepers_Keeper_ID = keepers_Keeper_ID;
		Diet_Diet_ID = diet_Diet_ID;
	}
	
	public Animals(String animal_Name, String gender, int arrival_Year, int species_Species_ID,
			int enclosures_Enclosure_ID, int keepers_Keeper_ID, int diet_Diet_ID) {
		super();
		Animal_Name = animal_Name;
		Gender = gender;
		Arrival_Year = arrival_Year;
		Species_Species_ID = species_Species_ID;
		Enclosures_Enclosure_ID = enclosures_Enclosure_ID;
		Keepers_Keeper_ID = keepers_Keeper_ID;
		Diet_Diet_ID = diet_Diet_ID;
	}
	
	public Animals(String name, int totalAnimals) {
		super();
		Name = name;
		this.totalAnimals = totalAnimals;
	}
	
	public Animals(int animalID,String animalName, String animalGender,
			int animalArrival, int keeperID, String keeperName){
		Animal_ID = animalID;
		Animal_Name = animalName;
		Gender = animalGender;
		Arrival_Year = animalArrival;
		Keepers_Keeper_ID = keeperID;
		Name = keeperName;
	}
	
	
	public int getAnimal_ID() {
		return Animal_ID;
	}
	public void setAnimal_ID(int animal_ID) {
		Animal_ID = animal_ID;
	}
	public String getAnimal_Name() {
		return Animal_Name;
	}
	public void setAnimal_Name(String animal_Name) {
		Animal_Name = animal_Name;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public int getArrival_Year() {
		return Arrival_Year;
	}
	public void setArrival_Year(int arrival_Year) {
		Arrival_Year = arrival_Year;
	}
	public int getSpecies_Species_ID() {
		return Species_Species_ID;
	}
	public void setSpecies_Species_ID(int species_Species_ID) {
		Species_Species_ID = species_Species_ID;
	}
	public int getEnclosures_Enclosure_ID() {
		return Enclosures_Enclosure_ID;
	}
	public void setEnclosures_Enclosure_ID(int enclosures_Enclosure_ID) {
		Enclosures_Enclosure_ID = enclosures_Enclosure_ID;
	}
	public int getKeepers_Keeper_ID() {
		return Keepers_Keeper_ID;
	}
	public void setKeepers_Keeper_ID(int keepers_Keeper_ID) {
		Keepers_Keeper_ID = keepers_Keeper_ID;
	}
	public int getDiet_Diet_ID() {
		return Diet_Diet_ID;
	}
	public void setDiet_Diet_ID(int diet_Diet_ID) {
		Diet_Diet_ID = diet_Diet_ID;
	}
	
// report2 - getter-setter	
	public String getName() { // keeper name
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public int getTotalAnimals() {
		return totalAnimals;
	}

	public void setTotalAnimals(int totalAnimals) {
		this.totalAnimals = totalAnimals;
	}
// -----------------	
	
}
