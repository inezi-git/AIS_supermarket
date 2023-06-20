package supermarket.service;

import supermarket.model.CategoryMaxPriceProduct;
import supermarket.model.Product;
import supermarket.model.ProductStat;
import supermarket.model.StoreProduct;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

public interface StoreProductService extends BasicService<StoreProduct, String> {
    List<StoreProduct> getAllSortedByAmount();

    Map<String, Object> getStoreProductDataByUpc(String upc);

    List<StoreProduct> getAllPromotionalSortedByAmountAndName();

    List<StoreProduct> getAllNonPromotionalSortedByAmountAndName();

    List<StoreProduct> getStoreProductsByName(String name);
}
