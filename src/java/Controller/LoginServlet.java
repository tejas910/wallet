/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.UserDao;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tejas
 */
public class LoginServlet extends HttpServlet {
          private static final long serialVersionUID = 1L;
    private UserDao userDao;

  @Override
    public void init() {
        userDao = new UserDao();
    }

  @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("uname");
        String password = request.getParameter("pass"); 
                HttpSession session = request.getSession();        
        
        
        try {
            if(userDao.validate(username, password)){
                session.setAttribute("admin_user", "admin");
                session.setAttribute("uname", username);
                response.sendRedirect("./views/Main.jsp");                
            }
            else{
        response.sendRedirect("./views/Error.jsp");                
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


    }
}
