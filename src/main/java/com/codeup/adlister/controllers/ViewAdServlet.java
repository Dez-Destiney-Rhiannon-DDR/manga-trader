package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="ViewAdServlet", urlPatterns = "/ads/view")
public class ViewAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Long.parseLong(request.getParameter("id"));
        Ad ad = DaoFactory.getAdsDao().findById(id);

        response.getWriter().println(DaoFactory.getAdsDao().findById(id));


        // get the username who has created the ad
        String username = DaoFactory.getUsersDao().getUserByAdId(id);
//        String image = DaoFactory.getUsersDao().getUserImageById(id);
        request.setAttribute("ad", ad);
        request.setAttribute("username", username);
//        request.setAttribute("image", image);

        request.getRequestDispatcher("/WEB-INF/ads/ad.jsp").forward(request, response);





    }

}
