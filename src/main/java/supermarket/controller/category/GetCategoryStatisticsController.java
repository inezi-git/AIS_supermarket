package supermarket.controller.category;

import supermarket.lib.Injector;
import supermarket.model.Category;
import supermarket.service.CategoryService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/categories/statistics")
public class GetCategoryStatisticsController extends HttpServlet {
    private static final Injector injector = Injector.getInstance("supermarket");
    private final CategoryService categoryService = (CategoryService) injector
            .getInstance(CategoryService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Map<String, Object> categories = categoryService.getCategoryStatistics();
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("/WEB-INF/views/categories/statistics.jsp").forward(req, resp);
    }
}
