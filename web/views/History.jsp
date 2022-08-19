<%-- 
    Document   : History
    Created on : Aug 17, 2022, 10:01:37 PM
    Author     : Tejas
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="java.sql.SQLException"%>
<%@page import="Dao.UserDao"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     
        <title>History</title>
        <style>
            
            table{
                margin: 60px 60px 60px 60px;

            }
            
        </style>
    </head>
    <body>
                <%!String username; %>
        <%

            username = ((String) session.getAttribute("uname"));
            try {
                if (!username.equals(null)) {

        %>

        <jsp:include page="MainNavbar.jsp" />
            <table class="table table-striped table-dark m-5">
  <thead>
    <tr>
      <th scope="col">Account Number</th>
      <th scope="col">Balance</th>
      <th scope="col">Amount</th>
      <th scope="col">Action</th>
      <th scope="col">Time</th>
      
    </tr>
  </thead>
  
  <tbody>
      <%
                            UserDao user = new UserDao();
                            int acc_no = user.getAccountNo(username);
                    
                	Class.forName("com.mysql.jdbc.Driver");

		Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/wallet", "root", "");

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement("select accno,balance,debit,action,time from history where accno = ? "); 
			preparedStatement.setInt(1, acc_no);

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
                        while (rs.next()) {

                    System.out.println(rs.getInt("accno"));
            
        
        %>        

    <tr>
        <th scope="row"><%=rs.getInt("accno")%></th>
      <td><%= rs.getInt("balance")%></td>
      <td><%=rs.getInt("debit") %></td>
      <td><%=rs.getString("action") %></td>
      <td><%=rs.getString("time") %></td>
    </tr>
    <%
        }

	
    %>

  </tbody>
</table>
                 <%                }
            } catch (Exception e) {
                response.sendRedirect("Login.jsp");
            }
        %>
    </body>
</html>
