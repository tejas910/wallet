<%-- 
    Document   : Navbar
    Created on : Aug 17, 2022, 8:21:05 AM
    Author     : Tejas
--%>
<%@page import="Dao.UserDao"%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%response.setHeader("Pragma", "no-cache"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

    <%
                            String username = (String)session.getAttribute("uname");
                            UserDao user = new UserDao();

                        %>
<nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Wallet</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="Register.jsp">Register</a></li>
      <li><a href="../views/Login.jsp">Login</a></li>
      <li><a href="Logout.jsp" class="btn btn-outline-danger btn-lg ">Logout</a></li>
    </ul>
  </div>
</nav>
  

</body>
</html>