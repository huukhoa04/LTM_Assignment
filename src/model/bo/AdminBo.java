package model.bo;

import model.bean.UserBean;
import model.dao.UserDAO;

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
