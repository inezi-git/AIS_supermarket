package supermarket.controller.employee;

import supermarket.lib.Injector;
import supermarket.model.Employee;
import supermarket.service.EmployeeService;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetAllEmployeesController extends HttpServlet {
    private static final Injector injector = Injector.getInstance("supermarket");
    private final EmployeeService employeeService = (EmployeeService) injector
            .getInstance(EmployeeService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        List<Employee> employees = employeeService.getAllSortedBySurname();
        req.setAttribute("employees", employees);
        req.getRequestDispatcher("/WEB-INF/views/employees/all.jsp").forward(req, resp);
    }
}
