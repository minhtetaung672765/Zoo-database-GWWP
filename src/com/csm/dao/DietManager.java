package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csm.DBManager;
import com.csm.entity.Diet;


public class DietManager {
	
	//insert
	public int insert (Diet d)throws ClassNotFoundException, SQLException{
		int result = -1;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		String sql = "insert into gwwp.diet(Diet_Type, Feed_per_day) values(?,?)";
	

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		//first and second parameters inserted 1. type and location
		
		pstmt.setString(1, d.getDiet_Type());
		pstmt.setInt(2, d.getFeed_per_day());
				
		//3. execute statement
		result = pstmt.executeUpdate();
		
		return result;
	}	 
	
	 //select
	
	public ArrayList<Diet> fetchAll() throws ClassNotFoundException, SQLException{
		
		ArrayList<Diet> diet = new ArrayList<Diet>();
		
		Diet d;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//query
		String sql = "select* from gwwp.diet";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()){
			d = new Diet(rs.getInt("Diet_ID"),
					rs.getString("Diet_Type"),
					rs.getInt("Feed_per_day"));
					
			diet.add(d);
		}
		return diet;
	}
	
	
	//delete
	
	public int delete (int DietId) throws ClassNotFoundException,
	SQLException{
		int result = -1;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		String sql = "DELETE FROM gwwp.diet WHERE Diet_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, DietId);
		
		//execute statement
		result = pstmt.executeUpdate();
		return result;
	}

	
	//update
	
	public int update(Diet d)throws ClassNotFoundException,
	SQLException{
		
		int result = -1;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		String sql = "UPDATE gwwp.diet set Diet_Type = ?,"+
		"Feed_per_day = ? where Diet_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		
		pstmt.setString(1, d.getDiet_Type());
		pstmt.setInt(2, d.getFeed_per_day());
		pstmt.setInt(3, d.getDiet_ID());
		
		//execute statement
		result = pstmt.executeUpdate();
		return result;
	}
	

//getting Diet id
	
	public Diet getById (int DietId) throws ClassNotFoundException,SQLException{
		String sql;
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		sql = "SELECT * FROM gwwp.diet where Diet_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt (1, DietId);
		ResultSet rs = pstmt.executeQuery();
		
		Diet diet = null;
		
		while (rs.next()){
			diet = new Diet(rs.getInt("Diet_ID"),
					rs.getString("Diet_Type"),
					rs.getInt("Feed_per_day"));
		}
		return diet;
	}
	
	
}
