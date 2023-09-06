package com.kalaazu.service;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Items service.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Service
public class ItemsService {
    /**
     * @return Default account starting items.
     */
    public Map<Short, Integer> getDefaultStartingItems() {
        var items = new HashMap<Short, Integer>();

        // Credits
        items.put((short) 1, 150_000);
        // Uridium
        items.put((short) 2, 10_000);
        // Jackpot
        items.put((short) 3, 0);
        // Exp
        items.put((short) 4, 0);
        // Honor
        items.put((short) 5, 0);

        // LCB-10
        items.put((short) 59, 10_000);
        // R-310
        items.put((short) 87, 1_000);

        // LF-1
        items.put((short) 121, 1);
        // REP-1
        items.put((short) 164, 1);
        return items;
    }
}
