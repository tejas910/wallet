<%-- 
    Document   : Register
    Created on : Aug 17, 2022, 8:02:43 AM
    Author     : Tejas
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
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
        <title>Wallet Register</title>
        <style>
            .container{
                margin-top: 50px;  
            }
            
        </style>
    </head>
    <body>
                <jsp:include page="Navbar.jsp" />
<div class="container">
  <h2>Registration form</h2>
  <form action="<%= request.getContextPath() %>//UserServlet" method="post">
    <div class="form-group">
      <label for="acc">Account No</label>
      <input type="number" required="" class="form-control" id="accno" placeholder="Enter Account Number" name="accno">
    </div>  
      <div class="form-group">
      <label for="name">Name</label>
      <input type="text" class="form-control" required="" id="name" placeholder="Enter Name" name="name">
    </div>  
    <div class="form-group">
      <label for="uname">Username</label>
      <input type="text" class="form-control" id="email" required="" placeholder="Enter Username" name="uname">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" required="" placeholder="Enter Password" name="pass">
    </div>  
        <div class="form-group">
      <label for="bal">Balance</label>
      <input type="number" class="form-control" id="bal" required="" placeholder="Enter Minimum Balance 500" name="balance">
    </div>  
        <div class="note">
    <label>Note: If you already register do login.</label>
  </div>
    <button type="submit" class="btn btn-success">Submit</button>
  </form>
</div>
    </body>
</html>
