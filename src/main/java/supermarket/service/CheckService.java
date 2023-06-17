package supermarket.service;

import supermarket.model.Check;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public interface CheckService extends BasicService<Check, String> {
    List<Check> getAllByToday(String employeeId);

    List<Check> getAllChecksByCashier(String cashierId);

    List<Check> getAllChecksByPeriod(LocalDateTime from, LocalDateTime to);

    List<Check> getAllChecksByCashierAndPeriod(String employeeId,
                                               LocalDateTime from, LocalDateTime to);

}