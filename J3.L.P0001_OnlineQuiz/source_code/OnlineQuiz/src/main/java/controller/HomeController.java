/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import config.Config;
import dao.QuizHistoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class HomeController extends HttpServlet{

    private final String VIEW_PAGE ="/userInfo.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            QuizHistoryDAO quizHistoryDAO = new QuizHistoryDAO();
            String user = (String) request.getSession().getAttribute("user");
            if (user != null) {
                int userType = Integer.parseInt(request.getSession().getAttribute("userType").toString());
                if (userType == 1) {
                    request.setAttribute("quizHistory", quizHistoryDAO.getAllEntry());
                } else {
                    request.setAttribute("quizHistory", quizHistoryDAO.getAllEntryOfUser(user));
                }
            }
           
            
             getServletContext().getRequestDispatcher(this.VIEW_PAGE).forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("errorMessage", ex);
            getServletContext().getRequestDispatcher(Config.ERROR_PAGE)
                    .forward(request, response);
        }
    }

}
