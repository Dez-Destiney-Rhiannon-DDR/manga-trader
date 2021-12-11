package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "controllers.UpdateAdsServlet", urlPatterns = "/ads/updateads")
public class UpdateAdsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        String errorMessage = request.getParameter("errorMessage");
        request.setAttribute("errorMessage", errorMessage);

        long ad_id = Long.parseLong(request.getParameter("ad_id"));
        Ad ad = DaoFactory.getAdsDao().findById(ad_id);

        request.setAttribute("ad_id", request.getParameter("ad_id"));
        request.setAttribute("title", ad.getTitle());
        request.setAttribute("description", ad.getDescription());
        request.setAttribute("author", ad.getAuthor());
        request.setAttribute("year", ad.getYear());
        request.setAttribute("genre", ad.getGenre());
        request.setAttribute("image", ad.getImage());
        request.getRequestDispatcher("/WEB-INF/ads/updateads.jsp").forward(request, response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String updateTitle = request.getParameter("updateTitle");
        String updateDescription = request.getParameter("updateDescription");
        String updateAuthor = request.getParameter("updateAuthor");
        String updateYear = request.getParameter("updateYear");
        String updateGenre = request.getParameter("updateGenre");
        String updateImage = request.getParameter("updateImage");
        long updateID = Long.parseLong(request.getParameter("ad_id"));

        if(updateTitle == null || updateTitle.isEmpty()){
            response.sendRedirect("/ads/updateads?ad_id=" + updateID);
            return;
        }

        if(updateDescription == null || updateDescription.isEmpty()){
            response.sendRedirect("/ads/updateads?ad_id=" + updateID);
            return;
        }

        if(updateAuthor == null || updateAuthor.isEmpty()){
            response.sendRedirect("/ads/updateads?ad_id=" + updateID);
            return;
        }

        if(updateYear == null || updateYear.isEmpty()){
            response.sendRedirect("/ads/updateads?ad_id=" + updateID);
            return;
        }

        if(updateGenre == null || updateGenre.isEmpty()){
            response.sendRedirect("/ads/updateads?ad_id=" + updateID);
            return;
        }

        if(updateImage == null || updateImage.isEmpty()){
            response.sendRedirect("/ads/updateads?ad_id=" + updateID);
            return;
        }


        User user = (User) request.getSession().getAttribute("user");
        Ad ad = new Ad(updateID, user.getId(),updateTitle, updateDescription, updateAuthor, updateYear, updateGenre, updateImage);
        DaoFactory.getAdsDao().update(ad);
        response.sendRedirect("/profile");
    }
}
