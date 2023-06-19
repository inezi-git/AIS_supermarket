package supermarket.controller.store_product;

import supermarket.lib.Injector;
import supermarket.model.StoreProduct;
import supermarket.service.StoreProductService;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/store_products/non-promotional")
public class GetAllNonPromotionalStoreProductsController extends HttpServlet {
    private static final Injector injector = Injector.getInstance("supermarket");
    private final StoreProductService storeProductService = (StoreProductService) injector
            .getInstance(StoreProductService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        List<StoreProduct> storeProducts = storeProductService.getAllNonPromotionalSortedByAmountAndName();
        req.setAttribute("storeProducts", storeProducts);
        req.getRequestDispatcher("/WEB-INF/views/store_products/non-promotional.jsp").forward(req, resp);
    }
}
