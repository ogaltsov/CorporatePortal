package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import services.HibernateSessionFactory;
import web.model.User;

@Repository("userDao")
public class UserDao {

    private SessionFactory sessionFactory = HibernateSessionFactory.getSessionFactory();

    public User findByUsername(String username){
        Session session = sessionFactory.openSession();
        User user = session.get(User.class, username);
        session.close();
        return user;
    }
}
