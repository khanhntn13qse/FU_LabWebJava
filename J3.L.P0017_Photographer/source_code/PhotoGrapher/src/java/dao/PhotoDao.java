package dao;

import config.Config;
import context.DBContext;
import java.util.ArrayList;
import java.util.List;
import entity.Photo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PhotoDao {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet rs = null;
    
    public List<Photo> getPhotoByGalleryId(int id) throws Exception {
        List<Photo> photos = new ArrayList<>();
        final String query = "SELECT *  FROM dbo.Photo where gallery_id = ?";
        
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, id);
        rs = preparedStatement.executeQuery();

        while (rs.next()) {
            Photo photo = new Photo();
            photo.setId(rs.getInt("id"));
            photo.setImage(Config.IMAGE_FOLDER + rs.getString("image"));
            photo.setTitle(rs.getString("title"));
            photo.setGalleryId(rs.getInt("gallery_id"));
            photos.add(photo);
        }
        
        return photos;
    }

}
