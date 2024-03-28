package com.csm.entity;

import java.sql.Date;

public class Keepers {
	
	private int Keeper_ID;
	private String Keeper_Name;
	private Date Birthday;
	private String keeper_Rank;
	
		
	public Keepers(int keeper_ID, String keeper_Name, Date birthday, String keeper_Rank) {
		super();
		Keeper_ID = keeper_ID;
		Keeper_Name = keeper_Name;
		Birthday = birthday;
		this.keeper_Rank = keeper_Rank;
	}
	public Keepers(String keeper_Name, Date birthday, String keeper_Rank) {
		super();
		Keeper_Name = keeper_Name;
		Birthday = birthday;
		this.keeper_Rank = keeper_Rank;
	}
	
	
	public int getKeeper_ID() {
		return Keeper_ID;
	}
	public void setKeeper_ID(int keeper_ID) {
		Keeper_ID = keeper_ID;
	}
	public String getKeeper_Name() {
		return Keeper_Name;
	}
	public void setKeeper_Name(String keeper_Name) {
		Keeper_Name = keeper_Name;
	}
	public Date getBirthday() {
		return Birthday;
	}
	public void setBirthday(Date birthday) {
		Birthday = birthday;
	}
	public String getKeeper_Rank() {
		return this.keeper_Rank;
	}
	public void setKeeper_Rank(String keeper_Rank) {
		this.keeper_Rank = keeper_Rank;
	}
	
	

}
