package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu {

import package_104.class_275;
import package_104.class_276;
import package_104.class_277;
import package_104.class_278;
import package_104.class_279;
import package_104.class_280;

public class ItemsControlMenuConstants {

    public static const MENU_ID: String = "itemsControlMenu";

    public static const MAX_ITEMS_ON_LIST: int = 10;

    public static const MENU_BOTTOM_MARGIN: int = 60;

    public static const HIGHLIGHT_FLASH: String = "highlightFlash";

    public static const HIGHLIGHT_FLASH_WITH_ARROW: String = "highlightFlashWithArrow";

    public static const HIGHLIGHT_RED_BLING: String = "highlightRedBlink";

    public static const HIGHLIGHT_DURATIONS: Object = {
        "highlightFlash": 0.2,
        "highlightFlashWithArrow": 0.4,
        "highlightRedBlink": 0.2
    };

    public static const CATEGORY_BAR: String = "categoryBar";

    public static const STANDARD_SLOT_BAR: String = "standardSlotBar";

    public static const PREMIUM_SLOT_BAR: String = "premiumSlotBar";

    public static const PRO_ACTION_BAR: String = "proActionBar";

    public static const ICONS_ATLAS_XML: String = "itemsControlMenu_atlasXml";

    public static const ICONS_TEXTURE: String = "itemsControlMenu_texture";

    public static const ICONS_BITMAP_ATLAS: String = "itemsControlMenuBitmapAtlas";

    public static const BITMAP_FONT_ATLAS_XML: String = "bitmapFont_atlasXml";

    public static const BITMAP_FONT_TEXTURE: String = "bitmapFont_texture";

    public static const LAYOUTS_QUEUE: Vector.<String> = new <String>[class_278.ID, class_279.ID, class_276.ID, class_277.ID];

    public static const LAYOUTS_QUEUE_PRO_ACTION: Vector.<String> = new <String>[class_280.ID, class_275.ID, class_276.ID, class_278.ID];

    public static const COUNTER_TYPE_NONE: String = "none";

    public static const COUNTER_TYPE_COUNTER_NUMBER: String = "number";

    public static const COUNTER_TYPE_COUNTER_BAR: String = "bar";

    public static const COUNTER_TYPE_COUNTER_DOTS: String = "dots";

    public static const STYLE_DEFAULT: Number = 0;

    public static const STYLE_WHITE: Number = 16777215;

    public static const STYLE_BRIGHT_GRAY: Number = 13421772;

    public static const STYLE_RED: Number = 11614778;

    public static const STYLE_GREEN: Number = 42496;

    public static const STYLE_YELLOW: Number = 16763649;

    public static const STYLE_BLUE: Number = 5798845;

    public static const STYLE_BLUE_BRIGHT: Number = 9681351;

    public static const STYLE_CYAN: Number = 65535;

    public static const STYLE_ORANGE: Number = 16737843;

    public static const ACTION_ONE_SHOT: String = "oneShot";

    public static const ACTION_TOOGLE: String = "toogle";

    public static const ACTION_SELECTION: String = "selection";

    public static const ACTION_TIMER: String = "timer";

    public static const TIMER_STATE_READY: String = "ready";

    public static const TIMER_STATE_ACTIVE: String = "active";

    public static const TIMER_STATE_COOLING_DOWN: String = "coolingDown";

    public static const ACTION_STYLES_MAP: Object = {
        "0": ACTION_ONE_SHOT,
        "1": ACTION_TOOGLE,
        "2": ACTION_SELECTION,
        "3": ACTION_TIMER
    };

    public static const COUNTER_TYPES_MAP: Object = {
        "0": COUNTER_TYPE_NONE,
        "1": COUNTER_TYPE_COUNTER_NUMBER,
        "2": COUNTER_TYPE_COUNTER_BAR,
        "3": COUNTER_TYPE_COUNTER_DOTS
    };

    public static const COUNTER_STYLES_MAP: Object = {
        "0": STYLE_DEFAULT,
        "1": STYLE_RED,
        "2": STYLE_GREEN,
        "3": STYLE_YELLOW,
        "4": STYLE_BLUE,
        "5": STYLE_CYAN,
        "6": STYLE_ORANGE
    };

    public static const TIMER_STATES_MAP: Object = {
        "0": TIMER_STATE_READY,
        "1": TIMER_STATE_ACTIVE,
        "2": TIMER_STATE_COOLING_DOWN
    };

    public static const TOOLTIPS_STYLES_MAP: Object = {
        "0": STYLE_BRIGHT_GRAY,
        "1": STYLE_RED
    };


    public function ItemsControlMenuConstants() {
        super();
    }
}
}
