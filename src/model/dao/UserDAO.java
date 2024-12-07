    package model.dao;

    import model.bean.AdminBean;
    import model.bean.UserBean;
    import java.sql.*;
    import java.util.ArrayList;
    import java.util.List;

    public class UserDAO {
        private Connection conn;
        private static final String DB_URL = "jdbc:mysql://localhost:3306/dulieu";
        private static final String DB_USER = "root";
        private static final String DB_PASSWORD = "peanizisme";

        private static Connection getConnection() throws Exception {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        }

        public Object validateLogin(String username, String password) {
            try {
                String adminSql = "SELECT * FROM admin WHERE username = ? AND password = ?";
                PreparedStatement adminStmt = conn.prepareStatement(adminSql);
                adminStmt.setString(1, username);
                adminStmt.setString(2, password);

                ResultSet adminRs = adminStmt.executeQuery();

                if (adminRs.next()) {
                    AdminBean admin = new AdminBean();
                    admin.setUsername(adminRs.getString("username"));
                    admin.setPassword(adminRs.getString("password"));
                    return admin;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                String userSql = "SELECT * FROM user WHERE Username = ? AND Password = ?";
                PreparedStatement userStmt = conn.prepareStatement(userSql);
                userStmt.setString(1, username);
                userStmt.setString(2, password);

                ResultSet userRs = userStmt.executeQuery();

                if (userRs.next()) {
                    UserBean user = new UserBean();
                    user.setUserId(userRs.getString("UserId"));
                    user.setUsername(userRs.getString("Username"));
                    user.setPassword(userRs.getString("Password"));
                    user.setPhoneNumber(userRs.getString("PhoneNumber"));
                    user.setEmail(userRs.getString("Email"));
                    user.setAboutMe(userRs.getString("AboutMe"));
                    user.setWork(userRs.getString("Work"));
                    user.setWorkPlace(userRs.getString("WorkPlace"));
                    return user;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return null;
        }

        public static List<UserBean> searchUser(String searchType, String searchValue) {
            List<UserBean> searchResults = new ArrayList<>();

            try (Connection conn = getConnection()) {
                String sql = "SELECT * FROM user WHERE " + searchType + " LIKE ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, "%" + searchValue + "%");

                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    UserBean user = new UserBean();
                    user.setUserId(rs.getString("UserID"));
                    user.setUsername(rs.getString("Username"));
                    user.setPassword(rs.getString("Password"));
                    user.setEmail(rs.getString("Email"));
                    user.setPhoneNumber(rs.getString("Phone"));
                    user.setWork(rs.getString("Work"));
                    user.setWorkPlace(rs.getString("Workplace"));
                    user.setAboutMe(rs.getString("Aboutme"));
                    searchResults.add(user);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return searchResults;
        }

        public static void addUser(UserBean user) {
            try (Connection conn = getConnection()) {
                String sql = "INSERT INTO user (UserID, Username, Password, Phone, Email, Aboutme, Work, Workplace) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);

                pstmt.setString(1, user.getUserId());
                pstmt.setString(2, user.getUsername());
                pstmt.setString(3, user.getPassword());
                pstmt.setString(4, user.getPhoneNumber());
                pstmt.setString(5, user.getEmail());
                pstmt.setString(6, user.getAboutMe());
                pstmt.setString(7, user.getWork());
                pstmt.setString(8, user.getWorkPlace());

                pstmt.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public static void updateUser(UserBean user) {
            try (Connection conn = getConnection()) {
                String sql = "UPDATE user SET Username = ?, Password = ?, Phone = ?, Email = ?, Aboutme = ?, Work = ?, Workplace = ? WHERE UserID = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);

                pstmt.setString(1, user.getUsername());
                pstmt.setString(2, user.getPassword());
                pstmt.setString(3, user.getPhoneNumber());
                pstmt.setString(4, user.getEmail());
                pstmt.setString(5, user.getAboutMe());
                pstmt.setString(6, user.getWork());
                pstmt.setString(7, user.getWorkPlace());
                pstmt.setString(8, user.getUserId());

                pstmt.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public static UserBean getUserById(String userId) {
            UserBean user = null;

            try (Connection conn = getConnection()) {
                String sql = "SELECT * FROM user WHERE UserID = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, userId);

                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    user = new UserBean();
                    user.setUserId(rs.getString("UserId"));
                    user.setUsername(rs.getString("Username"));
                    user.setPassword(rs.getString("Password"));
                    user.setPhoneNumber(rs.getString("PhoneNumber"));
                    user.setEmail(rs.getString("Email"));
                    user.setAboutMe(rs.getString("AboutMe"));
                    user.setWork(rs.getString("Work"));
                    user.setWorkPlace(rs.getString("WorkPlace"));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return user;
        }

        public static void deleteUser(String userId) {
            try (Connection conn = getConnection()) {
                String sql = "DELETE FROM user WHERE UserID = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);

                pstmt.setString(1, userId);
                pstmt.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public static List<UserBean> getAllUsers() {
            List<UserBean> userList = new ArrayList<>();

            try (Connection conn = getConnection()) {
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM user");

                while (rs.next()) {
                    UserBean user = new UserBean();
                    user.setUserId(rs.getString("UserID"));
                    user.setUsername(rs.getString("Username"));
                    user.setPassword(rs.getString("Password"));
                    user.setPhoneNumber(rs.getString("Phone"));
                    user.setEmail(rs.getString("Email"));
                    user.setAboutMe(rs.getString("Aboutme"));
                    user.setWork(rs.getString("Work"));
                    user.setWorkPlace(rs.getString("Workplace"));
                    userList.add(user);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return userList;
        }

    }