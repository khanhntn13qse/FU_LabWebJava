/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;

/**
 *
 * @author Administrator
 */
public class DigitalNews {
    private int idl;
    private String title;
    private String description;
    private String image;
    private String author;
    private Date postDate;
    private String shortDes;

    public DigitalNews() {
    }

    public DigitalNews(int idl, String title, String description, String image, String author, Date postDate, String shortDes) {
        this.idl = idl;
        this.title = title;
        this.description = description;
        this.image = image;
        this.author = author;
        this.postDate = postDate;
        this.shortDes = shortDes;
    }

    public int getIdl() {
        return idl;
    }

    public void setIdl(int idl) {
        this.idl = idl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public String getShortDes() {
        return shortDes;
    }

    public void setShortDes(String shortDes) {
        this.shortDes = shortDes;
    }
    
    
    
           
}
