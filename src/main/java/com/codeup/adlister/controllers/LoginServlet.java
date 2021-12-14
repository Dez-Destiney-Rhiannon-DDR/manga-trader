package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
//import sun.security.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String errorMsg = null;
        String register = null;
        String username = request.getParameter("username"); //variable username
        String password = request.getParameter("password");


        // TODO: find a record in your database that matches the submitted password
        User user = DaoFactory.getUsersDao().findByUsername(username);
        //^^ goes into factory, establishes connection, then findbyusername takes in your username to see if you're
        // in the db

        // TODO: make sure we find a user with that username
        if(user == null){
//            throw new ServletException("Mandatory Parameter missing");
            errorMsg = "no such username found";
            register = "register";
            request.setAttribute("register", register);
            request.setAttribute("errorMsg", errorMsg);
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        }

        // TODO: check the submitted password against what you have in your database
        boolean validAttempt = password.equals(user.getPassword());

        if (validAttempt) {
            // TODO: store the logged in user object in the session, instead of just the username
            request.getSession().setAttribute("user", user); //setting attribute to User user, which goes into the factory to see if you're in the db
            response.sendRedirect("/profile");
        } else {
            errorMsg = "password incorrect";
            register = "register";
            request.setAttribute("register", register);
            request.setAttribute("errorMsg", errorMsg);
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
    }
}
