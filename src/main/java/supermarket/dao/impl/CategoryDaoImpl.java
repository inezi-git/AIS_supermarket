package supermarket.dao.impl;

import supermarket.dao.CategoryDao;
import supermarket.exception.DataProcessingException;
import supermarket.lib.Dao;
import supermarket.model.Category;
import supermarket.util.ConnectionWithDB;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

@Dao
public class CategoryDaoImpl implements CategoryDao {
    @Override
    public Category save(Category category) {
        String query = "INSERT INTO Category (category_name) VALUES (?)";
        try (Connection connection = ConnectionWithDB.getConnection();
                PreparedStatement saveCategoryStatement = connection.prepareStatement(query,
                        Statement.RETURN_GENERATED_KEYS)) {
            saveCategoryStatement.setString(1, category.getCategoryName());
            saveCategoryStatement.executeUpdate();
            ResultSet resultSet = saveCategoryStatement.getGeneratedKeys();
            if (resultSet.next()) {
                category.setCategoryNumber(resultSet.getObject(1, Integer.class));
            }
        } catch (SQLException e) {
            throw new DataProcessingException("Couldn't create " + category + ". ", e);
        }
        return category;
    }

    @Override
    public Optional<Category> get(Integer id) {
        String query = "SELECT * FROM Category WHERE category_number = ?";
        Category category = null;
        try (Connection connection = ConnectionWithDB.getConnection();
                PreparedStatement getCategoryStatement = connection.prepareStatement(query)) {
            getCategoryStatement.setInt(1, id);
            ResultSet resultSet = getCategoryStatement.executeQuery();
            if (resultSet.next()) {
                category = parseCategoryFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            throw new DataProcessingException("Couldn't get category by id " + id, e);
        }
        return Optional.ofNullable(category);
    }

    @Override
    public List<Category> getAll() {
        String query = "SELECT * FROM Category";
        List<Category> categories = new ArrayList<>();
        try (Connection connection = ConnectionWithDB.getConnection();
                PreparedStatement getAllCategoriesStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = getAllCategoriesStatement.executeQuery();
            while (resultSet.next()) {
                categories.add(parseCategoryFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            throw new DataProcessingException("Couldn't get a list of categories "
                    + "from categories database.", e);
        }
        return categories;
    }

    @Override
    public Category update(Category category) {
        String query = "UPDATE Category SET category_name = ? WHERE category_number = ?";
        try (Connection connection = ConnectionWithDB.getConnection();
                PreparedStatement updateCategoryStatement = connection.prepareStatement(query)) {
            updateCategoryStatement.setString(1, category.getCategoryName());
            updateCategoryStatement.setInt(2, category.getCategoryNumber());
            updateCategoryStatement.executeUpdate();
        } catch (SQLException e) {
            throw new DataProcessingException("Couldn't update " + category + " in categories database.", e);
        }
        return category;
    }

    @Override
    public boolean delete(Integer id) {
        String query = "DELETE FROM Category WHERE category_number = ?";
        try (Connection connection = ConnectionWithDB.getConnection();
                PreparedStatement deleteCategoryStatement = connection.prepareStatement(query)) {
            deleteCategoryStatement.setLong(1, id);
            return deleteCategoryStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new DataProcessingException("Couldn't delete category with id " + id, e);
        }
    }

    @Override
    public List<Category> getAllSortedByName() {
        String query = "SELECT * FROM Category ORDER BY category_name";
        List<Category> categories = new ArrayList<>();
        try (Connection connection = ConnectionWithDB.getConnection();
                PreparedStatement getAllCategoriesStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = getAllCategoriesStatement.executeQuery();
            while (resultSet.next()) {
                categories.add(parseCategoryFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            throw new DataProcessingException("Couldn't get a list of categories "
                    + "from categories database.", e);
        }
        return categories;
    }

    private Category parseCategoryFromResultSet(ResultSet resultSet) throws SQLException {
        Category category = new Category();
        category.setCategoryNumber(resultSet.getInt("category_number"));
        category.setCategoryName(resultSet.getString("category_name"));
        return category;
    }

    public Map<String, Object> getCategoryStatistics() {
        String query = "SELECT Category.category_name, " +
                    "COUNT(Product.id_product) AS total_products, " +
                    "COUNT(Store_Product.id_product) AS total_store_products, " +
                    "MIN(Store_Product.selling_price) AS min_price, " +
                    "AVG(Store_Product.selling_price) AS avg_price, " +
                    "MAX(Store_Product.selling_price) AS max_price " +
                    "FROM Category LEFT JOIN Product ON Category.category_number = Product.category_number " +
                    "LEFT JOIN Store_Product ON Product.id_product = Store_Product.id_product " +
                    "GROUP BY Category.category_name";

        Map<String, Object> categoryStatistics = new HashMap<>();

        try (Connection connection = ConnectionWithDB.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                String categoryName = resultSet.getString("category_name");
                int totalProducts = resultSet.getInt("total_products");
                int totalStoreProducts = resultSet.getInt("total_store_products");
                BigDecimal minPrice = resultSet.getBigDecimal("min_price");
                BigDecimal avgPrice = resultSet.getBigDecimal("avg_price");
                BigDecimal maxPrice = resultSet.getBigDecimal("max_price");

                Map<String, Object> productData = new HashMap<>();
                productData.put("total_products", totalProducts);
                productData.put("total_store_products", totalStoreProducts);
                productData.put("min_price", minPrice);
                productData.put("avg_price", avgPrice);
                productData.put("max_price", maxPrice);

                categoryStatistics.put(categoryName, productData);
            }
        } catch (SQLException e) {
            throw new DataProcessingException("Couldn't retrieve category product data.", e);
        }

        return categoryStatistics;
    }
}
