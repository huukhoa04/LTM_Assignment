package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.UserBean;
import model.bo.UserBo;

import java.io.IOException;
import java.util.List;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
    private UserBo userBo;
    public void init(){
        userBo = new UserBo();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String action = request.getParameter("action");


    }
    private void addUser(HttpServletRequest request, HttpServletResponse response)
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

            userBo.addUser(user);
            //dieu huong
            response.sendRedirect("UserController?action=listUser");
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
}
