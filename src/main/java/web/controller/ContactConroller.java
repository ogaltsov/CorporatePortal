package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContactConroller {

    @RequestMapping(value = "/contacts", method = RequestMethod.GET)
    public ModelAndView contactPage(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("contactsPage");
        return modelAndView;
    }
}
