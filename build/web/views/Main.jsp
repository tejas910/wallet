<%-- 
    Document   : Main
    Created on : Aug 17, 2022, 12:09:23 PM
    Author     : Tejas
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
       
        <title>Wallet Main</title>
    </head>
    <body>
        <%!String username; %>
        <%

            username = ((String) session.getAttribute("uname"));
            try {
                if (!username.equals(null)) {

        %>

        
                        <jsp:include page="MainNavbar.jsp" />
                        <%

                            UserDao user = new UserDao();
                            int accno = user.getAccountNo(username);
                            int bal =user.getAccbal(accno);
                            
                               

                        %>

                        
<div class="container">
  <h2>Debit form</h2>
  <form  action="<%= request.getContextPath() %>/Withdrawal" method="post">
    
    <div class="form-group">
      <label for="accno">Account Number</label>
      <input type="number" class="form-control" readonly="" id="accno" value="<%=accno%>" name="accno">
    </div>
    <div class="note">
    <label>Note: Whole amount can't be withdrawal.</label>
  </div>
    <div class="form-group">
      <label for="withdrawal">Money Withdrawal</label>
      <input type="number" required=" "  class="form-control" id="pwd" placeholder="Enter Money to withdrawal" name="withdrawal">
    </div>  
    <input type ='number' hidden="" value="<%=bal%>"name='balance'>
    <button type="submit" class="btn btn-success">Submit</button>
  </form>
</div>
                        <%                }
            } catch (Exception e) {
                response.sendRedirect("Login.jsp");
            }
        %>
        
    </body>
</html>
