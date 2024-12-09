package com.assignment.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.assignment.model.bo.CheckLoginBo;
import java.io.IOException;

@WebServlet(name = "CheckLoginController", urlPatterns = {"/login"})
public class CheckLoginController extends HttpServlet {
    private CheckLoginBo checkLoginBo;

    public void init() {
        checkLoginBo = new CheckLoginBo();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        Object user = checkLoginBo.checkLogin(username, password);
        
        if (user != null) {
            HttpSession session = request.getSession();
            
            if (checkLoginBo.isAdmin(user)) {
                session.setAttribute("admin", user);
                response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
            } else {
                session.setAttribute("user", user);
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        } else {
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}