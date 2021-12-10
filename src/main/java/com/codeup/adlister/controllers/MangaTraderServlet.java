package com.codeup.adlister.controllers;

//import sun.security.krb5.internal.APRep;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.MangaTraderServlet", urlPatterns = "/WEB-INF/index")
public class MangaTraderServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }

    protected void getPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }
}
