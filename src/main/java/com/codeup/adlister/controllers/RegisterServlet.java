package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO: show the registration form
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request,response); //Linking things up
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // TODO: ensure the submitted information is valid
        // TODO: create a new user based off of the submitted information
        // TODO: if a user was successfully created, send them to their profile

        String username = request.getParameter("username"); //Setting variables = to form input
        String email = request.getParameter("email"); //Setting variables = to form input
        String password = request.getParameter("password"); //Setting variables = to form input


        User user = new User(username, email, password); //Passing in created variables into new user (see user model)

        DaoFactory.getUsersDao().insert(user); //Inserting new user object into db

        response.sendRedirect("/login"); //Redirect to login once done creating their user

    }
}
