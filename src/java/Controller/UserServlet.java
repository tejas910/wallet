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

/**
 *
 * @author Tejas
 */

public class UserServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;
    private UserDao userDao;

  @Override
    public void init() {
        userDao = new UserDao();
    }

  @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int accno = Integer.parseInt(request.getParameter("accno"));
        int bal = Integer.parseInt(request.getParameter("balance"));
        String name = request.getParameter("name");
        String username = request.getParameter("uname");
        String password = request.getParameter("pass");

        User user = new User();
        user.setAcc_no(accno);
        user.setName(name);
        user.setUsername(username);
        user.setPassword(password);
        user.setBalance(bal);

        try {
               userDao.registerEmployee(user);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        response.sendRedirect("./views/Login.jsp");
    }

}
