package supermarket.controller.customer_card;

import supermarket.lib.Injector;
import supermarket.model.CustomerCard;
import supermarket.service.CustomerCardService;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/customer_cards")
public class GetAllCustomerCardsController extends HttpServlet {
    private static final Injector injector = Injector.getInstance("supermarket");
    private final CustomerCardService customerCardService = (CustomerCardService) injector
            .getInstance(CustomerCardService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        List<CustomerCard> customerCards = customerCardService.getAllSortedBySurname();
        req.setAttribute("customer_cards", customerCards);
        req.getRequestDispatcher("/WEB-INF/views/customer_cards/all.jsp").forward(req, resp);
    }
}
