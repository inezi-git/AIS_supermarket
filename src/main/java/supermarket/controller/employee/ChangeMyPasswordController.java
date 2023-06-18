package supermarket.controller.employee;

import supermarket.exception.IncorrectPasswordException;
import supermarket.lib.Injector;
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
        String id = req.getParameter("id");
        FullName fullName = new FullName(
                req.getParameter("empl_surname"),
                req.getParameter("empl_name"),
                req.getParameter("empl_patronymic")
        );
        Employee.Role role = Employee.Role.valueOf(req.getParameter("empl_role"));
        BigDecimal salary = new BigDecimal(req.getParameter("salary"));
        LocalDate dateOfBirth = LocalDate.parse(req.getParameter("date_of_birth"));
        LocalDate dateOfStart = LocalDate.parse(req.getParameter("date_of_start"));
        String phoneNumber = req.getParameter("phone_number");
        Address address = new Address(
                req.getParameter("city"),
                req.getParameter("street"),
                req.getParameter("zip_code")
        );
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        Employee employee = new Employee(id, fullName, role, salary,
                dateOfBirth, dateOfStart, phoneNumber, address, email, password);
        try {
            employeeService.updatePassword(employee);
            resp.sendRedirect(req.getContextPath() + "/employees/about-me");
        } catch (IncorrectPasswordException e) {
            req.setAttribute("employee", employee);
            req.setAttribute("employeeRoles", Employee.Role.values());
            req.setAttribute("message", "Incorrect password, please try again.");
            req.getRequestDispatcher("/WEB-INF/views/employees/change_my_password.jsp").forward(req, resp);
        }
    }
}
