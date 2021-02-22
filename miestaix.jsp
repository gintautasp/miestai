 <!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<style>
			table {
				border-collapse: collapse;
			}
			form {
				float: right;
			}
			input {
				width: 111px;
			}
			th, td {
				padding: 3px 4px;
				border: 1px solid black;
			}
			th {
				background-color: #A52A2A;
			}
			td {
				background-color: #DEB887;			
			}
		</style>
	</head>
<body>

<%@page  language="java" import="commons.Crud1" %>

<%

	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "geo";
	String userId = "root";
	String password = "";
	
	String[] lent_miestu = {  "pav", "skaicius_gyv", "plotas", "platuma", "ilguma", "kodas_salies" };
	String[] lauk_miesto = new String [ lent_miestu.length ];

	Crud1 miestai_crud = new Crud1 ( dbName, userId, password, connectionUrl, "miestai",  lent_miestu );
	
	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}

	try { 
	/*
		connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
		String add; 
		
		if ( ( ( add = request.getParameter("add")  ) != null ) && add.equals ( "papildyti" ) ) {
																																					// Miestai miestas = new Miestai ( lent_miestu );
																																					// miestas.takeFromParams ( request );
			for ( int i = 0; i<lent_miestu.length; i++ ) {
			
				lauk_miesto [ i ] = request.getParameter ( lent_miestu [ i ] );
			}

			String sql_ins = "";
			String comma = "";
			
			for ( int i = 0; i < lent_miestu.length; i++ ) {
			
				sql_ins =  sql_ins + comma  + "'" + lauk_miesto [ i ] + "'";
				comma = ",";																													// sql_ins = sql_ins + "'" + Miestai.value + "'";
			}
			
			sql_ins = 
				"INSERT INTO `miestai`"
				+ " ( `pav`, `skaicius_gyv`, `plotas`, `platuma`, `ilguma`, `kodas_salies` )"
				+ " VALUES ( "			
				+ sql_ins
				+ " )";

			out.println ( sql_ins );

			statement_change = connection.createStatement();
			resultSetChange = statement_change.executeUpdate(sql_ins);			
			
		 } else {
		 
			if ( add != null ) {

				out.println ( add );
			}
		 } 
		
		*/

	} catch ( Exception e ) {
	
		e.printStackTrace();
	}	
%>
<h2 align="center"><strong>Retrieve data from database in jsp</strong></h2>
<form method="post" action="">
	<table>
		<tr>
			<th>Pavadinimas</th>
			<td>
				<input type="text" name="pav" required>
			</td>
			<td rowspan="6">
		</tr>
		<tr>
			<th>Gyv. sk.</th>
			<td>
				<input type="number" name="skaicius_gyv" value="1">
			</td>
		</tr>
		<tr>
			<th>Plotas</th>
			<td>
				<input type="number" name="plotas" value="1">
			</td>
		</tr>
		<tr>
			<th>Platuma</th>
			<td>
				<input type="number" min="-90"  max="90" name="platuma" value="0">
			</td>
		</tr>
		<tr>
			<th>Ilguma</th>
			<td>
				<input type="number" min="0" max="180" name="ilguma" value="0">
			</td>
		</tr>
		<tr>
			<th>Valst.</th>
			<td>			
				<input type="text" name="kodas_salies">
			</td>
		</tr>
		<tr>
			<td colspan="2">
			</td>
			<td>
				<input type="button" name="clear" value="valyti"> 
				<input type="submit" name="add" value="papildyti">
			</td>
		</tr>
	</table>
		<input type="hidden" name="id_miesto" value="0">
</form>
<table align="center">
<tr>
</tr>
<tr>
	<th>id</th>
	<th>Pavadinimas</th>
	<th>Gyv. sk.</th>
	<th>Plotas</th>
	<th>Platuma</th>
	<th>Ilguma</th>
	<th>Valst.</th>
</tr>
<%= miestai_crud.lentele() %>
</table>
</body>