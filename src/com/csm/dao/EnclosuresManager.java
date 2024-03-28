package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csm.DBManager;
import com.csm.entity.Diet;
import com.csm.entity.Enclosures;


public class EnclosuresManager {
	
	//insert
	public int insert (Enclosures e)throws ClassNotFoundException, SQLException{
		int result = -1;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		String sql = "insert into gwwp.Enclosures(Enclosure_Type,Location) values(?,?)";
	

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		//first and second parameters inserted 1. type and location
		pstmt.setString(1, e.getEnclosure_Type());
		pstmt.setString(2, e.getLocation());
		
				
		//3. execute statement
		result = pstmt.executeUpdate();
		
		return result;
	}	 
	
	 //select
	public ArrayList<Enclosures>fetchAll() throws ClassNotFoundException, SQLException{
		
		ArrayList<Enclosures> enclo = new ArrayList<Enclosures>();
		
		Enclosures e;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//query
		String sql = "select * from gwwp.enclosures";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()){
			e = new Enclosures(	rs.getInt("Enclosure_ID"),
					rs.getString("Enclosure_Type"),
					rs.getString("Location"));
					
			enclo.add(e);
		}
		return enclo;
	}
	
	
	//delete
	
		public int delete (int encID) throws ClassNotFoundException,
		SQLException{
			int result = -1;
			
			//get connection
			DBManager dbMgr = new DBManager();
			Connection conn = dbMgr.getConnection();
			
			//prepare statement
			String sql = "DELETE FROM gwwp.enclosures WHERE Enclosure_ID = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, encID);
			
			//execute statement
			result = pstmt.executeUpdate();
			return result;
		}
		
		//update
		
		public int update(Enclosures e)throws ClassNotFoundException,
		SQLException{
			
			int result = -1;
			
			//get connection
			DBManager dbMgr = new DBManager();
			Connection conn = dbMgr.getConnection();
			
			//prepare statement
			String sql = "UPDATE gwwp.enclosures set Enclosure_Type = ?,"+
			"Location = ? where Enclosure_ID = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, e.getEnclosure_Type());
			pstmt.setString(2, e.getLocation());
			pstmt.setInt(3, e.getEnclosure_ID());
			
			//execute statement
			result = pstmt.executeUpdate();
			return result;
		}
		

	//getting Diet id
		
		public Enclosures getById (int encID) throws ClassNotFoundException,SQLException{
			String sql;
			DBManager dbMgr = new DBManager();
			Connection conn = dbMgr.getConnection();
			
			//prepare statement
			sql = "SELECT * FROM gwwp.enclosures where Enclosure_ID = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt (1, encID);
			ResultSet rs = pstmt.executeQuery();
			
			Enclosures enclo = null;
			
			while (rs.next()){
				enclo = new Enclosures(rs.getInt("Enclosure_ID"),
						rs.getString("Enclosure_Type"),
						rs.getString("Location"));
			}
			return enclo;
		}
	
	
}
