package supermarket.controller.category;

import supermarket.lib.Injector;
import supermarket.service.CategoryService;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteCategoryController extends HttpServlet {
    private static final Injector injector = Injector.getInstance("supermarket");
    private final CategoryService categoryService = (CategoryService) injector
            .getInstance(CategoryService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        req.setCharacterEncoding("UTF-8");
        categoryService.delete(Integer.parseInt(req.getParameter("categoryNumber")));
        resp.sendRedirect(req.getContextPath() + "/categories");
    }
}
