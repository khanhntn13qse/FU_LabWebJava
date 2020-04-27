package services;

import dao.PhotoDao;
import java.util.List;
import entity.Photo;

public class PhotoService {

    private PhotoDao photoDao;

    public PhotoService() {
        photoDao = new PhotoDao();
    }

    public List<Photo> loadPhotoOfGallery(int galleryId)
            throws Exception {
        return photoDao.getPhotoByGalleryId(galleryId);
    }

}
