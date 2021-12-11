package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

public interface Users {
    User findByUsername(String username);

    //    findByUserId
    String getUserByAdId(long adId);

    Long insert(User user);

    void update(User user);

    String getUserImageById(long id);
}
