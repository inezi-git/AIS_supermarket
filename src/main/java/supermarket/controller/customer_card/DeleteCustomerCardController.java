package supermarket.controller.customer_card;

import supermarket.lib.Injector;
import supermarket.service.CustomerCardService;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/customer_cards/delete")
public class DeleteCustomerCardController extends HttpServlet {
    private static final Injector injector = Injector.getInstance("supermarket");
    private final CustomerCardService customerCardService = (CustomerCardService) injector
            .getInstance(CustomerCardService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        req.setCharacterEncoding("UTF-8");
        customerCardService.delete(req.getParameter("cardNumber"));
        resp.sendRedirect(req.getContextPath() + "/customer_cards");
    }
}
