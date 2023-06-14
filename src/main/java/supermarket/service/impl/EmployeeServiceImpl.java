package supermarket.service.impl;

import supermarket.dao.EmployeeDao;
import supermarket.lib.Inject;
import supermarket.lib.Service;
import supermarket.model.Employee;
import supermarket.service.EmployeeService;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Inject
    private EmployeeDao employeeDao;

    @Override
    public Employee create(Employee employee) {
        return employeeDao.save(employee);
    }

    @Override
    public Employee get(String id) {
        return employeeDao.get(id).orElse(null);
    }

    @Override
    public List<Employee> getAll() {
        return employeeDao.getAll();
    }

    @Override
    public Employee update(Employee employee) {
        return employeeDao.update(employee);
    }

    @Override
    public boolean delete(String id) {
        return employeeDao.delete(id);
    }

    @Override
    public List<Employee> getAllSortedBySurname() {
        return employeeDao.getAllSortedBySurname();
    }

    @Override
    public List<Employee> getAllCashiersSortedBySurname() {
        return employeeDao.getAllCashiersSortedBySurname();
    }

    @Override
    public Map<String, String> getPhoneAndAddressBySurname(String surname) {
        return employeeDao.getPhoneAndAddressBySurname(surname);
    }

    @Override
    public Optional<Employee> findByEmail(String email) {
        return employeeDao.findByEmail(email);
    }
}
