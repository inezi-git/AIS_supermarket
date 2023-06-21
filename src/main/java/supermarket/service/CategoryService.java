package supermarket.service;

import supermarket.model.Category;
import java.util.List;
import java.util.Map;

public interface CategoryService extends BasicService<Category, Integer> {
    List<Category> getAllSortedByName();
    Map<String, Object> getCategoryStatistics();
    List<Category> findCategoriesToAddPromo();
}
