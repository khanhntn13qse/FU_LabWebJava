/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import config.Config;
import entity.Question;
import dao.QuestionDAO;
import dao.QuizHistoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
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
public class TakeQuizController extends HttpServlet {

    private final String PRE_PAGE = "/takeQuiz/quizPrepare.jsp";
    private final String QUIZ_PAGE = "/takeQuiz/quizPage.jsp";
    private final String RESULT_PAGE = "/takeQuiz/quizResult.jsp";

    private QuestionDAO questionDAO = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            questionDAO = new QuestionDAO();
            request.setAttribute("maxQuiz", questionDAO.getQuestionSize());
            getServletContext().getRequestDispatcher(this.PRE_PAGE)
                    .forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("errorMessage", ex);
            getServletContext().getRequestDispatcher(Config.ERROR_PAGE)
                    .forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String request = req.getParameter("req");
            questionDAO = new QuestionDAO();

            if (request.equals("quizReq")) {
                questionRequest(req, resp);
            } else if (request.equals("quizResult")) {
                questionResult(req, resp);
            }
            
            req.setAttribute("errorMessage", "Not found request");
            getServletContext().getRequestDispatcher(Config.ERROR_PAGE)
                    .forward(req, resp);

        } catch (Exception ex) {
            req.setAttribute("errorMessage", ex);
            getServletContext().getRequestDispatcher(Config.ERROR_PAGE)
                    .forward(req, resp);
        }
    }

    public void questionRequest(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int numOfQuiz = Integer.parseInt(req.getParameter("numOfQuiz"));
        req.setAttribute("savedNumOfQuiz", numOfQuiz);

        int maxQuiz = questionDAO.getQuestionSize();

        if (numOfQuiz > 0 && numOfQuiz <= maxQuiz) {
            List<Question> returnQuestion = questionDAO.getRandomQuestions(numOfQuiz);

            req.setAttribute("questions", returnQuestion);
            getServletContext().getRequestDispatcher(this.QUIZ_PAGE)
                    .forward(req, resp);
        } else {
            if ((numOfQuiz <= 0)) {
                req.setAttribute("message", "Error! Quiz number must be larger than 0");

            } else if (numOfQuiz > maxQuiz) {
                req.setAttribute("message", "Error! There is not enough quiz to take");
            }

            req.setAttribute("maxQuiz", maxQuiz);
            getServletContext().getRequestDispatcher(this.PRE_PAGE)
                    .forward(req, resp);
        }
    }

    public void questionResult(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // Ftontend question orgnization:
        // Each question is display in a div, marked by order
        // In each div, there is a hidden input, mapping quetin order nd its id
        // Each question has 4 answer, each answer is a checkbox
        // Checkbox's name is: ans + {question order}-{answer order}
        int numOfQuiz = Integer.parseInt(req.getParameter("numOfQuiz"));
        double mark = 0;

        for (int i = 0; i < numOfQuiz; i++) {
            int id = Integer.parseInt(req.getParameter("q" + String.valueOf(i)));
            Question question = questionDAO.findQuestionById(id);

            //answer of user---------------------
            String answer = "";
            for (int j = 0; j < 4; j++) {   //4 is number of opt
                String answerId = "ans" + String.valueOf(i) + "-" + String.valueOf(j);
                if (req.getParameter(answerId) != null) {
                    answer += String.valueOf(j + 1);
                }
            }
            System.out.println("answer: " + answer);
            
            //check answer------- 
            if (question.getAnswer().equals(answer)) {
                mark++;
            }
        }

        QuizHistoryDAO qhm = new QuizHistoryDAO();
        int userId = Integer.parseInt(req.getSession().getAttribute("userId").toString());
        qhm.addEntry(userId, numOfQuiz, (int) mark);

        mark = (mark / (double) numOfQuiz) * 10;

        req.setAttribute("numOfQuiz", numOfQuiz);
        req.setAttribute("mark", mark);

        getServletContext().getRequestDispatcher(this.RESULT_PAGE)
                .forward(req, resp);
    }
}
