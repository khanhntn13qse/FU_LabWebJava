/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import config.Config;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.DigitalNews;
import service.DigitalNewsService;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "SearchController", urlPatterns = {"/search"})
public class SearchController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            DigitalNewsService service = new DigitalNewsService();
            DigitalNews mostNews = service.getMostNews();
            List<DigitalNews> top5Next = service.getTop5Next();
            
            request.setAttribute("mostNews", mostNews);
            request.setAttribute("top5Next", top5Next);
            
            String text = request.getParameter("searchPattern");
            if(text == null || text.trim().equals("")){
                request.setAttribute("errorMessage", "Not search with empty patterm.");
                request.getRequestDispatcher("SearchResult.jsp").forward(request, response);
            }
            
            int index = 1;
            try{
                index = Integer.parseInt(request.getParameter("index"));
            }catch(Exception e){
                index = 1;
            }
           
            int countResult = service.countSearchResult(text);
            int pageNumber = countResult/ Config.PAGE_SIZE ;
            if(countResult % Config.PAGE_SIZE != 0){
                pageNumber ++;
            }
            
            List<DigitalNews> list = service.searchWithPaging(text, index, Config.PAGE_SIZE);
         
            request.setAttribute("pageNumber", pageNumber);
            request.setAttribute("searchPattern", text);
            request.setAttribute("resultSearch", list);
            request.getRequestDispatcher("SearchResult.jsp").forward(request, response);
        }catch (Exception e){
            request.setAttribute("errorMessage", e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
