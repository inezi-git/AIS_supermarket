package supermarket.controller.employee;

import supermarket.exception.IncorrectPasswordException;
import supermarket.lib.Injector;
import supermarket.model.Category;
import supermarket.model.Employee;
import supermarket.model.composite.Address;
import supermarket.model.composite.FullName;
import supermarket.service.EmployeeService;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangeMyPasswordController extends HttpServlet {
    private static final Injector injector = Injector.getInstance("supermarket");
    private final EmployeeService employeeService = (EmployeeService) injector
            .getInstance(EmployeeService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String employeeId = req.getParameter("id");
        Employee employee = employeeService.get(employeeId);
        req.setAttribute("employee", employee);
        req.setAttribute("employeeRoles", Employee.Role.values());
        req.getRequestDispatcher("/WEB-INF/views/employees/change_my_password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {
        req.setCharacterEncoding("UTF-8");
        Employee employee = (Employee)req.getSession().getAttribute("employee");
        String password = req.getParameter("password");
        employeeService.updatePassword(employee);
        resp.sendRedirect(req.getContextPath() + "/employees/about-me");

    }
}
