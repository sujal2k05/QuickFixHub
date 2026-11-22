package com.sujal.controller;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import com.sujal.dao.OrderServiceDao;
import com.sujal.dao.ProviderDao;
import com.sujal.model.OrderService;
import com.sujal.model.Provider;

@Controller
public class ProviderController {

    ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
    ProviderDao providerDao = context.getBean("providerDao", ProviderDao.class);
    OrderServiceDao orderServiceDao = context.getBean("orderServiceDao", OrderServiceDao.class);

    @RequestMapping("/providerLogin")
    public String providerLogin() {
        return "providerLogin";
    }

    @RequestMapping("/provider_register")
    public String providerRegister() {
        return "providerRegister";
    }

    @RequestMapping(path = "/providerRegisterSubmit", method = RequestMethod.POST)
    public String providerRegisterSubmit(HttpServletRequest request) {
        String contact = request.getParameter("contact");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String address = request.getParameter("address");
        String pincode = request.getParameter("pincode");
        String area = request.getParameter("area");
        String city = request.getParameter("city");
        String latitude = request.getParameter("latitude");
        String longitude = request.getParameter("longitude");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String category = request.getParameter("category");
        String serviceType = request.getParameter("serviceType");
        String openTime = request.getParameter("openTime");
        String closeTime = request.getParameter("closeTime");
        String status = "pending";

        Provider provider = new Provider(contact, name, age, address, pincode, area, city,
                latitude, longitude, email, password, category, serviceType, openTime, closeTime, status);

        providerDao.saveProvider(provider);
        return "redirect:providerLogin";
    }


    @RequestMapping(path = "/providerLoginSubmit", method = RequestMethod.POST)
    public String providerLoginSubmit(HttpServletRequest request) {
        String contact = request.getParameter("contact");
        String password = request.getParameter("password");

        Provider provider = providerDao.getProvider(contact);

        if (provider != null && provider.getPassword().equals(password)) {
            request.getSession().setAttribute("name", provider.getName()); // used in orders
            request.getSession().setAttribute("contact", provider.getContact());
            return "providerDashboard";
        } else {
            request.setAttribute("error", "Invalid contact or password");
            return "providerLogin";
        }
    }
    @RequestMapping("/providerDashboard")
    public String providerDashboard()
    {
    	return "providerDashboard";
    }

    @RequestMapping("/providerOrders")
    public String viewOrdersByProvider(HttpServletRequest request, Model model) {
        String providerName = (String) request.getSession().getAttribute("name");

        if (providerName == null || providerName.trim().isEmpty()) {
            model.addAttribute("error", "Provider not logged in.");
            return "redirect:/providerLogin";
        }

        List<OrderService> allOrders = orderServiceDao.getAllOrders();
        List<OrderService> filteredOrders = new ArrayList<>();

        for (OrderService order : allOrders) {
            if (order.getServiceProviderName() != null &&
                    order.getServiceProviderName().equalsIgnoreCase(providerName)) {
                filteredOrders.add(order);
            }
        }

        model.addAttribute("provider", providerName);
        model.addAttribute("orders", filteredOrders);
        return "viewProviderOrder";
    }

    @RequestMapping(value = "/providerOrdersToday", method = RequestMethod.GET)
    public String getTodayOrders(HttpServletRequest request, Model model) {
        String providerName = (String) request.getSession().getAttribute("name");

        if (providerName == null || providerName.trim().isEmpty()) {
            return "redirect:/providerLogin";
        }

        List<OrderService> allOrders = orderServiceDao.getAllOrders();

        String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

        List<OrderService> todayOrders = allOrders.stream()
                .filter(order -> providerName.equalsIgnoreCase(order.getServiceProviderName())
                        && today.equals(order.getDate()))
                .collect(Collectors.toList());

        model.addAttribute("provider", providerName);
        model.addAttribute("orders", todayOrders);

        return "viewTodaysOrder";
    }

    @RequestMapping(value = "/providerOrdersLast7Days", method = RequestMethod.GET)
    public String getLast7DaysOrders(HttpServletRequest request, Model model) {
        String providerName = (String) request.getSession().getAttribute("name");

        if (providerName == null || providerName.trim().isEmpty()) {
            return "redirect:/providerLogin";
        }

        List<OrderService> allOrders = orderServiceDao.getAllOrders();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date today = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(today);
        cal.add(Calendar.DAY_OF_YEAR, -6);
        Date sevenDaysAgo = cal.getTime();

        List<OrderService> recentOrders = new ArrayList<>();

        for (OrderService order : allOrders) {
            try {
                if (order.getServiceProviderName() != null &&
                    order.getServiceProviderName().equalsIgnoreCase(providerName)) {

                    Date orderDate = sdf.parse(order.getDate());
                    if (!orderDate.before(sevenDaysAgo) && !orderDate.after(today)) {
                        recentOrders.add(order);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        model.addAttribute("provider", providerName);
        model.addAttribute("orders", recentOrders);

        return "providerOrdersLast7Days";
    }

    
}
