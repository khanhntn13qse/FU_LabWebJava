package dao;

import context.DBContext;
import entity.Contact;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ContactDao {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet rs = null;

    public ContactDao() {
    }

    public Contact getContact() throws SQLException, ClassNotFoundException, Exception {
        final String query = "SELECT TOP 1.*\n"
                + "FROM dbo.Contact";

        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        rs = preparedStatement.executeQuery();

        while (rs.next()) {
            Contact contact = new Contact();
            contact.setId(rs.getInt("id"));
            contact.setTitle(rs.getNString("title"));
            contact.setAddress(rs.getNString("address"));
            contact.setCity(rs.getNString("city"));
            contact.setCountry(rs.getNString("country"));
            contact.setTelephone(rs.getNString("telephone"));
            contact.setEmail(rs.getNString("email"));
            
            return contact;
        }
        return null;
    }

}
