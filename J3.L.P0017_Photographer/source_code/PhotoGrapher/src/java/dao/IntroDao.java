package dao;

import config.Config;
import context.DBContext;
import entity.Intro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class IntroDao{
//    final private String PATH_IMAGE = "assets/images/";

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet rs = null;

    public Intro getLatestPost() throws Exception {
        final String query = "SELECT TOP 1. p.id,p.title, p.photo,p.about_me\n"
                + "FROM dbo.IntroPost AS p\n"
                + "ORDER BY p.id ASC";

        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        rs = preparedStatement.executeQuery();

        while (rs.next()) {
            Intro post = new Intro();
            post.setId(rs.getInt("id"));
            post.setPhoto(Config.IMAGE_FOLDER + rs.getString("photo"));
            post.setTitle(rs.getNString("title"));
            post.setAboutMe(rs.getString("about_me"));
            return post;
        }

        return null;

    }

}
