package com.assignment.model.bo;

import com.assignment.model.bean.UserBean;
import com.assignment.model.dao.UserDAO;

import java.util.List;

public class UserBo {

    public static List<UserBean> searchUser(String searchType, String searchValue){
        return UserDAO.searchUser(searchType, searchValue);
    }

    public static void addUser(UserBean user)
    {
        UserDAO.addUser(user);
    }

    public static void updateUser(UserBean user)
    {
        UserDAO.updateUser(user);
    }

    public UserBean getUserById(String userId) {
        return UserDAO.getUserById(userId);
    }

    public static boolean isUsernameExists(String username)
    {
        return UserDAO.isUsernameExists(username);
    }

    public Object validateLogin(String username, String password) {
        UserDAO userDAO = new UserDAO();
        return userDAO.validateLogin(username, password);
    }

    public boolean validatePassword(String userId, String password) {
        return UserDAO.validatePassword(userId, password);
    }

    public void updatePassword(String userId, String newPassword) {
        UserDAO.updatePassword(userId, newPassword);
    }

    public List<UserBean> searchUsers(String searchValue) {
        return UserDAO.searchUsers(searchValue);
    }
}
