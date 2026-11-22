package com.sujal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sujal.dao.UserDao;
import com.sujal.model.User;

@Controller
public class UserController {

    ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
    UserDao userDao = context.getBean("userDao", UserDao.class);

    @RequestMapping("/userlogin")
    public String userLogin() {
        return "userLogin";
    }

    @RequestMapping("/user_register")
    public String userRegister() {
        return "userRegister";
    }

    @RequestMapping(path = "/userRegisterSubmit", method = RequestMethod.POST)
    public String userRegisterSubmit(HttpServletRequest request) {
        String contact = request.getParameter("contact");
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String pincode = request.getParameter("pincode");
        String area = request.getParameter("area");
        String city = request.getParameter("city");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User(contact, name, dob, address, pincode, area, city, email, password);
        userDao.saveUser(user);

        return "redirect:/userlogin";
    }

    @RequestMapping(path = "/userLoginSubmit", method = RequestMethod.POST)
    public String userLoginSubmit(HttpServletRequest request) {
        String contact = request.getParameter("contact");
        String password = request.getParameter("password");
        User user = userDao.getUser(contact);

        if (user != null && user.getPassword().equals(password)) {
            request.getSession().setAttribute("name", user.getName());
            request.getSession().setAttribute("user", user);
            request.getSession().setAttribute("contact", user.getContact());

            return "userDashboard";
        } else {
            request.setAttribute("error", "Invalid contact or password");
            return "userLogin";
        }
    }

    @RequestMapping("/userDashboard")
    public String userDashboard() {
        return "userDashboard";
    }

    @RequestMapping("/userBook")
    public String userBookPage() {
        return "userBook";
    }

    @RequestMapping("/searchProvider")
    public String searchProviderPage() {
        return "searchProvider";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        if (request.getSession(false) != null) {
            request.getSession().invalidate();
        }
        return "redirect:/index";
    }
}
