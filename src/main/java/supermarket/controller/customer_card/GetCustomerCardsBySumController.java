package supermarket.controller.customer_card;

import supermarket.lib.Injector;
import supermarket.model.CustomerCard;
import supermarket.service.CustomerCardService;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetCustomerCardsBySumController extends HttpServlet {
    private static final Injector injector = Injector.getInstance("supermarket");
    private final CustomerCardService customerCardService = (CustomerCardService)
            injector.getInstance(CustomerCardService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/customer_cards/customer_cards_by_sum.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        BigDecimal inputSum = new BigDecimal(req.getParameter("inputSum"));
        List<CustomerCard> customerCards = customerCardService.requestCustomer(inputSum);
        req.setAttribute("customerCards", customerCards);
        req.getRequestDispatcher("/WEB-INF/views/customer_cards/customer_cards_by_sum.jsp").forward(req, resp);
    }
}
