package supermarket.controller.check;

import supermarket.lib.Injector;
import supermarket.model.StoreProduct;
import supermarket.service.StoreProductService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/checks/add-store-product-to-check")
public class AddStoreProductToCheckController extends HttpServlet {
    private static final Injector injector = Injector.getInstance("supermarket");
    public static List<StoreProduct> storeProductsToCheck = new ArrayList<>();
    private final StoreProductService storeProductService = (StoreProductService) injector
            .getInstance(StoreProductService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        req.setCharacterEncoding("UTF-8");
        storeProductsToCheck.add(storeProductService.get(req.getParameter("upc")));
        resp.sendRedirect(req.getContextPath() + "/checks/add");
    }
}