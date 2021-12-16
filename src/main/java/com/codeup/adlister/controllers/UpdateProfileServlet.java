

package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateProfileServlet", value = "/user/update")
public class UpdateProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }


        User user = (User) request.getSession().getAttribute("user");
        request.setAttribute("email", user.getEmail());
        request.setAttribute("username", user.getUsername());
        request.setAttribute("bio", user.getBio());
        request.setAttribute("image", user.getImage());

        request.getRequestDispatcher("/WEB-INF/users/update.jsp")
                .forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String bio = request.getParameter("bio");
        String image = request.getParameter("image");
        String errorMsg = null;

        if(username.isEmpty()){ //checks if username empty
            response.sendRedirect("/user/update");
            return;
        }

        if(email.isEmpty()){ //checks if email is empty
            response.sendRedirect("/user/update");
            return;
        }

        User user = (User) request.getSession().getAttribute("user"); //get current user
//
//        if (user == null){
//            errorMsg = "Please enter an available username";
//            request.setAttribute("errorMsg", errorMsg);
//            request.getRequestDispatcher("user/update.jsp").forward(request, response);
//            return;
//        }

        user.setUsername(username);
        user.setEmail(email);
        user.setBio(bio);
        user.setImage(image);
        DaoFactory.getUsersDao().update(user);
        response.sendRedirect("/profile");
    }
}
