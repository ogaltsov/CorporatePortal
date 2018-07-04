package web.controller;

import dao.EmployeeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import web.model.ListToJsonArray;
import web.model.SearchQuery;



@Controller
@RequestMapping("/search")
public class EmployeeSearchController {
    @Autowired
    private EmployeeDao dao;

    /////
    public EmployeeSearchController(EmployeeDao dao){
        this.dao=dao;
    }


//    @RequestMapping(value = "/validate", method = RequestMethod.GET)
//    public ModelAndView validateUser() {
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.addObject("searchQuery", new SearchQuery());
//        modelAndView.setViewName("employees_result_page");
//        return modelAndView;
//    }

    @RequestMapping(value = "/check", method = RequestMethod.GET)
    public @ResponseBody
    ListToJsonArray checkUser(@ModelAttribute("searchQuery") SearchQuery searchQuery) {
        ListToJsonArray array = new ListToJsonArray();
        array.setJsonArray(dao.searchEmployee(searchQuery));
        return array;
    }

//    @RequestMapping(value = "/test", method = RequestMethod.GET)
//    public @ResponseBody
//    Employee checkUserTest(@ModelAttribute SearchQuery searchQuery) {
//        return (Employee) dao.searchEmployee(searchQuery).get(0);
//    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView mainPage() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("searchPage");
        return modelAndView;
    }


}
