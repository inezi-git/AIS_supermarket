package supermarket.service.impl;

import supermarket.dao.CustomerCardDao;
import supermarket.lib.Inject;
import supermarket.lib.Service;
import supermarket.model.CustomerCard;
import supermarket.service.CustomerCardService;
import java.math.BigDecimal;
import java.util.List;

@Service
public class CustomerCardServiceImpl implements CustomerCardService {

    @Inject
    private CustomerCardDao customerCardDao;

    @Override
    public CustomerCard create(CustomerCard card) {
        return customerCardDao.save(card);
    }

    @Override
    public CustomerCard get(String s) {
        return customerCardDao.get(s).orElse(null);
    }

    @Override
    public List<CustomerCard> getAll() {
        return customerCardDao.getAll();
    }

    @Override
    public CustomerCard update(CustomerCard card) {
        return customerCardDao.update(card);
    }

    @Override
    public boolean delete(String s) {
        return customerCardDao.delete(s);
    }

    @Override
    public List<CustomerCard> getAllSortedBySurname() {
        return customerCardDao.getAllSortedBySurname();
    }

    @Override
    public List<CustomerCard> getAllByPercentSortedBySurname(Integer percent) {
        return customerCardDao.getAllByPercentSortedBySurname(percent);
    }

    @Override
    public List<CustomerCard> getAllByLastName(String lastName) {
        return customerCardDao.getAllByLastName(lastName);
    }
}
