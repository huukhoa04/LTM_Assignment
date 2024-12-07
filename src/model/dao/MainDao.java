package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class MainDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/dulieu";
    private static final String USER = "root";
    private static final String PASS = "peanizisme";

    private static Connection getConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(DB_URL, USER, PASS);
    }
}
