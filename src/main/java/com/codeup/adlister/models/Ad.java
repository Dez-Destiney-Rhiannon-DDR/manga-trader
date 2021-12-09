package com.codeup.adlister.models;

public class Ad {
    private String username;
    private long id;
    private long userId;
    private String title;
    private String author;
    private String year;
    private String genre;
    private String description;

    public Ad(long id, long userId, String title, String description) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
    }

    public Ad(long userId, String title, String description) {
        this.userId = userId;
        this.title = title;
        this.description = description;
    }

    public Ad(long userId, String title, String description, String author, String year, String genre) {
        this.userId = userId;
        this.title = title;
        this.author = author;
        this.year = year;
        this.genre = genre;
        this.description = description;
    }

    public Ad(long id, long user_id, String title, String description, String author, String year, String genre) {

        this.id = id;
        this.userId = user_id;
        this.title = title;
        this.author = author;
        this.year = year;
        this.genre = genre;
        this.description = description;

    }

//    public Ad(long user_id, String title, String description, String author, String year, String genre) {
//
//        this.id = user_id;
//        this.title = title;
//        this.author = author;
//        this.year = year;
//        this.genre = genre;
//        this.description = description;
//
//    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }
}
