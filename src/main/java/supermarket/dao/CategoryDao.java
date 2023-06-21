package supermarket.dao;

import supermarket.model.Category;
import java.util.List;
import java.util.Map;

public interface CategoryDao extends BasicDao<Category, Integer> {
    List<Category> getAllSortedByName();
    Map<String, Object> getCategoryStatistics();
    List<String> findCategoriesToAddPromo();

}
