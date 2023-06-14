package supermarket.service.impl;

import supermarket.dao.SaleDao;
import supermarket.lib.Inject;
import supermarket.lib.Service;
import supermarket.model.Check;
import supermarket.model.Sale;
import supermarket.service.SaleService;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class SaleServiceImpl implements SaleService {
    @Inject
    private SaleDao saleDao;

    @Override
    public Sale save(Sale sale) {
        return saleDao.save(sale);
    }

    @Override
    public List<Sale> getSalesByCheck(Check check) {
        return saleDao.getSalesByCheckNumber(check.getCheckNumber());
    }

    @Override
    public List<Sale> getSalesByUpcAndDateRange(String upc, LocalDateTime from, LocalDateTime to) {
        return saleDao.getSalesByUpcAndDateRange(upc, from, to);
    }

    @Override
    public List<Sale> getSalesByCashierAndDateRange(String cashierId, LocalDateTime from, LocalDateTime to) {
        return saleDao.getSalesByCashierAndDateRange(cashierId, from, to);
    }

    @Override
    public List<Sale> getSalesByDateRange(LocalDateTime from, LocalDateTime to) {
        return saleDao.getSalesByDateRange(from, to);
    }
}
