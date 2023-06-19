package supermarket.controller.employee;

import supermarket.lib.Injector;
import supermarket.service.EmployeeService;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/employees/delete")
public class DeleteEmployeeController extends HttpServlet {
    private static final Injector injector = Injector.getInstance("supermarket");
    private final EmployeeService employeeService = (EmployeeService) injector
            .getInstance(EmployeeService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        employeeService.delete(req.getParameter("id"));
        resp.sendRedirect(req.getContextPath() + "/employees");
    }
}
