package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csm.DBManager;
import com.csm.entity.Keepers;
import com.csm.entity.Species;


public class KeepersManager {
	
	//insert
	public int insert (Keepers k)throws ClassNotFoundException, SQLException{
		int result = -1;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		String sql = "insert into gwwp.Keepers(Keeper_Name,Birthday,keeper_Rank) values(?,?,?)";
	

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		//first and second parameters inserted 1. type and location
		pstmt.setString(1, k.getKeeper_Name());
		pstmt.setDate(2, k.getBirthday());
		pstmt.setString(3, k.getKeeper_Rank());
		
				
		//3. execute statement
		result = pstmt.executeUpdate();
		
		return result;
	}	 
	
	 //select
	public ArrayList<Keepers>fetchAll() throws ClassNotFoundException, SQLException{
		
		ArrayList<Keepers> keeper = new ArrayList<Keepers>();
		
		Keepers k;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//query
		String sql = "select * from gwwp.keepers";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()){
			k = new Keepers(	rs.getInt("Keeper_ID"),
					rs.getString("Keeper_Name"),
					rs.getDate("Birthday"),
					rs.getString("keeper_Rank"));
					
			keeper.add(k);
		}
		return keeper;
	}
	
	
	//delete
	public int delete (int KeeperID) throws ClassNotFoundException,
	SQLException{
		int result = -1;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		String sql = "DELETE FROM gwwp.keepers where Keeper_ID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, KeeperID);
		
		//execute statement
		result = pstmt.executeUpdate();
		return result;
	}
	
	
	//update
	
			public int update(Keepers k)throws ClassNotFoundException,
			SQLException{
				
				int result = -1;
				
				//get connection
				DBManager dbMgr = new DBManager();
				Connection conn = dbMgr.getConnection();
				
				//prepare statement
				String sql = "UPDATE gwwp.keepers set Keeper_Name = ?,"+
				" Birthday = ?, keeper_Rank = ? where Keeper_ID = ?";
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				
				pstmt.setString(1, k.getKeeper_Name());
				pstmt.setDate(2, k.getBirthday());
				pstmt.setString(3, k.getKeeper_Rank());
				pstmt.setInt(4, k.getKeeper_ID());
				
				
				//execute statement
				result = pstmt.executeUpdate();
				return result;
			}
			

		//getting Diet id
			
			public Keepers getById (int keeperID) throws ClassNotFoundException,SQLException{
				String sql;
				DBManager dbMgr = new DBManager();
				Connection conn = dbMgr.getConnection();
				
				//prepare statement
				sql = "SELECT * FROM gwwp.keepers where Keeper_ID = ?";
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt (1, keeperID);
				ResultSet rs = pstmt.executeQuery();
				
				Keepers keeper = null;
				
				while (rs.next()){
					keeper = new Keepers(rs.getInt("Keeper_ID"),
							rs.getString("Keeper_Name"),
							rs.getDate("Birthday"),
							rs.getString("keeper_Rank"));
				}
				return keeper;
			}

	
}
