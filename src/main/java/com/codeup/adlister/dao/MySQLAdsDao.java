package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUsername(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() { //retrieving all ads, refactored to use prepared statements
        Statement stmt = null;
        ResultSet resultSet = null;
        String myQuery = "SELECT * FROM mangas";
        try {
            PreparedStatement statement = connection.prepareStatement(myQuery);
            resultSet = statement.executeQuery();
            return createAdsFromResults(resultSet);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) { //Inserting ad into db, refactored to use prepared statements
        try {
            String sql = "INSERT INTO mangas(user_id, title, description, author, year, genre) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.setString(4, ad.getAuthor());
            stmt.setString(5, ad.getYear());
            stmt.setString(6, ad.getGenre());
            stmt.executeUpdate();
            ResultSet generatedIdResultSet = stmt.getGeneratedKeys();
            generatedIdResultSet.next(); /* allows user input to actually be POSTED to ads */
            return generatedIdResultSet.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    @Override
    public Ad findById(long id) {
        try {
            String sql = "SELECT * FROM mangas WHERE id = ? LIMIT 1";

            PreparedStatement stmt = connection.prepareStatement(sql); //establishing connection
            stmt.setLong(1, id);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) { //If user is found, retrieve this data
                return this.extractAd(rs);
            }

        } catch (SQLException throwables) { //If user is not found, throw exception
            System.out.println("Cannot find user by that name");
        }
        return null;
    }

    private String createInsertQuery(Ad ad) {
        return "INSERT INTO ads(user_id, title, description) VALUES "
            + "(" + ad.getUserId() + ", "
            + "'" + ad.getTitle() +"', "
            + "'" + ad.getDescription() + "')";
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description"),
            rs.getString("author"),
            rs.getString("year"),
            rs.getString("genre")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
}
