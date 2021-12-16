package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        User user = (User) request.getSession().getAttribute("user");
        Long userId = user.getId();
        String errorMsg = null;

        Ad ad = new Ad(
                userId,
                request.getParameter("title"),
                request.getParameter("description"),
                request.getParameter("author"),
                request.getParameter("year"),
                request.getParameter("genre"),
                request.getParameter("image")
        );


        if (ad.getTitle() == null) {
            errorMsg = "Please include a title";
            request.setAttribute("errorMsg", errorMsg);
            request.getRequestDispatcher("/ads/create.jsp").forward(request, response);
            return;
        }

        if (ad.getAuthor() == null){
            errorMsg = "Please include an author";
            request.setAttribute("errorMsg", errorMsg);
            request.getRequestDispatcher("/ads/create.jsp").forward(request, response);
            return;
        }

        if (ad.getYear() == null){
            errorMsg = "Please include the year";
            request.setAttribute("errorMsg", errorMsg);
            request.getRequestDispatcher("/ads/create.jsp").forward(request, response);
            return;
        }

        if (ad.getGenre() == null){
            errorMsg = "Please include genre";
            request.setAttribute("errorMsg", errorMsg);
            request.getRequestDispatcher("/ads/create.jsp").forward(request, response);
            return;
        }

        if (ad.getDescription() == null){
            errorMsg = "Please include a description";
            request.setAttribute("errorMsg", errorMsg);
            request.getRequestDispatcher("/ads/create.jsp").forward(request, response);
            return;

        }

            DaoFactory.getAdsDao().insert(ad);
            System.out.println(request.getParameter("image"));
            response.sendRedirect("/profile");


    }
}
