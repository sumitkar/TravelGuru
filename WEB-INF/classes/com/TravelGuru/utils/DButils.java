package com.TravelGuru.utils;
import java.sql.*;
public class DButils {
	static Connection con = null;
	static Statement st = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	
	public static Connection getConnected(){
		String user = "adminy7Bug1f";
		String pass = "pfjbLUXIddwJ";
		String url = "jdbc:mysql://127.3.185.2:3306/travelguru";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, user, pass);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch(SQLException e){
			e.printStackTrace();
		}
		
		return con;
	}
	
	public static Statement getStatement(){
		try {
			con.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return st;
	}
	
	public static PreparedStatement getPreparedStatement(String sql){
		
		try {
			pst = con.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return pst;
	}
	
	public static void releaseResources(){
		try{
			if(rs != null)
				rs.close();
			if(pst != null)
				pst.close();
			if(st != null)
				st.close();
			if(con != null)
				con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
}
