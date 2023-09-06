package com.kalaazu.service;

import com.kalaazu.model.Keybinding;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Game settings service.
 * ======================
 * <p>
 * Service for the in game settings.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class GameSettingsService {
    public List<Keybinding> getDefaultKeybindings() {
        var keybindings = new ArrayList<Keybinding>();

        keybindings.add(getKeybinding(7, 0, 0, 49));
        keybindings.add(getKeybinding(7, 0, 1, 50));
        keybindings.add(getKeybinding(7, 0, 2, 51));
        keybindings.add(getKeybinding(7, 0, 3, 52));
        keybindings.add(getKeybinding(7, 0, 4, 53));
        keybindings.add(getKeybinding(7, 0, 5, 54));
        keybindings.add(getKeybinding(7, 0, 6, 55));
        keybindings.add(getKeybinding(7, 0, 7, 56));
        keybindings.add(getKeybinding(7, 0, 8, 57));
        keybindings.add(getKeybinding(7, 0, 9, 48));
        keybindings.add(getKeybinding(8, 0, 0, 112));
        keybindings.add(getKeybinding(8, 0, 1, 113));
        keybindings.add(getKeybinding(8, 0, 2, 114));
        keybindings.add(getKeybinding(8, 0, 3, 115));
        keybindings.add(getKeybinding(8, 0, 4, 116));
        keybindings.add(getKeybinding(8, 0, 5, 117));
        keybindings.add(getKeybinding(8, 0, 6, 118));
        keybindings.add(getKeybinding(8, 0, 7, 119));
        keybindings.add(getKeybinding(8, 0, 8, 120));
        keybindings.add(getKeybinding(8, 0, 9, 121));
        keybindings.add(getKeybinding(0, 0, 0, 74));
        keybindings.add(getKeybinding(1, 0, 0, 67));
        keybindings.add(getKeybinding(2, 0, 0, 17));
        keybindings.add(getKeybinding(3, 0, 0, 32));
        keybindings.add(getKeybinding(4, 0, 0, 69));
        keybindings.add(getKeybinding(5, 0, 0, 82));
        keybindings.add(getKeybinding(13, 0, 0, 68));
        keybindings.add(getKeybinding(6, 0, 0, 76));
        keybindings.add(getKeybinding(9, 0, 0, 72));
        keybindings.add(getKeybinding(10, 0, 0, 70));
        keybindings.add(getKeybinding(11, 0, 0, 107));
        keybindings.add(getKeybinding(12, 0, 0, 109));
        keybindings.add(getKeybinding(14, 0, 0, 13));
        keybindings.add(getKeybinding(15, 0, 0, 9));
        keybindings.add(getKeybinding(8, 0, 9, 121));
        keybindings.add(getKeybinding(16, 0, 0, 16));

        return keybindings;
    }

    private Keybinding getKeybinding(int actionType, int charCode, int parameter, int key) {
        return new Keybinding((short) actionType, (short) charCode, parameter, List.of(key));
    }
}
