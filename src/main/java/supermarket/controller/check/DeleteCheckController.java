package supermarket.controller.check;

import supermarket.lib.Injector;
import supermarket.service.CheckService;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteCheckController extends HttpServlet {
    private static final Injector injector = Injector.getInstance("supermarket");
    private final CheckService checkService = (CheckService) injector
            .getInstance(CheckService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        req.setCharacterEncoding("UTF-8");
        checkService.delete(req.getParameter("check_number"));
        resp.sendRedirect(req.getContextPath() + "/checks");
    }
}
