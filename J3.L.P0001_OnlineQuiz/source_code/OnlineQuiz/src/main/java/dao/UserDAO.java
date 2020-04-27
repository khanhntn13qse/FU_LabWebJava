/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.User;
import context.DbContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class UserDAO {
    private Connection connection;

    public UserDAO() {
    }

    public User getUserBy(String userName, String password) throws Exception {
        User returnValue = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = new DbContext().getConnection();
            statement = connection.prepareStatement("select * from Users where username=? and password=?");
            statement.setString(1, userName);
            statement.setString(2, password);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                returnValue = new User(resultSet.getInt("id"), resultSet.getString("username"), resultSet.getString("password"), resultSet.getString("email"), resultSet.getInt("type"));
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            DbContext.closeConnection(connection);
            if ((resultSet != null) && (!resultSet.isClosed())) {
                resultSet.close();
            }
            if ((statement != null) && (!statement.isClosed())) {
                statement.close();
            }
        }
        return returnValue;
    }

    public int validateNewUser(User user) throws Exception {
        int returnValue = 0;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = new DbContext().getConnection();
            statement = connection.prepareCall("select * from Users where username=? or email=?");
            statement.setString(1, user.getUserName());
            statement.setString(2, user.getEmail());
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                if (resultSet.getString("username").equals(user.getUserName())) {
                    returnValue = 1;
                    break;
                }
                if (resultSet.getString("email").equals(user.getEmail())) {
                    returnValue = 2;
                    break;
                }
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            DbContext.closeConnection(connection);
            if ((resultSet != null) && (!resultSet.isClosed())) {
                resultSet.close();
            }
            if ((statement != null) && (!statement.isClosed())) {
                statement.close();
            }
        }
        return returnValue;
    }

    public void addUser(User newUser) throws Exception {
        PreparedStatement ps = null;
        try {
            connection = new DbContext().getConnection();
            String query = "Insert into Users (username,password,email,type) values(?,?,?,?)";
            ps = connection.prepareStatement(query);
            ps.setString(1, newUser.getUserName());
            ps.setString(2, newUser.getPassword());
            ps.setString(3, newUser.getEmail());
            ps.setInt(4, newUser.getType());
            ps.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            DbContext.closeConnection(connection);
            if ((ps != null) && (!ps.isClosed())) {
                ps.close();
            }
        }
    }
}
