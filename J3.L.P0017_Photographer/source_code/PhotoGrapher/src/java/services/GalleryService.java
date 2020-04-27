package services;

import dao.GalleryDao;
import java.util.List;
import entity.Gallery;

public class GalleryService {

    private GalleryDao galleryDao;

    public GalleryService() {
        galleryDao = new GalleryDao();
    }

    public List<Gallery> top3Gallery() throws Exception {
        return galleryDao.getTop3Galleries();
    }

    public Gallery getGalleryById(int id) throws Exception {
        return galleryDao.getGalleryById(id);
    }

}
