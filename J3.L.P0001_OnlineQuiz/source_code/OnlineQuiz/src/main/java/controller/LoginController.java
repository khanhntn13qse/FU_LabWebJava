/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import config.Config;
import entity.User;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class LoginController extends HttpServlet {

    private final String VIEW_PAGE = "/loginForm.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher(this.VIEW_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO userDAO = null;
        try {
            userDAO = new UserDAO();
            //Get user data posted from request and call getUserBy function from modek
            String userName = req.getParameter("username");
            String password = req.getParameter("password");
            req.setAttribute("savedUserName", userName);

            User user = userDAO.getUserBy(userName, password);

            //Login successfully, save user data to session
            if (user != null) {
                HttpSession session = req.getSession();
                session.setAttribute("user", user.getUserName());
                session.setAttribute("userId", user.getId());
                session.setAttribute("email", user.getEmail());
                session.setAttribute("userType", user.getType());
                resp.sendRedirect("Index");
                
            } else { //Login failed
                req.setAttribute("message", "fail");
                getServletContext().getRequestDispatcher(this.VIEW_PAGE).forward(req, resp);
            }
        } catch (Exception ex) {
            req.setAttribute("errorMessage", ex);
            getServletContext().getRequestDispatcher(Config.ERROR_PAGE)
                    .forward(req, resp);
        }
    }
}
