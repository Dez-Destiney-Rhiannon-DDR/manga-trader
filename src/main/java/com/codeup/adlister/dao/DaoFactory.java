package com.codeup.adlister.dao;
import com.codeup.adlister.Config;


public class DaoFactory {
    private static Ads adsDao;
    private static Users usersDao; //Added this to connect
    private static Config config = new Config();

    public static Ads getAdsDao() {
        if (adsDao == null) {
            adsDao = new MySQLAdsDao(config);
        }
        return adsDao;
    }

    public static Users getUsersDao() { //Configuring
        if(usersDao == null) {
            usersDao = new MySQLUsersDao(config);
        }
        return usersDao;
    }


}
