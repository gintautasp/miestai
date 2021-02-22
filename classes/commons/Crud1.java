
	package commons;
	
	import java.sql.DriverManager;
	import java.sql.ResultSet;
	import java.sql.Statement;
	import java.sql.Connection;

	public class Crud1 {
		
		public String[] lent_lauk;
		public String name_db;
		public String passwd;
		public String serv; 
		public String lent;
		public String user;
		
		private Connection connection = null;
		private Statement statement_take = null;
		private Statement statement_change = null;
		private ResultSet resultSet = null;
		private int resultSetChange;
	

		public Crud1() {
			
		}
		
		public Crud1 ( String name_database, String user_name, String password, String server, String lentele, String[] lent_laukai ) {
			
			name_db = name_database;
			user = user_name;
			passwd = password;
			serv = server;
			lent = lentele;
			lent_lauk = lent_laukai;
			
			try {
			
				connection = DriverManager.getConnection ( serv + name_db + "?useUnicode=yes&characterEncoding=UTF-8", user, password );
				
			} catch( Exception e ) {
				
			}
		}
		
		public String lentele()  {
			
			String lent = "";
			
			try {
			
				statement_take = connection.createStatement();		
				String sql ="SELECT * FROM `" + lent + "`  WHERE 1";

				resultSet = statement_take.executeQuery( sql );
			 
				while( resultSet.next() ){
					
					
					lent += "<tr>";
					lent += "<td><input type=\"button\" class=\"record_edit\" data-id_miesto=\"\" value=\"&#9998;\"></td>";
		
					for ( int i = 0; i < lent_lauk.length; i++ ) {
				
						lent += "<td>" + resultSet.getString (  lent_lauk [ i ]  ) + "</td>";

					}
					lent += "</tr>";

				}
				
			} catch( Exception e ) {
				
			}				
			return lent;
		}
	}