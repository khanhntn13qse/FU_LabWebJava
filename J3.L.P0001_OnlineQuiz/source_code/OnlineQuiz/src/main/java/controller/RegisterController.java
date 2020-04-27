/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.User;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class RegisterController extends HttpServlet {

    private final String VIEW_PAGE = "/registerForm.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // This function is accessible to all user
        // even if user have logged in or not
        getServletContext().getRequestDispatcher(this.VIEW_PAGE)
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message = "";
        boolean success = false;

        UserDAO userDAO = null;
        try {
            userDAO = new UserDAO();
            //Get user data from request-------------------
            String userNane = req.getParameter("username");
            String password = req.getParameter("password");
            String type = req.getParameter("type");
            String email = req.getParameter("email");

            req.setAttribute("savedUserName", userNane);
            req.setAttribute("savedEmail", email);
            req.setAttribute("savedType", Integer.parseInt(type));

            //Data validation-------------------
            if (userNane.trim().equals("") || userNane.trim().length() < 6 || userNane.trim().length() > 50) {
                message = "Username must have 6-50 characters.";
            } else if (password.trim().equals("") || password.trim().length() < 6 || password.trim().length() > 50) {
                message = "Password must have 6-50 characters.";
            } else if (email.trim().equals("") || email.trim().length() > 50) {
                message = "Email must have 6-50 characters.";

            } else if (!isValidEmail(email)) {
                message = "Email invalid form.";
            } else {
                User newUser = new User(userNane, password, email, Integer.parseInt(type));

                int errorCode = userDAO.validateNewUser(newUser);
                if (errorCode == 1) {
                    message = "Username is already exist";
                } else if (errorCode == 2) {
                    message = "Email is already exist";
                } else { //If no error found, add user to database
                    userDAO.addUser(newUser);
                    message = "User registered successwfully";
                    success = true;
                }
            }

            req.setAttribute("message", message);
            req.setAttribute("success", success);
            getServletContext().getRequestDispatcher(this.VIEW_PAGE).forward(req, resp);

        } catch (Exception ex) {
            req.setAttribute("errorMessage", ex);
            getServletContext().getRequestDispatcher("/errorPage/errorPage.jsp")
                    .forward(req, resp);
        }
    }

    public static boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."
                + "[a-zA-Z0-9_+&*-]+)*@"
                + "(?:[a-zA-Z0-9-]+\\.)+[a-z"
                + "A-Z]{2,7}$";

        Pattern pat = Pattern.compile(emailRegex);
        if (email == null) {
            return false;
        }
        return pat.matcher(email).matches();
    }
}
