package ConnectionDB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private final String userID = "sa";
	private final String passWord = "123";
	private final String url="jdbc:sqlserver://localhost:1433;databaseName=ShopBanHang;user="+userID+";password="+passWord;
	
	public Connection getConnection() throws Exception
	{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url);
		
	}

	

//	private final String serverName = "LAPTOP-GVLIVMHA\\SQLEXPRESS";
////	private final String serverName = "DESKTOP-8M00BBB";
//	private final String dbName = "ShopBanHang";
//	private final String portNumber = "1433";
//	private final String instance = "";// MSSQLSERVER LEAVE THIS ONE 
//	//	EMPTY IF YOUR SQL IS A SINGLE INSTANCE
//
//	public Connection getConnection() throws Exception {
//		String url = "jdbc:sqlserver://" + serverName + ":" + portNumber
//				+ "\\" + instance + ";integratedSecurity=true;databaseName=" + 
//				dbName;
//				if (instance == null || instance.trim().isEmpty())
//				url = "jdbc:sqlserver://" + serverName + ":" + portNumber + 
//				";integratedSecurity=true;databaseName=" + dbName;
//
//		//DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
//		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//		return DriverManager.getConnection(url);
//	}
////
//	public static void main(String[] args)
//	{
//		try
//		{
//			System.out.println(new DBConnection().getConnection());
//		} catch (Exception e)
//		{
//			e.printStackTrace();
//			System.out.println("Fail");
//		}
	
}
