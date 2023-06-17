package supermarket.service;

import supermarket.model.Check;
import supermarket.model.Sale;
import java.time.LocalDateTime;
import java.util.List;

public interface SaleService {
    Sale save(Sale sale);

    List<Sale> getSalesByCheck(Check check);
}
