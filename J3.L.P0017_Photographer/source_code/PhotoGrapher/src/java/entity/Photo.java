package entity;

public class Photo {
    int id;
    String title;
    String image;
    private int galleryId;

    public Photo() {
    }

    public Photo(int id, String title, String image, int galleryId) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.galleryId = galleryId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getGalleryId() {
        return galleryId;
    }

    public void setGalleryId(int galleryId) {
        this.galleryId = galleryId;
    }

   

}
