<%-- 
    Document   : Credit
    Created on : Aug 17, 2022, 10:00:51 PM
    Author     : Tejas
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="Dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Credit</title>
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
  <h2>Credit form</h2>
  <form  action="<%= request.getContextPath() %>/Deposit" method="post">
    
    <div class="form-group">
      <label for="accno">Account Number</label>
      <input type="number" class="form-control" readonly="" id="accno" value="<%=accno%>" name="accno">
    </div>
    <div class="note">
    <label>Note: Deposit Money.</label>
  </div>
    <div class="form-group">
      <label for="deposit">Money Deposit</label>
      <input type="number" class="form-control" id="pwd" placeholder="Enter Money to Deposit" name="deposit">
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
