/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Question;
import context.DbContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

/**
 *
 * @author Administrator
 */
public class QuestionDAO {

    private Connection connection;

    public QuestionDAO() {
    }

    public QuestionDAO(Connection connection, SimpleDateFormat formatter) {
        this.connection = connection;
    }

    public List<Question> getQuestions() throws Exception {
        List<Question> questions = new ArrayList<>();
        ResultSet resultSet = null;
        Statement statement = null;
        try {
            connection = new DbContext().getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery("Select * from Question");

            while (resultSet.next()) {
                Question q = new Question(resultSet.getInt("id"), resultSet.getNString("content"), resultSet.getNString("answer"), resultSet.getDate("created"));
                q.addOption(resultSet.getNString("opt1"));
                q.addOption(resultSet.getNString("opt2"));
                q.addOption(resultSet.getNString("opt3"));
                q.addOption(resultSet.getNString("opt4"));
                questions.add(q);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            if ((resultSet != null) && (!resultSet.isClosed())) {
                resultSet.close();
            }
            if ((statement != null) && (!statement.isClosed())) {
                statement.close();
            }
            DbContext.closeConnection(connection);
        }
        return questions;
    }

    public List<Question> getQuestionsInRange(int from, int to) throws Exception, ParseException, ClassNotFoundException {
        List<Question> questions = new ArrayList<>();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = new DbContext().getConnection();
            String query = "Select * from (select ROW_NUMBER() Over (order by id) AS rowNum, * From Question) AS temp where rowNum between ? and ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, from);
            statement.setInt(2, to);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Question q = new Question(resultSet.getInt("id"), resultSet.getNString("content"), resultSet.getNString("answer"), resultSet.getDate("created"));
                q.addOption(resultSet.getNString("opt1"));
                q.addOption(resultSet.getNString("opt2"));
                q.addOption(resultSet.getNString("opt3"));
                q.addOption(resultSet.getNString("opt4"));
                questions.add(q);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            if ((resultSet != null) && (!resultSet.isClosed())) {
                resultSet.close();
            }
            if ((statement != null) && (!statement.isClosed())) {
                statement.close();
            }
            DbContext.closeConnection(connection);
        }
        return questions;
    }

    public void addQueston(Question q) throws Exception {
        PreparedStatement statement = null;
        try {
           connection = new DbContext().getConnection();
            String query = "insert into Question (content, opt1, opt2, opt3, opt4, answer, created) values(?,?,?,?,?,?,?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, q.getContent());
            statement.setString(2, q.getOption().get(0));
            statement.setString(3, q.getOption().get(1));
            statement.setString(4, q.getOption().get(2));
            statement.setString(5, q.getOption().get(3));
            statement.setString(6, q.getAnswer());
            statement.setDate(7, new Date((new java.util.Date()).getTime()));
            statement.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            if ((statement != null) && (!statement.isClosed())) {
                statement.close();
            }
            DbContext.closeConnection(connection);
        }
    }

    public void deleteQueston(int id) throws Exception {
        PreparedStatement statement = null;
        try {
            connection = new DbContext().getConnection();
            String query = "delete from Question where id=?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            if ((statement != null) && (!statement.isClosed())) {
                statement.close();
            }
            DbContext.closeConnection(connection);
        }
    }

    public Question findQuestionById(int id) throws Exception {
        Question returnValue = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = new DbContext().getConnection();
            statement = connection.prepareCall("SELECT * FROM Question WHERE id=?");
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                returnValue = new Question(resultSet.getInt("id"), resultSet.getNString("content"), resultSet.getNString("answer"), resultSet.getDate("created"));
                returnValue.addOption(resultSet.getNString("opt1"));
                returnValue.addOption(resultSet.getNString("opt2"));
                returnValue.addOption(resultSet.getNString("opt3"));
                returnValue.addOption(resultSet.getNString("opt4"));
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            if ((resultSet != null) && (!resultSet.isClosed())) {
                resultSet.close();
            }
            if ((statement != null) && (!statement.isClosed())) {
                statement.close();
            }
            DbContext.closeConnection(connection);
        }
        return returnValue;
    }

    public int getQuestionSize() throws Exception {
        int returnValue = 0;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = new DbContext().getConnection();
            statement = connection.prepareStatement("SELECT COUNT(*) as \"size\" FROM Question");
            resultSet = statement.executeQuery();
            resultSet.next();
            returnValue = resultSet.getInt("size");
        } catch (Exception ex) {
            throw ex;
        } finally {
            if ((resultSet != null) && (!resultSet.isClosed())) {
                resultSet.close();
            }
            if ((statement != null) && (!statement.isClosed())) {
                statement.close();
            }
            DbContext.closeConnection(connection);
        }
        return returnValue;
    }

    public List<Question> getRandomQuestions(int quizNum) throws Exception, ParseException, ClassNotFoundException {
        List<Question> questions = new ArrayList<>();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            String temp_query = "Select Top %d * from Question order by NEWID()";
            String query = String.format(temp_query, quizNum);
            connection = new DbContext().getConnection();
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            

            while (resultSet.next()) {
                Question q = new Question(resultSet.getInt("id"), resultSet.getNString("content"), resultSet.getNString("answer"), resultSet.getDate("created"));
                q.addOption(resultSet.getNString("opt1"));
                q.addOption(resultSet.getNString("opt2"));
                q.addOption(resultSet.getNString("opt3"));
                q.addOption(resultSet.getNString("opt4"));
                questions.add(q);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            if ((resultSet != null) && (!resultSet.isClosed())) {
                resultSet.close();
            }
            if ((statement != null) && (!statement.isClosed())) {
                statement.close();
            }
            DbContext.closeConnection(connection);
        }
        return questions;
    }
}
