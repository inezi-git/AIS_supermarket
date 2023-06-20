package supermarket.dao;

import supermarket.model.StoreProduct;

import java.util.List;
import java.util.Map;

public interface StoreProductDao extends BasicDao<StoreProduct, String> {
    List<StoreProduct> getAllSortedByAmount();

    Map<String, Object> getStoreProductDataByUpc(String upc);

    List<StoreProduct> getAllPromotionalSortedByAmountAndName();

    List<StoreProduct> getAllNonPromotionalSortedByAmountAndName();

    List<StoreProduct> getStoreProductsByName(String name);
}
