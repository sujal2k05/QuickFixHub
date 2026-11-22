package com.sujal.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sujal.dao.OrderServiceDao;
import com.sujal.dao.ProviderDao;
import com.sujal.dao.UserDao;
import com.sujal.model.OrderService;
import com.sujal.model.Provider;
import com.sujal.model.User;

@Controller
public class AdminController {

    ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
    ProviderDao providerDao = context.getBean("providerDao", ProviderDao.class);
    UserDao userDao = context.getBean("userDao", UserDao.class);
    OrderServiceDao orderServiceDao = context.getBean("orderServiceDao", OrderServiceDao.class);

    @GetMapping("/")
    public String openWelcome() {
        return "index";
    }

    @GetMapping("/index")
    public String indexPage() {
        return "index";
    }

    @GetMapping("/adminLogin")
    public String adminLogin() {
        return "adminLogin";
    }

    @PostMapping("/adminLoginSubmit")
    public String adminLoginPage(HttpServletRequest request) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if ("admin@gmail.com".equals(email) && "admin123".equals(password)) {
            request.getSession().setAttribute("admin", email);
            return "redirect:/admindashboard";
        } else {
            request.setAttribute("errorMsg", "Invalid credentials. Please try again.");
            return "adminLogin";
        }
    }

    @GetMapping("/admindashboard")
    public String adminDashboard() {
        return "adminDashboard";
    }

    @RequestMapping("/viewAllProviders")
    public String viewAllProviders(Model model) {
        List<Provider> list = providerDao.getAllProvider();
        model.addAttribute("providerList", list);
        return "providerPending";
    }

    @RequestMapping(value = "/updateProviderStatus", method = RequestMethod.POST)
    public String updateProviderStatus(@RequestParam("contact") String contact,
                                       @RequestParam("status") String status) {
        Provider provider = providerDao.getProvider(contact);
        if (provider != null) {
            provider.setStatus(status);
            providerDao.updateProvider(provider);
        }
        return "redirect:/viewAllProviders";
    }

    @RequestMapping("/viewApprovedProviders")
    public String viewApprovedProviders(Model model) {
        List<Provider> allProviders = providerDao.getAllProvider();
        List<Provider> approvedList = new ArrayList<>();

        for (Provider p : allProviders) {
            if ("approved".equalsIgnoreCase(p.getStatus())) {
                approvedList.add(p);
            }
        }

        model.addAttribute("providerList", approvedList);
        return "approvedProvider";
    }

    @RequestMapping("/disapprovedProvider")
    public String viewDisapprovedProviders(Model model) {
        List<Provider> allProviders = providerDao.getAllProvider();
        List<Provider> disapprovedList = new ArrayList<>();

        for (Provider p : allProviders) {
            if ("disapproved".equalsIgnoreCase(p.getStatus())) {
                disapprovedList.add(p);
            }
        }

        model.addAttribute("providerList", disapprovedList);
        return "disapprovedProvider";
    }

    @RequestMapping("/viewUsers")
    public String viewAllUsers(Model model) {
        List<User> userList = userDao.getAllUser();
        model.addAttribute("userList", userList);
        return "viewAllUser";
    }

    @RequestMapping("/viewApproveOrder")
    public String viewApproveOrder(Model model) {
        List<OrderService> orders = orderServiceDao.getAllOrders();
        model.addAttribute("orders", orders);
        return "viewApproveOrder";
    }
}
