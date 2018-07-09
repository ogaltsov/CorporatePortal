import dao.UserDao;

public class AppMain {

    public static void main(String[] args) {
        UserDao dao = new UserDao();
        System.out.println(dao.findByUsername("user1"));
    }
}