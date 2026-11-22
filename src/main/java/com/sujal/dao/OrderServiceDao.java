package com.sujal.dao;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import com.sujal.model.OrderService;

@Component
public class OrderServiceDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Transactional
    public void saveOrder(OrderService order) {
        hibernateTemplate.save(order);
    }

    public OrderService getOrderById(int id) {
        return hibernateTemplate.get(OrderService.class, id);
    }

    public List<OrderService> getAllOrders() {
        return hibernateTemplate.loadAll(OrderService.class);
    }

    @Transactional
    public void updateOrder(OrderService order) {
        hibernateTemplate.update(order);
    }

    @Transactional
    public void deleteOrder(int id) {
        OrderService order = getOrderById(id);
        if (order != null) {
            hibernateTemplate.delete(order);
        }
    }
    
}
