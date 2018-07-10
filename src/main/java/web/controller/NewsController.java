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
        list.setList(dao.getLatestNews());
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
        modelAndView.setViewName("allNewsPage");
        return modelAndView;
    }

    @RequestMapping(value = "/pg", method = RequestMethod.GET)
    public @ResponseBody
    ListToJsonArray<News> newsPerPage(@RequestParam(value = "page", required = false) Integer pageNumber){
        List<News> newsList = dao.getNewsForPage(pageNumber);
        ListToJsonArray<News> listOfNews = new ListToJsonArray<>();
        listOfNews.setList(newsList);
        return listOfNews;
    }








}
