package com.sujal.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.sujal.model.Provider;

@Component
public class ProviderDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Transactional
    public void saveProvider(Provider provider) {
        hibernateTemplate.save(provider);
    }

    public Provider getProvider(String contact) {
        return hibernateTemplate.get(Provider.class, contact);
    }

    public List<Provider> getAllProvider() {
        return hibernateTemplate.loadAll(Provider.class);
    }

    @Transactional
    public void updateProvider(Provider provider) {
        hibernateTemplate.update(provider);
    }

    @Transactional
    public void deleteProvider(String contact) {
        Provider provider = getProvider(contact);
        if (provider != null) {
            hibernateTemplate.delete(provider);
        }
    }
    @SuppressWarnings("unchecked")
    public List<Provider> getProvidersByCategoryAndPincode(String category, String pincode) {
        return (List<Provider>) hibernateTemplate.findByNamedParam(
            "from Provider where category = :category and pincode = :pincode",
            new String[] { "category", "pincode" },
            new Object[] { category, pincode }
        );
    }
}
