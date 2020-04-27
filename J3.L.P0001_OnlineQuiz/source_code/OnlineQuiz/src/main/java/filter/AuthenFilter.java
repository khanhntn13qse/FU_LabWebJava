/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import config.Config;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class AuthenFilter implements Filter {

//    private final String LOGIN_URL = "/Login";
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();

        String LOGIN_URL = httpRequest.getContextPath() + "/Login";
        String servletPath = httpRequest.getServletPath();

        System.out.println("servletPath" + servletPath);
        if (servletPath.equals("/Login") || servletPath.equals("/Register")) {
            chain.doFilter(request, response);
            return;
        }
        if (servletPath.endsWith(".css") || servletPath.endsWith(".js") || servletPath.endsWith(".jsp")
                || servletPath.endsWith(".png") || servletPath.endsWith(".jpg") || servletPath.endsWith(".jpeg") || servletPath.endsWith(".gif")) {
            chain.doFilter(request, response);
            return;
        }

        if (session == null) {
            httpResponse.sendRedirect(LOGIN_URL);
            return;
        }
        //Check if user have already logged in or not--------------
        String userName = (String) session.getAttribute("user");

        if (userName == null) {
            httpResponse.sendRedirect(LOGIN_URL);
            return;
        }

        //check only access for teacher----------------------------       
        boolean isOnlyTeacher = false;
        for (String path : Config.ONLY_TEACHER_PATHS) {
            if (servletPath.contains(path)) {
                isOnlyTeacher = true;
                break;
            }
        }

        int userType = -1;
        if (session.getAttribute("userType") != null) {
            userType = (int) session.getAttribute("userType");
        }
        if (isOnlyTeacher && userType != 1) {//userType 1 is teacher
            request.getRequestDispatcher(Config.ACCESS_DENIED_PAGE).include(request, response);
            response.flushBuffer();
            return;
        }

        //Request ok ----------------
        chain.doFilter(httpRequest, httpResponse);
    }

    @Override
    public void destroy() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
