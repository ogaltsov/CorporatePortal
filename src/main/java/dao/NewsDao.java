package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import services.HibernateSessionFactory;
import web.model.News;

import java.util.List;

public class NewsDao {
    private SessionFactory sessionFactory = HibernateSessionFactory.getSessionFactory();

    public List<News> getLatestNews(){
        Session session = sessionFactory.openSession();
        Query<News> query = session.createQuery("from News order by date", News.class).setMaxResults(5);//max 5 news in latest news in main page
        List<News> list = query.list();
        session.close();
        return list;
    }

    public News getNewsById(Integer newsId){
        Session session = sessionFactory.openSession();
        News news = session.get(News.class, newsId);
        session.close();
        return news;
    }

//    public Integer getAllNewsCount(){
//        Session session = sessionFactory.openSession();
//        Query query = session.createQuery("select count (*) from News");
//        Integer result = (Integer) query.uniqueResult();
//        session.close();
//        return result;
//    }

    public List<News> getNewsForPage(Integer page){
        int start = page*5 - 5;
        int max = 5;

        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from News", News.class);
        query.setFirstResult(start);
        query.setMaxResults(5);
        List<News> news = query.list();
        session.close();
        return news;
    }
}
