package supermarket.controller.store_product;

import supermarket.lib.Injector;
import supermarket.model.CategoryMaxPriceProduct;
import supermarket.service.StoreProductService;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetMaxAndMinPriceForCategoryController extends HttpServlet {
    private static final Injector injector = Injector.getInstance("supermarket");
    private final StoreProductService storeProductService = (StoreProductService) injector
            .getInstance(StoreProductService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        List<CategoryMaxPriceProduct> list = storeProductService.requestCategory();
        req.setAttribute("list", list);
        req.getRequestDispatcher("/WEB-INF/views/store_products/find_total_max_for_each.jsp").forward(req, resp);
    }
}
