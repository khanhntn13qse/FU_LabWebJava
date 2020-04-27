/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.QuizHistory;
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
public class QuizHistoryDAO {

    private Connection connection;

    public void addEntry(int id, int numOfQuiz, int correctAnswer) throws Exception {
        PreparedStatement statement = null;
        try {
            connection = new DbContext().getConnection();
            statement = connection.prepareStatement("insert into QuizHistory (studentId, numOfQuiz, correctAnswer) values (?,?,?)");
            statement.setInt(1, id);
            statement.setInt(2, numOfQuiz);
            statement.setInt(3, correctAnswer);
            statement.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            DbContext.closeConnection(connection);
            if ((statement != null) && (!statement.isClosed())) {
                statement.close();
            }
        }
    }

    public List<QuizHistory> getAllEntry() throws Exception {
        List<QuizHistory> history = new ArrayList<>();
        Statement statement = null;
        ResultSet resultSet = null;
        try {

            String sql = "Select QuizHistory.*, Users.username "
                    + "from QuizHistory , Users "
                    + "where QuizHistory.studentId = Users.id";
            connection = new DbContext().getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                history.add(new QuizHistory(resultSet.getInt("id"), resultSet.getString("username"), resultSet.getInt("numOfQuiz"), resultSet.getInt("correctAnswer")));
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
        return history;
    }

    public List<QuizHistory> getAllEntryOfUser(String username) throws Exception {
        List<QuizHistory> history = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = new DbContext().getConnection();
            String sql = "Select QuizHistory.*, Users.username "
                    + "from QuizHistory , Users "
                    + "where QuizHistory.studentId = Users.id and username = ? ";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                history.add(new QuizHistory(resultSet.getInt("id"), resultSet.getString("username"), resultSet.getInt("numOfQuiz"), resultSet.getInt("correctAnswer")));
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            DbContext.closeConnection(connection);
            if ((resultSet != null) && (!resultSet.isClosed())) {
                resultSet.close();
            }
            if ((preparedStatement != null) && (!preparedStatement.isClosed())) {
                preparedStatement.close();
            }
        }
        return history;
    }
}
