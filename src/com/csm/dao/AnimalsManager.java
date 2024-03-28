package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csm.DBManager;
import com.csm.entity.Animals;
import com.csm.entity.Species;


public class AnimalsManager {
	
	//insert
	public int insert (Animals a)throws ClassNotFoundException, SQLException{
		int result = -1;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		String sql = "insert into gwwp.Animals(Animal_Name,Gender,Arrival_Year,"+
		"Species_Species_ID,Enclosures_Enclosure_ID,Keepers_Keeper_ID,Diet_Diet_ID) values(?,?,?,?,?,?,?)";
	
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, a.getAnimal_Name());
		pstmt.setString(2, a.getGender());
		pstmt.setInt(3, a.getArrival_Year());
		pstmt.setInt(4, a.getSpecies_Species_ID());
		pstmt.setInt(5, a.getEnclosures_Enclosure_ID());
		pstmt.setInt(6, a.getKeepers_Keeper_ID());
		pstmt.setInt(7, a.getDiet_Diet_ID());
		
				
		//3. execute statement
		result = pstmt.executeUpdate();
		
		return result;
	}	 
	
	
	 //select
	public ArrayList<Animals>fetchAll() throws ClassNotFoundException, SQLException{
		
		ArrayList<Animals> animal = new ArrayList<Animals>();
		
		Animals a;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//query
		String sql = "select * from gwwp.animals";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()){
			a = new Animals(	rs.getInt("Animal_ID"),
					rs.getString("Animal_Name"),
					rs.getString("Gender"),
					rs.getInt("Arrival_Year"),
					rs.getInt("Species_Species_ID"),
					rs.getInt("Enclosures_Enclosure_ID"),
					rs.getInt("Keepers_Keeper_ID"),
					rs.getInt("Diet_Diet_ID"));
					
			animal.add(a);
		}
		return animal;
	}
	
	//delete
		public int delete (int AnimalID) throws ClassNotFoundException,
		SQLException{
			int result = -1;
			
			//get connection
			DBManager dbMgr = new DBManager();
			Connection conn = dbMgr.getConnection();
			
			//prepare statement
			String sql = "DELETE FROM gwwp.animals where Animal_ID=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, AnimalID);
			
			//execute statement
			result = pstmt.executeUpdate();
			return result;
		}
		
		
		//Report 1
		
		public ArrayList<Animals> fetchDaveorTemi()throws ClassNotFoundException, SQLException{ //select all
			ArrayList<Animals> animal = new ArrayList<Animals>();
			
			Animals animalInfo;
			// get connection
			DBManager dbMgr = new DBManager();
			Connection conn = dbMgr.getConnection();

			// query
			String sql = "SELECT * FROM gwwp.keepersort;";  //calling report 
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				animalInfo = new Animals(
						rs.getInt("A_ID"),
						rs.getString("A_Name"),
						rs.getString("A_Gender"),
						rs.getInt("A_Arrival"),
						rs.getInt("K_ID"),
						rs.getString("K_Name"));
				
				animal.add(animalInfo); //add entity into collection to arraylist
			}
			return animal;
		}
		
		
		//Report 2

		public ArrayList<Animals> fetchAnimalGroupByKeeper()throws ClassNotFoundException, SQLException{ //select all
			ArrayList<Animals> animals = new ArrayList<Animals>();
			Animals animalinfobykeeper;
			// get connection
			DBManager dbMgr = new DBManager();
			Connection conn = dbMgr.getConnection();

			// query
			String sql = " select Keeper_Name, count(Animal_ID) as Total_Animals "+
			"from gwwp.Animals inner join gwwp.Keepers "+
			"on Animals.Keepers_Keeper_ID = gwwp.Keepers.Keeper_ID "+
			"group by gwwp.Keepers.Keeper_Name; " ;
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();


			while (rs.next()) {
				animalinfobykeeper = new Animals(
						
						rs.getString("Keeper_Name"),
						rs.getInt("Total_Animals"));
						
				animals.add(animalinfobykeeper); //add entity into collection to arraylist
			}

			return animals;

		}	
		
		
		//update
		
				public int update(Animals a)throws ClassNotFoundException,
				SQLException{
					
					int result = -1;
					
					//get connection
					DBManager dbMgr = new DBManager();
					Connection conn = dbMgr.getConnection();
					
					//prepare statement
					String sql = "UPDATE gwwp.animals set Animal_Name = ?,"+
					"Gender = ?, Arrival_Year = ?,"+
					"Species_Species_ID = ?, Enclosures_Enclosure_ID = ?,"+
					"Keepers_Keeper_ID = ?, Diet_Diet_ID = ? "+
					" where Animal_ID = ?";
					
					PreparedStatement pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, a.getAnimal_Name());
					pstmt.setString(2, a.getGender());
					pstmt.setInt(3, a.getArrival_Year());
					pstmt.setInt(4, a.getSpecies_Species_ID());
					pstmt.setInt(5, a.getEnclosures_Enclosure_ID());
					pstmt.setInt(6, a.getKeepers_Keeper_ID());
					pstmt.setInt(7, a.getDiet_Diet_ID());
					pstmt.setInt(8, a.getAnimal_ID());
					
					//execute statement
					result = pstmt.executeUpdate();
					return result;
				}
				

			//getting Diet id
				
				public Animals getById (int aniID) throws ClassNotFoundException,SQLException{
					String sql;
					DBManager dbMgr = new DBManager();
					Connection conn = dbMgr.getConnection();
					
					//prepare statement
					sql = "SELECT * FROM gwwp.animals where Animal_ID = ?";
					
					PreparedStatement pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt (1, aniID);
					ResultSet rs = pstmt.executeQuery();
					
					Animals animal = null;
					
					while (rs.next()){
						animal = new Animals(rs.getInt("Animal_ID"),
								rs.getString("Animal_Name"),
								rs.getString("Gender"),
								rs.getInt("Arrival_Year"),
								rs.getInt("Species_Species_ID"),
								rs.getInt("Enclosures_Enclosure_ID"),
								rs.getInt("Keepers_Keeper_ID"),
								rs.getInt("Diet_Diet_ID"));
					}
					return animal;
				}



	
}

