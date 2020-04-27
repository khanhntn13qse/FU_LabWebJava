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
import java.util.Date;
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
public class MakeQuizController extends HttpServlet {

    private String MAKE_VIEW_PAGE = "/makeQuiz/makeQuiz.jsp";
    private String SUCCESS_VIEW_PAGE = "/makeQuiz/quizAdded.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher(this.MAKE_VIEW_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        QuestionDAO questionDAO = null;

        try {
            //Get quiz data posted from makequiz.jsp...
            String answer = "";
            for (int i = 1; i <= 4; i++) {
                if (req.getParameter("ans" + i) != null) {
                    answer += String.valueOf(i);
                }
            }
            Question q = new Question(
                    -1,
                    req.getParameter("content").replaceAll(System.getProperty("line.separator"), "<br>"),
                    answer,
                    new Date()
            );

            q.addOption(req.getParameter(("opt1")));
            q.addOption(req.getParameter(("opt2")));
            q.addOption(req.getParameter(("opt3")));
            q.addOption(req.getParameter(("opt4")));
            req.setAttribute("content", q.getContent());
            req.setAttribute("opt1", q.getOption().get(0));
            req.setAttribute("opt2", q.getOption().get(1));
            req.setAttribute("opt3", q.getOption().get(2));
            req.setAttribute("opt4", q.getOption().get(3));
            req.setAttribute("answer", q.getAnswer());

            int error = 0;
            if (q.getContent().trim().equals("")) {
                error = 1;
                req.setAttribute("message", "Question content cannot be empty");
            } else if (q.getOption().get(0).trim().equals("")) {
                error = 2;
                req.setAttribute("message", "Option 1 content cannot be empty");
            } else if (q.getOption().get(1).trim().equals("")) {
                error = 3;
                req.setAttribute("message", "Option 2 content cannot be empty");
            } else if (q.getOption().get(1).trim().equals("")) {
                error = 4;
                req.setAttribute("message", "Option 3 content cannot be empty");
            } else if (q.getOption().get(1).trim().equals("")) {
                error = 5;
                req.setAttribute("message", "Option 4 content cannot be empty");
            } else if (q.getAnswer().equals("")) {
                error = 6;
                req.setAttribute("message", "Please select answer(s)");
            } else if (q.getAnswer().equals("1234")) {
                error = 7;
                req.setAttribute("message", "Cannot select all answers");
            }

            //input data is valid
            if (error != 0) {
                getServletContext().getRequestDispatcher(this.MAKE_VIEW_PAGE).forward(req, resp);
                return;
            }

            questionDAO = new QuestionDAO();
            questionDAO.addQueston(q);
            getServletContext().getRequestDispatcher(this.SUCCESS_VIEW_PAGE).forward(req, resp);

        } catch (Exception ex) {
            req.setAttribute("errorMessage", ex);
            getServletContext().getRequestDispatcher(Config.ERROR_PAGE)
                    .forward(req, resp);
        }
    }

}
