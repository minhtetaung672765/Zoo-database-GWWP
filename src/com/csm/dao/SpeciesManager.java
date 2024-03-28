package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csm.DBManager;
import com.csm.entity.Diet;
import com.csm.entity.Species;


public class SpeciesManager {
	
	//insert
	public int insert (Species s)throws ClassNotFoundException, SQLException{
		int result = -1;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		String sql = "insert into gwwp.Species(Species_Type,`Group`,Lifestyle, Conservation) values(?,?,?,?)";
	

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		//first and second parameters inserted 1. type and location
		pstmt.setString(1, s.getSpecies_Type());
		pstmt.setString(2, s.getGroup());
		pstmt.setString(3, s.getLifestyle());
		pstmt.setString(4, s.getConservation());
				
		//3. execute statement
		result = pstmt.executeUpdate();
		
		return result;
	}	
	
	 //select
	public ArrayList<Species>fetchAll() throws ClassNotFoundException, SQLException{
		
		ArrayList<Species> species = new ArrayList<Species>();
		
		Species c;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//query
		String sql = "select * from gwwp.species";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()){
			c = new Species(	rs.getInt("Species_ID"),
					rs.getString("Species_Type"),
					rs.getString("Group"),
					rs.getString("Lifestyle"),
					rs.getString("Conservation"));
					
			species.add(c);
		}
		return species;
	}
	
	//delete
		public int delete (int SpeciesID) throws ClassNotFoundException,
		SQLException{
			int result = -1;
			
			//get connection
			DBManager dbMgr = new DBManager();
			Connection conn = dbMgr.getConnection();
			
			//prepare statement
			String sql = "DELETE FROM gwwp.species where Species_ID=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, SpeciesID);
			
			//execute statement
			result = pstmt.executeUpdate();
			return result;
		}
		
		
		//update
		
		public int update(Species s)throws ClassNotFoundException,
		SQLException{
			
			int result = -1;
			
			//get connection
			DBManager dbMgr = new DBManager();
			Connection conn = dbMgr.getConnection();
			
			//prepare statement
			String sql = "UPDATE gwwp.species set Species_Type = ?,"+
			"`Group` = ?, Lifestyle = ?, Conservation = ? where Species_ID = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, s.getSpecies_Type());
			pstmt.setString(2, s.getGroup());
			pstmt.setString(3, s.getLifestyle());
			pstmt.setString(4, s.getConservation());
			pstmt.setInt(5, s.getSpecies_ID());
			
			//execute statement
			result = pstmt.executeUpdate();
			return result;
		}
		

	//getting Diet id
		
		public Species getById (int speID) throws ClassNotFoundException,SQLException{
			String sql;
			DBManager dbMgr = new DBManager();
			Connection conn = dbMgr.getConnection();
			
			//prepare statement
			sql = "SELECT * FROM gwwp.species where Species_ID = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt (1, speID);
			ResultSet rs = pstmt.executeQuery();
			
			Species species = null;
			
			while (rs.next()){
				species = new Species(rs.getInt("Species_ID"),
						rs.getString("Species_Type"),
						rs.getString("Group"),
						rs.getString("Lifestyle"),
						rs.getString("Conservation"));
			}
			return species;
		}
	
}
