package com.kalaazu.model;

import java.util.List;

/**
 * Keybinding model.
 * =================
 * <p>
 * Represents game settings keybindings.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
public record Keybinding(
        short actionType,
        short charCode,
        int parameter,
        List<Integer> keys
) {
}
