package supermarket.service;

import supermarket.model.Employee;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface EmployeeService extends BasicService<Employee, String> {
    List<Employee> getAllSortedBySurname();
    Employee updatePassword(Employee employee);

    List<Employee> getAllCashiersSortedBySurname();

    Map<String, String> getPhoneAndAddressBySurname(String surname);

    Optional<Employee> findByEmail(String email);
}
