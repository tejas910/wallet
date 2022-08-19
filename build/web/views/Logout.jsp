<%-- 
    Document   : Logout
    Created on : Aug 17, 2022, 12:32:07 PM
    Author     : Tejas
--%>
<%            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logout</title>
    </head>
    <body>
        <%

                     
            

            session.removeAttribute("uname"); 
   
            response.sendRedirect("Login.jsp");
        %>
    </body>
</html>
