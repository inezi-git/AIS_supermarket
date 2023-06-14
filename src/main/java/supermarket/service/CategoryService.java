package supermarket.service;

import supermarket.model.Category;
import java.util.List;

public interface CategoryService extends BasicService<Category, Integer> {
    List<Category> getAllSortedByName();
}
