/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

/**
 *
 * @author Administrator
 */
public class Config {
    public static final int PAGE_SIZE = 4;
    public static final String ERROR_PAGE = "/errorPage/errorPage.jsp";
    public static final String ACCESS_DENIED_PAGE = "/errorPage/accessDenied.jsp";
    public static final String[] ONLY_TEACHER_PATHS = {"/MakeQuiz", "/ManageQuiz"};
}
