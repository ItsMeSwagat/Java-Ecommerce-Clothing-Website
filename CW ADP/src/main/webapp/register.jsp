<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.Connection" %>
<%@ page import="com.register.DbConnection" %>
<%@ page import="java.sql.PreparedStatement" %>

    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RegisterJSP</title>

</head>
<body>
	<jsp:useBean id="register" class="com.register.register" scope="page"/>
	<jsp:setProperty property = "*" name = "register"/>  
	
	<%
		Connection con = DbConnection.getConnection();
		String query = "Insert into coursework(email, password, name, address, phonenumber, image)"
						+ "values(?,?,?,?,?,?)";
		
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, register.getEmail());
		st.setString(2, register.getPassword());
		st.setString(3, register.getName());
		st.setString(4, register.getAddress());
		st.setString(5, register.getPhonenumber());
		st.setString(6, register.getImage());
		int result = st.executeUpdate();
		
		
	%>
	
</body>
</html>