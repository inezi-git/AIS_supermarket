package supermarket.service.impl;

import supermarket.dao.StoreProductDao;
import supermarket.lib.Inject;
import supermarket.lib.Service;
import supermarket.model.CategoryMaxPriceProduct;
import supermarket.model.ProductStat;
import supermarket.model.StoreProduct;
import supermarket.service.StoreProductService;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
public class StoreProductServiceImpl implements StoreProductService {

    @Inject
    private StoreProductDao storeProductDao;

    @Override
    public StoreProduct create(StoreProduct storeProduct) {
        return storeProductDao.save(storeProduct);
    }

    @Override
    public StoreProduct get(String s) {
        return storeProductDao.get(s).orElse(null);
    }

    @Override
    public List<StoreProduct> getAll() {
        return storeProductDao.getAll();
    }

    @Override
    public StoreProduct update(StoreProduct storeProduct) {
        return storeProductDao.update(storeProduct);
    }

    @Override
    public boolean delete(String s) {
        return storeProductDao.delete(s);
    }

    @Override
    public List<StoreProduct> getAllSortedByAmount() {
        return storeProductDao.getAllSortedByAmount();
    }

    @Override
    public Map<String, Object> getStoreProductDataByUpc(String upc) {
        return storeProductDao.getStoreProductDataByUpc(upc);
    }

    @Override
    public List<StoreProduct> getAllPromotionalSortedByAmountAndName() {
        return storeProductDao.getAllPromotionalSortedByAmountAndName();
    }

    @Override
    public List<StoreProduct> getAllNonPromotionalSortedByAmountAndName() {
        return storeProductDao.getAllNonPromotionalSortedByAmountAndName();
    }
}
