package web.controller;

import dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import web.model.User;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserDao dao = new UserDao();

    Authentication auth = SecurityContextHolder.getContext().getAuthentication();


//    @RequestMapping(value = "/", method = RequestMethod.GET)
//    public ModelAndView redirectToUserPage(){
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("redirectToUserPage");
//        return modelAndView;
//    }

//    @RequestMapping(value = "/", method = RequestMethod.GET)
//    public ModelAndView userPage()
//    {
//        String userName = auth.getName();
//        User user = dao.findByUsername(userName);  ///we ca use info about user later(new it missing)
//        ModelAndView model = new ModelAndView();
//        model.setViewName("userPage");
//        return model;
//    }

    //todo: на странице пользователя проверять если я это я то показать logout
    @RequestMapping(value = "/id", method = RequestMethod.GET)
    public ModelAndView getUsersPage(@RequestParam(value = "userName", required = false) String userName)
    {

        User user = dao.findByUsername(userName);  //todo: handle NullPointer

        ModelAndView model = new ModelAndView();
        model.addObject("userName", user.getLogin());

        model.setViewName("userPage");
        return model;
    }

}
