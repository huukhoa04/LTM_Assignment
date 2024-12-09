package com.assignment.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.assignment.model.bean.UserBean;
import com.assignment.model.bo.AdminBo;
import com.assignment.model.bo.UserBo;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
    private AdminBo adminBo;
    private UserBo userBo;
    public void init() {
        adminBo = new AdminBo();
        userBo = new UserBo();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            return;
        }
        switch (action) {
            case "listuser":
                listUser(request, response);
                break;
            case "adduser":
                if ("GET".equalsIgnoreCase(request.getMethod())) {
                    // Show create form
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/create.jsp");
                    dispatcher.forward(request, response);
                } else {
                    // Handle POST request
                    addUser(request, response);
                }
                break;
            case "detail":
                viewUserDetail(request, response);
                break;
            case "updateuser":
                showUpdateForm(request, response);
                break;
            case "deleteuser":
                showDeleteForm(request, response);
                break;
            default:
                listUser(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            return;
        }
        switch (action) {
            case "adduser":
                addUser(request, response);
                break;
            case "updateuser":
                updateUser(request, response);
                break;
            case "deleteuser":
                deleteUser(request, response);
                break;
            default:
                listUser(request, response);
                break;
        }
    }

    private void viewUserDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userId");
        if (userId != null) {
            UserBean user = userBo.getUserById(userId);
            request.setAttribute("userDetail", user);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/detail.jsp");
        dispatcher.forward(request, response);
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userId");
        if (userId != null) {
            UserBean user = userBo.getUserById(userId);
            request.setAttribute("user", user);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/update.jsp");
        dispatcher.forward(request, response);
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<UserBean> userList = adminBo.getAllUsers();
        request.setAttribute("userList", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/delete.jsp");
        dispatcher.forward(request, response);
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

            // Validate required fields
            if (username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty() ||
                email == null || email.trim().isEmpty()) {
                request.setAttribute("error", "Username, password and email are required.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/create.jsp");
                dispatcher.forward(request, response);
                return;
            }

            // Check if username already exists
            if (userBo.isUsernameExists(username)) {
                request.setAttribute("error", "Username already exists.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/create.jsp");
                dispatcher.forward(request, response);
                return;
            }

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
                request.getSession().setAttribute("success", "User created successfully.");
                response.sendRedirect("AdminController?action=listuser");
            } catch (Exception e) {
                request.setAttribute("error", "Error creating user. Please try again.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/create.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/create.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("UserId");
        String username = request.getParameter("Username");
        String phoneNumber = request.getParameter("PhoneNumber");
        String email = request.getParameter("Email");
        String aboutMe = request.getParameter("AboutMe");
        String work = request.getParameter("Work");
        String workPlace = request.getParameter("WorkPlace");

        UserBean user = new UserBean();
        user.setUserId(userId);
        user.setUsername(username);
        user.setPhoneNumber(phoneNumber);
        user.setEmail(email);
        user.setAboutMe(aboutMe);
        user.setWork(work);
        user.setWorkPlace(workPlace);

        // Keep the existing password
        UserBean existingUser = userBo.getUserById(userId);
        if (existingUser != null) {
            user.setPassword(existingUser.getPassword());
        }

        try {
            userBo.updateUser(user);
            response.sendRedirect("AdminController?action=listuser");
        } catch (Exception e) {
            request.setAttribute("error", "Error updating user. Please try again.");
            request.setAttribute("user", user);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/update.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] selectedUsers = request.getParameterValues("selectedUser");
        if (selectedUsers != null && selectedUsers.length > 0) {
            for (String userId : selectedUsers) {
                adminBo.deleteUser(userId);
            }
            request.getSession().setAttribute("success", "Selected users have been deleted successfully.");
        } else {
            request.getSession().setAttribute("error", "No users were selected for deletion.");
        }
        response.sendRedirect("AdminController?action=listuser");
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<UserBean> userList = adminBo.getAllUsers();
        request.setAttribute("userList", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/manage.jsp");
        dispatcher.forward(request, response);
    }
}
