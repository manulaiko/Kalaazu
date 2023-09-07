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
    public Map<String, Integer> getDefaultStartingItems() {
        var items = new HashMap<String, Integer>();

        // Credits
        items.put("currency_credits", 150_000);
        // Uridium
        items.put("currency_uridium", 10_000);
        // Jackpot
        items.put("currency_jackpot", 0);
        // Exp
        items.put("stats_experience", 0);
        // Honor
        items.put("stats_honor", 0);

        // LCB-10
        items.put("ammunition_laser_lcb-10", 10_000);
        // R-310
        items.put("ammunition_rocket_r-310", 1_000);

        // LF-1
        items.put("equipment_weapon_laser_lf-1", 1);
        // REP-1
        items.put("equipment_extra_repbot_rep-1", 1);

        return items;
    }
}
