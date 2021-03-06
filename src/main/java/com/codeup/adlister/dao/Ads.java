package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.sql.SQLException;
import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);


//    find by id
    Ad findById(long id);

    List<Ad> searchAdsFromMangaList(String title) throws SQLException;

    List<Ad> allById(Long id);

    void update(Ad ad);

    void delete(long id);
}
