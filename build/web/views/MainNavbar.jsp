<%-- 
    Document   : MainNavbar
    Created on : Aug 17, 2022, 9:34:04 PM
    Author     : Tejas
--%>
<%@page import="Dao.UserDao"%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Main Navbar</title>
    </head>
    <body>
 
            <%
                            String username = (String)session.getAttribute("uname");
                            UserDao user = new UserDao();
                            int accno = user.getAccountNo(username);
                            int bal = user.getAccbal(accno);
                        %>
<nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Wallet</a>
    </div>
    <ul class="nav navbar-nav">
        <li class="active"><a href="Main.jsp">Home</a></li>
      <li class="active"><a href="History.jsp">History</a></li>
      <li><a href="Credit.jsp">Credit</a></li>
      <li><a href="Logout.jsp" class="btn btn-outline-danger btn-lg ">Logout</a></li>
      <!--<li><a href="" class="btn btn-outline-danger btn-lg "></a></li>-->
      
    </ul>
      <span class="navbar-text" style="position: absolute; right: 150px;">
          <span style="font-size: 18px;"><b>Username</b></span>&nbsp;&nbsp; <%= username%>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 18px;"><b>Balance</b></span> &nbsp;&nbsp; <%=bal%>
    </span>
  </div>
</nav>
     
    </body>
</html>
