package com.csm.entity;

public class Diet {
	
	private int Diet_ID;
	private String Diet_Type;
	private int Feed_per_day;
		
	public Diet(int diet_ID, String diet_Type, int feed_per_day) {
		super();
		Diet_ID = diet_ID;
		Diet_Type = diet_Type;
		Feed_per_day = feed_per_day;
	}

	public Diet(String diet_Type, int feed_per_day) {
		super();
		Diet_Type = diet_Type;
		Feed_per_day = feed_per_day;
	}
	
	public int getDiet_ID() {
		return Diet_ID;
	}
	public void setDiet_ID(int diet_ID) {
		Diet_ID = diet_ID;
	}
	public String getDiet_Type() {
		return Diet_Type;
	}
	public void setDiet_Type(String diet_Type) {
		Diet_Type = diet_Type;
	}
	public int getFeed_per_day() {
		return Feed_per_day;
	}
	public void setFeed_per_day(int feed_per_day) {
		Feed_per_day = feed_per_day;
	}
	
	

}
