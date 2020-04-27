/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import config.Config;
import entity.Question;
import dao.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class ManageQuizController extends HttpServlet {

    private final String VIEW_PAGE = "/manageQuiz.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        QuestionDAO questionDAO = null;
        int page = (request.getParameter("currentPage") == null) ? 1 : Integer.parseInt(request.getParameter("currentPage"));

        try {
            //Get the question list from database, and add it to request
            questionDAO = new QuestionDAO();
            String req = (String) request.getParameter("del");
            if (req != null) {
                int id = Integer.parseInt(req);
                questionDAO.deleteQueston(id);
            }
            int size = questionDAO.getQuestionSize();
            request.setAttribute("questions", getPage(questionDAO, size, Config.PAGE_SIZE, page));
            request.setAttribute("numOfQuiz", size);
            request.setAttribute("numOfPage", getNumOfPage(size, Config.PAGE_SIZE));
            request.setAttribute("currentPage", page);
            
            getServletContext().getRequestDispatcher(this.VIEW_PAGE).forward(request, response);

        } catch (Exception ex) {
            request.setAttribute("errorMessage", ex);
            getServletContext().getRequestDispatcher(Config.ERROR_PAGE)
                    .forward(request, response);
        }
    }

    private int getNumOfPage(int listSize, int pageSize) {
        return (int) Math.ceil((double) listSize / (double) pageSize);
    }

    private List<Question> getPage(QuestionDAO questionDAO, int listSize, int pageSize, int pageNum) throws Exception {
        int numOfPage = getNumOfPage(listSize, pageSize);

        if (pageNum < 1 || pageNum > numOfPage) {
            pageNum = 1;
        }

        int from = (pageNum - 1) * pageSize + 1;

        int to = pageNum * pageSize;
        return questionDAO.getQuestionsInRange(from, to);
    }
}
