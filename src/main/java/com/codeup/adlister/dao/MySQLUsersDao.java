package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;

public class MySQLUsersDao implements Users {

    private Connection connection = null;


    public MySQLUsersDao(Config config) { //Getting connection to db
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
    public User findByUsername(String username) { //find by username is used to verify your login, takes in your username

        try {
            String sql = "SELECT * FROM users WHERE username = ? LIMIT 1";

            PreparedStatement stmt = connection.prepareStatement(sql); //establishing connection
            stmt.setString(1, username);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) { //If user is found, retrieve this data

                System.out.println(rs);
                return new User(
                        rs.getLong("id"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("password")
                );
            }

        } catch (SQLException throwables) { //If user is not found, throw exception
            System.out.println("Cannot find user by that name");
        }
        return null;
    }

//    link adId to users username
@Override
public String getUserByAdId(long adFromId) {
    try {
        String sql = "SELECT username FROM users JOIN mangas ON users.id = mangas.user_id WHERE mangas.id = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setLong(1, adFromId);
        ResultSet rs = stmt.executeQuery();
        rs.next();
        return rs.getString("username");
    }  catch (SQLException e) {
        throw new RuntimeException("Error getting user info", e);
    }
}

    @Override
    public Long insert(User user) { //Inserting created user into DB

        try {
            String sql = "INSERT INTO users(username, email, password) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            stmt.setString(1, user.getUsername()); //Getting value using User methods, setting them to respected value so they can be injected into user db
            stmt.setString(2, user.getEmail()); //Getting value using User methods, setting them to respected value so they can be injected into user db
            stmt.setString(3, user.getPassword()); //Getting value using User methods, setting them to respected value so they can be injected into user db

            stmt.executeUpdate();
            ResultSet generatedIdResultSet = stmt.getGeneratedKeys();

            generatedIdResultSet.next(); //Posting info to user db
            return generatedIdResultSet.getLong(1);

        } catch (SQLException throwables) {
            System.out.println("Cannot add user");
            throwables.printStackTrace();
        }
        return null;
    }



    public void update(User user) {
        String query = "UPDATE users set username = ?, email = ?, bio = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getBio());
            stmt.setLong(4, user.getId());
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error updating user", e);
        }
    }

}
