package supermarket.controller.category;

import supermarket.lib.Injector;
import supermarket.model.Category;
import supermarket.service.CategoryService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateCategoryController extends HttpServlet {
    private static final Injector injector = Injector.getInstance("supermarket");
    private final CategoryService categoryService = (CategoryService) injector
            .getInstance(CategoryService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Integer categoryNumber = Integer.parseInt(req.getParameter("categoryNumber"));
        Category category = categoryService.get(categoryNumber);
        req.setAttribute("category", category);
        req.getRequestDispatcher("/WEB-INF/views/categories/update.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        req.setCharacterEncoding("UTF-8");
        Integer categoryNumber = Integer.parseInt(req.getParameter("category_number"));
        String categoryName = req.getParameter("category_name");
        Category category = new Category(categoryNumber, categoryName);
        categoryService.update(category);
        resp.sendRedirect(req.getContextPath() + "/categories");
    }
}
