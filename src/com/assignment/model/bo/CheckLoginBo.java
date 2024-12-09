package com.assignment.model.bo;

import com.assignment.model.bean.AdminBean;
import com.assignment.model.dao.UserDAO;

public class CheckLoginBo {
    private UserDAO userDAO;

    public CheckLoginBo() {
        userDAO = new UserDAO();
    }

    public Object checkLogin(String username, String password) {
        return userDAO.validateLogin(username, password);
    }

    public boolean isAdmin(Object user) {
        return user instanceof AdminBean;
    }
}
