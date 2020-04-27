/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.DigitalNewsDAO;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import entity.DigitalNews;

/**
 *
 * @author Administrator
 */
public class DigitalNewsService {
    
    private DigitalNewsDAO digitalNewsDAO;

    public DigitalNewsService() {
        digitalNewsDAO = new DigitalNewsDAO();
    }
    
    public DigitalNews getMostNews() throws Exception{
        return digitalNewsDAO.getMostNew();
    }
    
    public List<DigitalNews> getTop5Next() throws Exception{    
            return digitalNewsDAO.getTop5NextNews();
    }
    
    public int countSearchResult(String text) throws Exception{
         return digitalNewsDAO.countSearchResult(text);
    }
    
    public List<DigitalNews> searchWithPaging(String text, int pageIndex, int pageSize) throws Exception{
        return digitalNewsDAO.search(text, pageIndex, pageSize);
    }
    
    
    public DigitalNews getDigitalNewsById(int id) throws Exception{
        return digitalNewsDAO.getDigitalNewsById(id);
    }
}
