package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.io.*;
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
            String sql = "INSERT INTO mangas(user_id, title, description, author, year, genre, image) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.setString(4, ad.getAuthor());
            stmt.setString(5, ad.getYear());
            stmt.setString(6, ad.getGenre());
            stmt.setString(7, ad.getImage());

            stmt.executeUpdate();
            ResultSet generatedIdResultSet = stmt.getGeneratedKeys();
            generatedIdResultSet.next(); /* allows user input to actually be POSTED to ads */
            return generatedIdResultSet.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
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
            rs.getString("genre"),
            rs.getString("image")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

    public List<Ad> searchAdsFromMangaList(String title) throws SQLException {
        Statement stmt = null;
        ResultSet resultSet = null;
        String myQuery = "SELECT * FROM mangas WHERE title LIKE ?";
        try {
            PreparedStatement statement = connection.prepareStatement(myQuery);
            statement.setString(1, "%" + title + "%");
            resultSet = statement.executeQuery();

            return createAdsFromResults(resultSet);
        } catch (SQLException e) {
            throw new RuntimeException("Error finding your searched ads.", e);
        }
    }

    @Override
    public List<Ad> allById(Long id) {
        Statement stmt = null;
        ResultSet resultSet = null;
        try {
            String myQuery = "SELECT * FROM mangas WHERE user_id = ?";

            PreparedStatement statement = connection.prepareStatement(myQuery);
            statement.setLong(1, id);
            resultSet = statement.executeQuery();

            return createAdsFromResults(resultSet);
        } catch (SQLException e) {
            throw new RuntimeException("Error finding your personal ads.", e);
        }
    }


    @Override
    public Ad findById(long id) {
        try {
            String query = "SELECT * FROM mangas WHERE id = ? LIMIT 1";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, String.valueOf(id));
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return extractAd(rs);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a Ad by Id", e);
        }
    }


    public void update(Ad ad) {
        String query = "UPDATE mangas set title = ?, description = ?, author = ?, year = ?, genre = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getDescription());
            stmt.setString(3, ad.getAuthor());
            stmt.setString(4, ad.getYear());
            stmt.setString(5, ad.getGenre());
            stmt.setLong(6, ad.getId());
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error updating ad", e);
        }
    }

    @Override
    public void delete(long id) {
        String Query = "DELETE FROM mangas WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(Query);
            stmt.setLong(1, id);
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Error finding ad with that ID", e);
        }

    }

}
