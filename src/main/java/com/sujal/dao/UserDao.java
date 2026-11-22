package com.sujal.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.sujal.model.User;

@Component
public class UserDao
{
    @Autowired
    private HibernateTemplate hibernateTemplate;
    
    @Transactional
    public void saveUser(User user)
    {
        hibernateTemplate.save(user);
    }

    public User getUser(String contact)
    {
        return hibernateTemplate.get(User.class, contact);
    }

    public List<User> getAllUser() 
    {
        return hibernateTemplate.loadAll(User.class);
    }
    
    @Transactional
    public void updateUser(User user)
    {
        hibernateTemplate.update(user);
    }

    @Transactional
    public void deleteUser(String contact)
    {
        User user = getUser(contact);
        if (user != null) {
            hibernateTemplate.delete(user);
        }
    }
}
