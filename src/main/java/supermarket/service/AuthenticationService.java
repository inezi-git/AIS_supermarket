package supermarket.service;

import supermarket.exception.AuthenticationException;
import supermarket.model.Employee;

public interface AuthenticationService {
    Employee login(String login, String password) throws AuthenticationException;

    Employee register(Employee employee);
}
