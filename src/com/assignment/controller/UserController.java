package com.assignment.controller;

import com.assignment.model.bean.AdminBean;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.assignment.model.bean.UserBean;
import com.assignment.model.bo.UserBo;

import java.io.IOException;
import java.util.List;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
    private UserBo userBo;
    public void init(){
        userBo = new UserBo();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        
        switch (action) {
            case "logout":
                logout(request, response);
                break;
            case "profile":
                showProfile(request, response);
                break;
            case "settings":
                showSettings(request, response);
                break;
            case "search":
                searchUsers(request, response);
                break;
            case "viewProfile":
                viewUserProfile(request, response);
                break;
            default:
                response.sendRedirect("index.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            return;
        }
        
        switch (action) {
            case "login":
                validateLogin(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            case "adduser":
                addUser(request, response);
                break;
            case "checkUsername":
                String username = request.getParameter("username");
                if (userBo.isUsernameExists(username)) {
                    response.getWriter().write("exists");
                } else {
                    response.getWriter().write("available");
                }
                break;
            case "updateuser":
                updateUser(request, response);
                break;
            case "updateProfile":
                updateProfile(request, response);
                break;
            case "changePassword":
                changePassword(request, response);
                break;
            default:
                break;
        }
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String userId = "U" + System.currentTimeMillis();
            String username = request.getParameter("Username");
            String password = request.getParameter("Password");
            String phoneNumber = request.getParameter("PhoneNumber");
            String email = request.getParameter("Email");
            String aboutMe = request.getParameter("AboutMe");
            String work = request.getParameter("Work");
            String workPlace = request.getParameter("WorkPlace");

            UserBean user = new UserBean();
            user.setUserId(userId);
            user.setUsername(username);
            user.setPassword(password);
            user.setPhoneNumber(phoneNumber);
            user.setEmail(email);
            user.setAboutMe(aboutMe);
            user.setWork(work);
            user.setWorkPlace(workPlace);

            try {
                userBo.addUser(user);
                response.sendRedirect("login.jsp");
            } catch (Exception e) {
                request.setAttribute("error", "Error creating account. Please try again.");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/addUser.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String userId = request.getParameter("UserId");
            String username = request.getParameter("Username");
            String password = request.getParameter("Password");
            String phoneNumber = request.getParameter("PhoneNumber");
            String email = request.getParameter("Email");
            String aboutMe = request.getParameter("AboutMe");
            String work = request.getParameter("Work");
            String workPlace = request.getParameter("WorkPlace");

            // Tạo đối tượng UserBean
            UserBean user = new UserBean();
            user.setUserId(userId);
            user.setUsername(username);
            user.setPassword(password);
            user.setPhoneNumber(phoneNumber);
            user.setEmail(email);
            user.setAboutMe(aboutMe);
            user.setWork(work);
            user.setWorkPlace(workPlace);

            // Cập nhật thông tin user
            userBo.updateUser(user);

            // Điều hướng về danh sách user
            response.sendRedirect("UserController?action=listUser");
        } else {
            String userId = request.getParameter("userId");
            if (userId != null) {
                UserBean user = userBo.getUserById(userId);
                request.setAttribute("user", user);
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("/updateUser.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String searchType = request.getParameter("searchType");
        String searchValue = request.getParameter("searchValue");

        if (searchValue != null && !searchValue.trim().isEmpty()) {
            List<UserBean> searchResults = UserBo.searchUser(searchType, searchValue);
            request.setAttribute("searchResults", searchResults);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/searchnv.jsp");
        dispatcher.forward(request, response);
    }

    private void validateLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        Object user = userBo.validateLogin(username, password);
        
        if (user != null) {
            HttpSession session = request.getSession();
            
            if (user instanceof AdminBean) {
                session.setAttribute("admin", user);
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            } else {
                session.setAttribute("user", user);
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        } else {
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("user");
            session.removeAttribute("admin");
            session.invalidate();
        }
        response.reset();
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    private void updateProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserBean currentUser = (UserBean) session.getAttribute("user");
        
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String userId = currentUser.getUserId();
        String username = request.getParameter("Username");
        String email = request.getParameter("Email");
        String phoneNumber = request.getParameter("PhoneNumber");
        String aboutMe = request.getParameter("AboutMe");
        String work = request.getParameter("Work");
        String workPlace = request.getParameter("WorkPlace");

        UserBean updatedUser = new UserBean();
        updatedUser.setUserId(userId);
        updatedUser.setUsername(username);
        updatedUser.setPassword(currentUser.getPassword()); // Keep existing password
        updatedUser.setEmail(email);
        updatedUser.setPhoneNumber(phoneNumber);
        updatedUser.setAboutMe(aboutMe);
        updatedUser.setWork(work);
        updatedUser.setWorkPlace(workPlace);

        try {
            userBo.updateUser(updatedUser);
            session.setAttribute("user", updatedUser);
            session.setAttribute("success", "Profile updated successfully!");
        } catch (Exception e) {
            session.setAttribute("error", "Error updating profile: " + e.getMessage());
        }
        response.sendRedirect("settings.jsp");
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserBean currentUser = (UserBean) session.getAttribute("user");
        
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");

        try {
            if (userBo.validatePassword(currentUser.getUserId(), currentPassword)) {
                userBo.updatePassword(currentUser.getUserId(), newPassword);
                currentUser.setPassword(newPassword);
                session.setAttribute("user", currentUser);
                session.setAttribute("success", "Password changed successfully!");
            } else {
                session.setAttribute("error", "Current password is incorrect");
            }
        } catch (Exception e) {
            session.setAttribute("error", "Error changing password: " + e.getMessage());
        }
        response.sendRedirect("settings.jsp");
    }

    private void showProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserBean currentUser = (UserBean) session.getAttribute("user");
        
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        request.getRequestDispatcher("/profile.jsp").forward(request, response);
    }

    private void showSettings(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserBean currentUser = (UserBean) session.getAttribute("user");
        
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        request.getRequestDispatcher("/settings.jsp").forward(request, response);
    }

    private void searchUsers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchValue = request.getParameter("searchValue");
        
        if (searchValue != null && !searchValue.trim().isEmpty()) {
            List<UserBean> results = userBo.searchUsers(searchValue);
            request.setAttribute("searchResults", results);
        }
        
        request.getRequestDispatcher("/search.jsp").forward(request, response);
    }

    private void viewUserProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userId");
        if (userId != null) {
            UserBean viewUser = userBo.getUserById(userId);
            if (viewUser != null) {
                request.setAttribute("viewUser", viewUser);
                request.getRequestDispatcher("/viewProfile.jsp").forward(request, response);
                return;
            }
        }
        // If user not found or invalid ID, redirect to search
        response.sendRedirect("UserController?action=search");
    }
}
