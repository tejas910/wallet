/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.UserDao;
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
public class Withdrawal extends HttpServlet {
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
        int accbal = Integer.parseInt(request.getParameter("withdrawal"));
        int originalbal = Integer.parseInt(request.getParameter("balance"));
        System.out.println(accno+ " "+ accbal+ " "+ originalbal);
        HttpSession session = request.getSession();

        if(accbal>originalbal){
            response.sendRedirect("./views/Main.jsp");
        }else{
        
        int  newbal = originalbal - accbal;
//                System.out.println(newbal);
    String debit = "debit";
        try {
            if(userDao.updateAccBal(accno, newbal, accbal,debit)!=0){

                 session.setAttribute("admin_user", "admin");
//                session.setAttribute("uname", username);
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
}
