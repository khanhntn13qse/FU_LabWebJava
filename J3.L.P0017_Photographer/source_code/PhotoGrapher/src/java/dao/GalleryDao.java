package dao;

import config.Config;
import context.DBContext;
import java.util.LinkedList;
import java.util.List;
import entity.Gallery;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class GalleryDao {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet rs = null;

    public List<Gallery> getTop3Galleries() throws Exception {
        final String query = "SELECT TOP 3.g.id,g.name,g.description,g.photo\n"
                + "FROM dbo.Gallery AS g";
        List<Gallery> galleries = new LinkedList<>();

        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        rs = preparedStatement.executeQuery();

        while (rs.next()) {
            Gallery g = new Gallery();
            g.setId(rs.getInt("id"));
            g.setTitle(rs.getNString("name"));
            g.setPhoto(Config.IMAGE_FOLDER + rs.getString("photo"));
            g.setDescription(rs.getNString("description"));
            galleries.add(g);
        }

        return galleries;

    }
    
    public Gallery getGalleryById(int id) throws Exception {
        final String query = "SELECT * FROM dbo.Gallery where id = ?";

        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, id);
        rs = preparedStatement.executeQuery();

        while (rs.next()) {
            Gallery g = new Gallery();
            g.setId(rs.getInt("id"));
            g.setTitle(rs.getNString("name"));
            g.setPhoto(Config.IMAGE_FOLDER + rs.getString("photo"));
            g.setDescription(rs.getNString("description"));
            return g;
        }
        return null;

    }

}
