package supermarket.controller.category;

import supermarket.lib.Injector;
import supermarket.model.Category;
import supermarket.service.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/categories/categoriesToAddPromo")
public class FindCategoriesToAddPromo extends HttpServlet {
    private static final Injector injector = Injector.getInstance("supermarket");
    private final CategoryService categoryService = (CategoryService) injector
            .getInstance(CategoryService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        List<Category> categories = categoryService.findCategoriesToAddPromo();
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("/WEB-INF/views/categories/categoriesToAddPromo.jsp").forward(req, resp);
    }
}
