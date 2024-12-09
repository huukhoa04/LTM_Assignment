package com.assignment.model.bo;

import com.assignment.model.bean.UserBean;
import com.assignment.model.dao.UserDAO;

import java.util.List;

public class AdminBo {

    public static void deleteUser(String userId)
    {
        UserDAO.deleteUser(userId);
    }

    public static List<UserBean> getAllUsers()
    {
        return UserDAO.getAllUsers();
    }


}
