package supermarket.controller.check;

import supermarket.lib.Injector;
import supermarket.model.Check;
import supermarket.model.Sale;
import supermarket.service.CheckService;
import supermarket.service.SaleService;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetCheckController extends HttpServlet {
    private static final Injector injector = Injector.getInstance("supermarket");
    private final CheckService checkService = (CheckService) injector
            .getInstance(CheckService.class);
    private final SaleService saleService = (SaleService) injector
            .getInstance(SaleService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Check check = checkService.get(req.getParameter("checkNumber"));
        List<Sale> sales = saleService.getSalesByCheck(check);

        req.setAttribute("check", check);
        req.setAttribute("sales", sales);

        req.getRequestDispatcher("/WEB-INF/views/checks/get.jsp").forward(req, resp);
    }
}
