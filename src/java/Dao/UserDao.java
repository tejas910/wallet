/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tejas
 */
public class UserDao {
    
    public void registerEmployee(User user) throws ClassNotFoundException, SQLException {
        String INSERT_USERS_SQL = "INSERT INTO register" +
            "  (acc_no,name,username,password,balance) VALUES " +
            " (?, ?, ?, ?, ?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/wallet", "root", "");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setInt(1, user.getAcc_no());
            preparedStatement.setString(2, user.getName());
            preparedStatement.setString(3, user.getUsername());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setInt(5, user.getBalance());
            
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        }
        // process sql exception
        
    }
    
	public boolean validate(String username, String password) throws ClassNotFoundException {
		boolean status = false;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/wallet", "root", "");

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from register where username = ? and password = ? ")) {
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();

		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		return status;
	}
        	public int getAccountNo(String username) throws ClassNotFoundException {
		int accno = 0;
		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/wallet", "root", "");

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("select acc_no,name,username from register where username = ?")) {
			preparedStatement.setString(1, username);

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                accno = rs.getInt("acc_no"); 
                    
            }
		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		return accno;
	}

public int getAccbal(int accno) throws ClassNotFoundException {
		int accbal = 0;
		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/wallet", "root", "");

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("select balance from register where acc_no = ?")) {
			preparedStatement.setInt(1, accno);

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                accbal = rs.getInt("balance"); 
                    
            }
		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		return accbal;
	}

public int updateAccBal(int accno,int bal,int debitamount,String action) throws ClassNotFoundException {
	boolean status = false;
        int rs = 0;
	Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/wallet", "root", "");

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("update register set balance = ? where acc_no = ?")) {
			preparedStatement.setInt(1, bal);
                        preparedStatement.setInt(2, accno);

			System.out.println(preparedStatement);
			rs = preparedStatement.executeUpdate();
                        insertHistory(accno, bal, debitamount, action);

		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		return rs;
	}
       public  void insertHistory(int accno, int bal, int amount, String action) throws ClassNotFoundException{
                   int rs = 0;
                     String INSERT_USERS_SQL = "INSERT INTO history" +
            "  (accno,balance,debit,action,time) VALUES " +
            " (?, ?, ?, ?, CURRENT_TIMESTAMP);";

        	Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/wallet", "root", "");

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setInt(1, accno);
                        preparedStatement.setInt(2, bal);
                        preparedStatement.setInt(3, amount);
                        preparedStatement.setString(4, action);

			System.out.println(preparedStatement);
			rs = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
                
       }
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
