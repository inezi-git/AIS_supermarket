package supermarket.service.impl;

import supermarket.dao.CategoryDao;
import supermarket.lib.Inject;
import supermarket.lib.Service;
import supermarket.model.Category;
import supermarket.service.CategoryService;
import java.util.List;
import java.util.Map;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Inject
    private CategoryDao categoryDao;

    @Override
    public Category create(Category category) {
        return categoryDao.save(category);
    }

    @Override
    public Category get(Integer integer) {
        return categoryDao.get(integer).orElse(null);
    }

    @Override
    public List<Category> getAll() {
        return categoryDao.getAll();
    }

    @Override
    public Category update(Category category) {
        return categoryDao.update(category);
    }

    @Override
    public boolean delete(Integer integer) {
        return categoryDao.delete(integer);
    }

    @Override
    public List<Category> getAllSortedByName() {
        return categoryDao.getAllSortedByName();
    }

    @Override
    public Map<String, Object> getCategoryStatistics() {
        return categoryDao.getCategoryStatistics();
    }

    @Override
    public List<Category> findCategoriesToAddPromo() {
        return categoryDao.findCategoriesToAddPromo();
    }
}
