package supermarket.dao;

import supermarket.model.Sale;
import java.time.LocalDateTime;
import java.util.List;

public interface SaleDao {
    Sale save(Sale sale);

    List<Sale> getSalesByCheckNumber(String checkNumber);
}
