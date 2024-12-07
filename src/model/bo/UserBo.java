package model.bo;

import model.bean.UserBean;
import model.dao.UserDAO;

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
        UserDAO.getUserById(userId);
    }
}
