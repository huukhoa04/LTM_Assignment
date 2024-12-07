package model.bo;

import model.bean.AdminBean;
import model.bean.UserBean;
import model.dao.UserDAO;

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
