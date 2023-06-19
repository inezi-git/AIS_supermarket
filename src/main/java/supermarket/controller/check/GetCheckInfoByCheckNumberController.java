package supermarket.controller.check;

import supermarket.lib.Injector;
import supermarket.model.Check;
import supermarket.service.CheckService;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetCheckInfoByCheckNumberController extends HttpServlet {
    private static final Injector injector = Injector.getInstance("supermarket");
    private final CheckService checkService = (CheckService) injector
            .getInstance(CheckService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String checkNumber = req.getParameter("checkNumber");
        Check check = checkService.get(checkNumber);
        req.setAttribute("check", check);
        String cashierId = (String) req.getSession().getAttribute("id_employee");
        List<String> checkNumbers = checkService.getAllChecksByCashier(cashierId).stream()
                .map(Check::getCheckNumber).toList();
        req.setAttribute("checkNumbers", checkNumbers);
        req.getRequestDispatcher("/WEB-INF/views/checks/find_by_check_number.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }
}
