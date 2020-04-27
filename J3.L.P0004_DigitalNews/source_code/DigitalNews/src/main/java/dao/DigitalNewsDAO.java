/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import config.Config;
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import entity.DigitalNews;

/**
 *
 * @author Administrator
 */
public class DigitalNewsDAO {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public DigitalNewsDAO() {
    }
    
    public DigitalNews getMostNew() throws Exception{
        String query = "select top(1) * from digitalnews order by posttime desc";
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        resultSet = preparedStatement.executeQuery();
        while(resultSet.next()){
            DigitalNews digitalNews = new DigitalNews(
                    resultSet.getInt("id"),
                    resultSet.getString("title"),
                    resultSet.getString("description"),
                    Config.IMAGE_FOLDER + resultSet.getString("image"),
                    resultSet.getString("author"),
                    resultSet.getDate("posttime"),
                    resultSet.getString("short_des"));
            return digitalNews;
        }
        return null;
    }
    
    public List<DigitalNews> getTop5NextNews() throws Exception{
        String query = "select top(5) * from digitalnews "
                + "where posttime not in (select max(posttime) from digitalnews) "
                + "order by posttime desc";
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        resultSet = preparedStatement.executeQuery();
        
        List<DigitalNews> list = new ArrayList<>();
        while(resultSet.next()){
            DigitalNews digitalNews = new DigitalNews(
                    resultSet.getInt("id"),
                    resultSet.getString("title"),
                    resultSet.getString("description"),
                    Config.IMAGE_FOLDER + resultSet.getString("image"),
                    resultSet.getString("author"),
                    resultSet.getDate("posttime"),
                    resultSet.getString("short_des"));
            list.add(digitalNews);
        }   
        return list;
    }
    
    public int countSearchResult(String txt) throws Exception{
        String query = "select count (*) from digitalnews where title like ?";
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1,"%"+ txt+"%");
        resultSet = preparedStatement.executeQuery();
        
        if(resultSet.next()){
            int count = resultSet.getInt(1);
            return count;
        }   
        return 0;
    }
    
    public List<DigitalNews> search(String txt, int pageIndex, int pageSize) throws Exception{
        String query = "select * from (select ROW_NUMBER() over (order by id ASC) as orderNum, * from digitalnews where title like ?) as temp "
                + "where orderNum between ? and ? ";
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, "%" + txt + "%");
        preparedStatement.setInt(2,(pageIndex - 1) * pageSize + 1);
        preparedStatement.setInt(3, pageIndex * pageSize);
        resultSet = preparedStatement.executeQuery();
        
        List<DigitalNews> list = new ArrayList<>();
        while(resultSet.next()){
            DigitalNews digitalNews = new DigitalNews(
                    resultSet.getInt("id"),
                    resultSet.getString("title"),
                    resultSet.getString("description"),
                    Config.IMAGE_FOLDER + resultSet.getString("image"),
                    resultSet.getString("author"),
                    resultSet.getDate("posttime"),
                    resultSet.getString("short_des"));
            list.add(digitalNews);
        }   
        return list;
    }
    
     public DigitalNews getDigitalNewsById(int id) throws Exception{
        String query = "select * from digitalnews where id = ?";
        
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, id);
        resultSet = preparedStatement.executeQuery();
        
        while(resultSet.next()){
            DigitalNews digitalNews = new DigitalNews(
                    resultSet.getInt("id"),
                    resultSet.getString("title"),
                    resultSet.getString("description"),
                    Config.IMAGE_FOLDER + resultSet.getString("image"),
                    resultSet.getString("author"),
                    resultSet.getDate("posttime"),
                    resultSet.getString("short_des"));
            return digitalNews;
        }
        return null;
    }
    
           
}
