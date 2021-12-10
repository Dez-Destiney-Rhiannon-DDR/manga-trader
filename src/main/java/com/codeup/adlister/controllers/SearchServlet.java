package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controllers.SearchServlet", urlPatterns = "/ads-search")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchQuery = request.getParameter("q");

        try {
            request.setAttribute("ads", DaoFactory.getAdsDao().searchAdsFromMangaList(searchQuery));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }

//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
//         String title = request.getParameter("title");
//         List<Ad> all = DaoFactory.getAdsDao().all();
//         List<Ad> ads = new ArrayList<>();
//             for (Ad ad: all ) {
//                 if (ad.getTitle().equalsIgnoreCase(title));
//             ads.add(ad);
//         }
//    }


}
