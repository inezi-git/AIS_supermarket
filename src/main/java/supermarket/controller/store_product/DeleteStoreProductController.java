package supermarket.controller.store_product;

import supermarket.lib.Injector;
import supermarket.service.StoreProductService;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/store_products/delete")
public class DeleteStoreProductController extends HttpServlet {
    private static final Injector injector = Injector.getInstance("supermarket");
    private final StoreProductService storeProductService = (StoreProductService) injector
            .getInstance(StoreProductService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        storeProductService.delete(req.getParameter("upc"));
        resp.sendRedirect(req.getContextPath() + "/store_products");
    }
}
