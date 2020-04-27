package services;

import dao.GalleryDao;
import dao.IntroDao;
import java.util.List;
import entity.Gallery;
import entity.Intro;

public class IntroService {

    private IntroDao introDao;
    private GalleryDao galleryDao;

    public IntroService() {
        introDao = new IntroDao();
        galleryDao = new GalleryDao();
    }

    public Intro latestPost() throws Exception {
        return introDao.getLatestPost();
    }

    public List<Gallery> topThreesGalery()
            throws Exception {
        return galleryDao.getTop3Galleries();
    }

}
