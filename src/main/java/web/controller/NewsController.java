package web.controller;

import dao.NewsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import web.model.ListToJsonArray;
import web.model.News;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/news")
public class NewsController {

    @Autowired
    private NewsDao dao;

    @RequestMapping(value = "/getLastNewsList", method = RequestMethod.GET)
    public @ResponseBody
    ListToJsonArray<News> getLastNewsList(){
        ListToJsonArray<News> list = new ListToJsonArray<>();
        list.setJsonArray(dao.getLatestNews());
        return list;
    }

    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public ModelAndView getNewsPage(@RequestParam(value = "id", required = false) Integer newsId){
        News news = dao.getNewsById(newsId);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("id", news.getId());
        modelAndView.addObject("title", news.getTitle());
        modelAndView.addObject("article", news.getArticle());
        modelAndView.addObject("author", news.getAuthor());
        Date date = new Date(news.getDate());
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yy");
        modelAndView.addObject("date", format.format(date));
        modelAndView.setViewName("newsPage");
        return modelAndView;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView allNewsPage(@RequestParam(value = "page", required = false) Integer pageNumber){
        //Integer allPagesNumber = dao.getAllNewsCount();
        ModelAndView modelAndView = new ModelAndView();
        List<News> newsList = dao.getNewsForPage(pageNumber);

        for(int i = 0; i<5; i++){
            News news = newsList.get(i);
            SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
            String attributeElement="<div class=\"team-text\">\n" +
                    "                        <h1 id=\"newsTitle"+i+"\">"+news.getTitle()+"</h1>\n" +
                    "                        <span id=\"newsDate\">"+news.getAuthor()+"</span>\n" +
                    "                        <span id=\"newsAuthor\"> - "+format.format(news.getDate())+"</span>\n" +
                    "                        <p id=\"newsText0\" style=\"font-size: 10pt\">"+news.getArticle()+"</p>\n" +
                    "                    </div>";
            modelAndView.addObject("news"+i, attributeElement);
        }
        modelAndView.setViewName("allNewsPage");
        return modelAndView;
    }






}
