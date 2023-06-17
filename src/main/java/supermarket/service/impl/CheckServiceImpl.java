package supermarket.service.impl;

import supermarket.dao.CheckDao;
import supermarket.lib.Inject;
import supermarket.lib.Service;
import supermarket.model.Check;
import supermarket.service.CheckService;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
public class CheckServiceImpl implements CheckService {
    @Inject
    private CheckDao checkDao;

    @Override
    public Check create(Check check) {
        return checkDao.save(check);
    }

    @Override
    public Check get(String s) {
        return checkDao.get(s).orElse(null);
    }

    @Override
    public List<Check> getAll() {
        return checkDao.getAll();
    }

    @Override
    public Check update(Check check) {
        return checkDao.update(check);
    }

    @Override
    public boolean delete(String s) {
        return checkDao.delete(s);
    }

    @Override
    public List<Check> getAllByToday(String employeeId) {
        return checkDao.getAllByToday(employeeId);
    }

    @Override
    public List<Check> getAllChecksByCashier(String cashierId) {
        return checkDao.getAllChecksByCashier(cashierId);
    }

    @Override
    public List<Check> getAllChecksByPeriod(LocalDateTime from, LocalDateTime to) {
        return checkDao.getAllChecksByPeriod(from, to);
    }

    @Override
    public List<Check> getAllChecksByCashierAndPeriod(String employeeId,
                                                      LocalDateTime from, LocalDateTime to) {
        return checkDao.getAllChecksByCashierAndPeriod(employeeId, from, to);
    }
}
