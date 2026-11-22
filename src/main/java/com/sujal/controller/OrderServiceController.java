package com.sujal.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import com.sujal.dao.OrderServiceDao;
import com.sujal.dao.ProviderDao;
import com.sujal.model.OrderService;
import com.sujal.model.Provider;
import com.sujal.model.User;

@Controller
public class OrderServiceController {

    ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
    OrderServiceDao orderServiceDao = context.getBean("orderServiceDao", OrderServiceDao.class);
    ProviderDao providerDao = context.getBean("providerDao", ProviderDao.class);

    @RequestMapping("/bookServiceStep1")
    public String showStep1Form() {
        return "bookServiceStep1";
    }

    @RequestMapping(value = "/providerList", method = RequestMethod.POST)
    public String showProviders(HttpServletRequest request) {
        String category = request.getParameter("category");
        String pincode = request.getParameter("pincode");

        HttpSession session = request.getSession();
        session.setAttribute("category", category);
        session.setAttribute("pincode", pincode);

        List<Provider> providerList = providerDao.getProvidersByCategoryAndPincode(category, pincode);
        request.setAttribute("providerList", providerList);

        return "bookServiceStep2";
    }

    @RequestMapping(value = "/confirmBooking", method = RequestMethod.POST)
    public String confirmBooking(HttpServletRequest request) {
        String selectedProvider = request.getParameter("selectedProvider");

        if (selectedProvider != null && !selectedProvider.isEmpty()) {
            String[] parts = selectedProvider.split(",");
            if (parts.length >= 3) {
                HttpSession session = request.getSession();
                session.setAttribute("providerName", parts[0]);
                session.setAttribute("providerContact", parts[1]);
                session.setAttribute("providerCategory", parts[2]);
            }
        }

        return "bookServiceStep3";
    }

    @RequestMapping(path = "/bookService", method = RequestMethod.POST)
    public String bookServiceFinal(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            request.setAttribute("error", "Please login before booking a service.");
            return "userLogin";
        }

        String title = request.getParameter("serviceTitle");
        String description = request.getParameter("serviceDescription");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        String providerName = (String) session.getAttribute("providerName");
        String providerContact = (String) session.getAttribute("providerContact");

        OrderService order = new OrderService();
        order.setUserName(user.getName());
        order.setUserContact(user.getContact());
        order.setEmail(user.getEmail());
        order.setServiceProviderName(providerName);
        order.setServideProviderContact(providerContact);
        order.setDate(date);
        order.setTime(time);
        order.setServiceTitle(title);
        order.setServiceDescription(description);
        order.setStatus("pending");

        orderServiceDao.saveOrder(order);
        request.setAttribute("successMessage", "Service booked successfully!");

        return "userDashboard";
    }

    @RequestMapping("/viewOrders")
    public String viewAllOrders(Model model) {
        List<OrderService> orders = orderServiceDao.getAllOrders();
        model.addAttribute("orders", orders);
        return "viewOrders";
    }

    @RequestMapping("/viewOrder")
    public String viewSingleOrder(Model model) {
        List<OrderService> orders = orderServiceDao.getAllOrders();
        model.addAttribute("orders", orders);
        return "viewOrders";
    }

    @RequestMapping(path = "/updateStatus", method = RequestMethod.POST)
    public String updateStatus(@RequestParam("Id") int orderId,
                               @RequestParam("newStatus") String newStatus) {
        OrderService order = orderServiceDao.getOrderById(orderId);
        if (order != null) {
            order.setStatus(newStatus);
            orderServiceDao.updateOrder(order);
        }
        return "redirect:/providerOrders";
    }

    @RequestMapping("/pending")
    public String showPending(HttpServletRequest request) {
        List<OrderService> orders = orderServiceDao.getAllOrders();
        request.setAttribute("orderList", orders);
        return "pending";
    }

    @RequestMapping("/approved")
    public String showApproved(HttpServletRequest request) {
        List<OrderService> orders = orderServiceDao.getAllOrders();
        request.setAttribute("orderList", orders);
        return "approved";
    }

    @RequestMapping("/disapproved")
    public String showDisapproved(HttpServletRequest request) {
        List<OrderService> orders = orderServiceDao.getAllOrders();
        request.setAttribute("orderList", orders);
        return "disapproved";
    }
}
