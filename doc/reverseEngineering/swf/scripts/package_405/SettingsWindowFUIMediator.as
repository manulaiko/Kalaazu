package package_405 {

import com.greensock.TweenNano;

import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.BlurFilter;
import flash.system.System;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.ui.Mouse;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.fui.components.bars.SliderNStepsEvent;
import net.bigpoint.darkorbit.fui.components.bars.TabBarEvent;
import net.bigpoint.darkorbit.fui.components.buttons.checkbox.CheckBoxEvent;
import net.bigpoint.darkorbit.fui.components.core.InvalidationType;
import net.bigpoint.darkorbit.fui.components.core.data.VectorCollection;
import net.bigpoint.darkorbit.fui.components.list.dropdownbox.DropDownBox;
import net.bigpoint.darkorbit.fui.components.list.dropdownbox.DropDownBoxEvent;
import net.bigpoint.darkorbit.fui.components.tooltip.DefaultTooltipDataAssigner;
import net.bigpoint.darkorbit.gui.windows.class_57;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.configurationModePopup.ConfigModePopupMediator;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.configurationModePopup.components.ConfigModePopup;
import net.bigpoint.darkorbit.net.class_59;
import net.bigpoint.darkorbit.settings.Settings;

import org.puremvc.as3.multicore.patterns.observer.Notification;

import package_11.class_39;

import package_30.class_185;
import package_30.class_218;
import package_30.class_219;
import package_30.class_91;

import package_31.class_92;

import package_33.class_93;

import package_38.class_783;

import package_406.class_2302;
import package_406.class_2532;
import package_406.class_2533;
import package_406.class_2534;
import package_406.class_2535;

import package_46.class_131;

import package_70.SimpleWindowEvent;

import package_73.class_196;

import package_9.ResourceManager;

public class SettingsWindowFUIMediator extends class_92 {

    public static const NAME: String = "SettingsWindowFUIMediator";


    private var var_841: class_131;

    public function SettingsWindowFUIMediator(param1: class_2296, param2: class_131) {
        super(NAME, param1);
        this.var_841 = param2;
        this.view.tabbar.addEventListener(TabBarEvent.EVENT_SELECTION_CHANGED, this.method_5006);
        this.view.method_5107.addEventListener(MouseEvent.CLICK, this.method_3544);
        this.view.method_801.addEventListener(MouseEvent.CLICK, this.method_1503);
        this.view.method_4031.addEventListener(MouseEvent.CLICK, this.method_4043);
        this.view.use2D.addEventListener(MouseEvent.CLICK, this.method_4714);
        this.view.advanced.addEventListener(CheckBoxEvent.EVENT_SELECTION_CHANGED, this.method_1861);
        this.view.method_1139.addEventListener(SliderNStepsEvent.SLIDER_VALUE_CHANGED, this.method_5517);
        this.view.method_4056.addEventListener(DropDownBoxEvent.SELECTED_ENTRY_CHANGED, this.method_6041);
        this.view.method_4056.addEventListener(DropDownBoxEvent.DROPPED_DOWN, this.method_2870);
        this.view.method_1279.addEventListener(DropDownBoxEvent.SELECTED_ENTRY_CHANGED, this.method_6268);
        this.view.method_1279.addEventListener(DropDownBoxEvent.DROPPED_DOWN, this.method_2870);
        this.view.method_6445.addEventListener(DropDownBoxEvent.SELECTED_ENTRY_CHANGED, this.method_1585);
        this.view.method_6445.addEventListener(DropDownBoxEvent.DROPPED_DOWN, this.method_2870);
        this.view.method_6102.addEventListener(DropDownBoxEvent.SELECTED_ENTRY_CHANGED, this.method_5179);
        this.view.method_6102.addEventListener(DropDownBoxEvent.DROPPED_DOWN, this.method_2870);
        this.view.method_3935.addEventListener(DropDownBoxEvent.SELECTED_ENTRY_CHANGED, this.method_2888);
        this.view.method_3935.addEventListener(DropDownBoxEvent.DROPPED_DOWN, this.method_2870);
        this.view.method_703.addEventListener(DropDownBoxEvent.SELECTED_ENTRY_CHANGED, this.method_4675);
        this.view.method_703.addEventListener(DropDownBoxEvent.DROPPED_DOWN, this.method_2870);
        this.view.method_1284.addEventListener(DropDownBoxEvent.SELECTED_ENTRY_CHANGED, this.method_2108);
        this.view.method_1284.addEventListener(DropDownBoxEvent.DROPPED_DOWN, this.method_2870);
        this.view.method_2576.addEventListener(DropDownBoxEvent.SELECTED_ENTRY_CHANGED, this.method_815);
        this.view.method_2576.addEventListener(DropDownBoxEvent.DROPPED_DOWN, this.method_2870);
        this.view.method_6387.addEventListener(DropDownBoxEvent.SELECTED_ENTRY_CHANGED, this.method_106);
        this.view.method_6387.addEventListener(DropDownBoxEvent.DROPPED_DOWN, this.method_2870);
        this.view.method_4457.addEventListener(DropDownBoxEvent.SELECTED_ENTRY_CHANGED, this.method_2356);
        this.view.method_4457.addEventListener(DropDownBoxEvent.DROPPED_DOWN, this.method_2870);
        this.view.method_1223.addEventListener(DropDownBoxEvent.SELECTED_ENTRY_CHANGED, this.method_5957);
        this.view.method_1223.addEventListener(DropDownBoxEvent.DROPPED_DOWN, this.method_2870);
        this.view.method_2129.addEventListener(DropDownBoxEvent.SELECTED_ENTRY_CHANGED, this.method_5981);
        this.view.method_2129.addEventListener(DropDownBoxEvent.DROPPED_DOWN, this.method_2870);
        this.view.method_1597.addEventListener(DropDownBoxEvent.SELECTED_ENTRY_CHANGED, this.method_5160);
        this.view.method_1597.addEventListener(DropDownBoxEvent.DROPPED_DOWN, this.method_2870);
        this.view.method_3419.addEventListener(DropDownBoxEvent.SELECTED_ENTRY_CHANGED, this.method_2488);
        this.view.method_3419.addEventListener(DropDownBoxEvent.DROPPED_DOWN, this.method_2870);
        this.view.method_2761.addEventListener(CheckBoxEvent.EVENT_SELECTION_CHANGED, this.method_2156);
        this.view.method_4459.addEventListener(CheckBoxEvent.EVENT_SELECTION_CHANGED, this.method_2713);
        this.view.method_1879.addEventListener(CheckBoxEvent.EVENT_SELECTION_CHANGED, this.method_4725);
        this.view.method_4351.addEventListener(CheckBoxEvent.EVENT_SELECTION_CHANGED, this.method_4783);
        this.view.autoLogin.addEventListener(CheckBoxEvent.EVENT_SELECTION_CHANGED, this.method_3353);
        this.view.doubleClickAttack.addEventListener(CheckBoxEvent.EVENT_SELECTION_CHANGED, this.method_834);
        this.view.method_6156.addEventListener(CheckBoxEvent.EVENT_SELECTION_CHANGED, this.method_5699);
        this.view.showBattlerayNotifications.addEventListener(CheckBoxEvent.EVENT_SELECTION_CHANGED, this.method_4276);
        this.view.showLowHpWarning.addEventListener(CheckBoxEvent.EVENT_SELECTION_CHANGED, this.method_3865);
        this.view.method_6155.addEventListener(class_2531.LISTED_CHECKBOX_CHANGED, this.method_86);
        this.view.method_1689.addEventListener(MouseEvent.CLICK, this.method_1912);
        this.view.playCombatMusic.addEventListener(CheckBoxEvent.EVENT_SELECTION_CHANGED, this.method_2651);
        this.view.method_2475.addEventListener(SliderNStepsEvent.SLIDER_VALUE_CHANGED, this.method_6240);
        this.view.musicVolume.addEventListener(SliderNStepsEvent.SLIDER_VALUE_CHANGED, this.method_1967);
        this.view.method_4421.addEventListener(SliderNStepsEvent.SLIDER_VALUE_CHANGED, this.method_3213);
        this.view.method_4256.addEventListener(class_2531.LISTED_KEYBINDING_CHANGED, this.method_893);
        this.view.method_4256.addEventListener(class_2531.NOW_LISTENING_FOR_KEYBINDING, this.method_1711);
        this.method_2293();
        this.method_5006();
        method_2176(class_196.SETTINGS_WINDOW_FUI_MODEL_CHANGED, this.method_1288);
        method_2176(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON, this.method_3260);
    }

    private function method_3260(param1: Notification): void {
        this.view.method_5107.enabled = true;
    }

    private function method_1711(param1: class_2531): void {
        this.view.method_5610.visible = true;
    }

    public function method_3027(): void {
        this.view.busyMC.visible = true;
        this.view.method_3367.filters = [new BlurFilter()];
        TweenNano.delayedCall(1, this.method_3082);
    }

    private function method_3082(): void {
        this.view.method_3367.filters = [];
        this.view.busyMC.visible = false;
    }

    private function method_1503(param1: Event): void {
        this.method_2663();
        this.view.method_5107.enabled = false;
        this.method_3027();
    }

    private function method_2663(param1: Event = null): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_CANCEL_SETTINGS);
    }

    private function method_4043(param1: MouseEvent): void {
        var _loc2_: * = null;
        _loc2_ = guiManager.createWindow(GuiConstants.RESET_PROMPT_WINDOW, null, class_131.const_3085) as class_131;
        guiManager.method_6185().name_47.method_6313().addChild(_loc2_);
        var _loc3_: class_93 = new class_93(guiManager, class_93.const_1053);
        var _loc4_: class_219 = new class_219(280, 80, new TextFormat(), "");
        var _loc5_: TextFormat;
        (_loc5_ = new TextFormat(class_18.const_2442.font, class_18.const_3317, 16777215)).align = TextFormatAlign.CENTER;
        var _loc6_: TextField;
        (_loc6_ = _loc4_.textField).defaultTextFormat = _loc5_;
        _loc6_.embedFonts = class_18.var_3809;
        _loc6_.antiAliasType = AntiAliasType.ADVANCED;
        _loc6_.autoSize = TextFieldAutoSize.CENTER;
        _loc6_.wordWrap = true;
        _loc6_.multiline = true;
        _loc6_.width = 280;
        _loc6_.text = class_88.getItem("resetSettings");
        _loc3_.addElement(_loc4_);
        _loc3_.x = 16;
        _loc3_.y = 32;
        var _loc7_: class_39 = class_39(ResourceManager.name_15.getFinisher("ui"));
        var _loc8_: class_218;
        (_loc8_ = new class_218(class_185.const_2597, class_88.getItem("dest_ok"), _loc7_.getEmbeddedMovieClip("button1"))).addEventListener(MouseEvent.CLICK, this.method_1264);
        _loc3_.addElement(_loc8_, class_93.const_1191);
        _loc8_.x -= _loc8_.width;
        var _loc9_: class_218;
        (_loc9_ = new class_218(class_185.const_2551, class_88.getItem("btn_cancel"), _loc7_.getEmbeddedMovieClip("button1"))).addEventListener(MouseEvent.CLICK, this.method_1790);
        _loc3_.addElement(_loc9_, class_93.const_2568);
        _loc2_.method_1655(_loc3_);
        _loc2_.method_1321(true);
    }

    private function method_1264(param1: MouseEvent): void {
        guiManager.method_6185().method_6154().sendRequest(new class_783());
        class_59.call(class_59.const_2459, [false], System.exit, [0]);
    }

    private function method_1226(): void {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc1_: class_131 = guiManager.method_468(GuiConstants.RESET_PROMPT_WINDOW);
        var _loc2_: class_93 = _loc1_.method_3694(class_93.const_1053);
        var _loc3_: Array = _loc2_.method_1864();
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_.length) {
            if ((_loc5_ = _loc3_[_loc4_]).getID() == class_91.const_2623) {
                if ((_loc6_ = class_218(_loc5_)).getID() == class_185.const_2597) {
                    _loc6_.removeEventListener(MouseEvent.CLICK, this.method_1264);
                }
                if (_loc6_.getID() == class_185.const_2551) {
                    _loc6_.removeEventListener(MouseEvent.CLICK, this.method_1790);
                }
            }
            _loc4_++;
        }
        guiManager.closeWindow(_loc1_);
    }

    private function method_1790(param1: MouseEvent): void {
        this.method_1226();
    }

    private function method_1288(param1: Notification): void {
        var _loc2_: class_2302 = param1.getBody() as class_2302;
        this.view.use2D.selection = _loc2_.use2D;
        this.view.advanced.selection = _loc2_.advanced;
        this.view.method_1139.currentStep = _loc2_.method_3958 + 1;
        this.view.method_4056.currentEntry = _loc2_.method_4640;
        this.view.method_1279.currentEntry = Math.min(2, _loc2_.method_5112);
        this.view.method_6445.currentEntry = Math.min(1, _loc2_.method_3387);
        this.view.method_6102.currentEntry = _loc2_.method_2536;
        this.view.method_3935.currentEntry = _loc2_.method_5151;
        this.view.method_703.currentEntry = Math.min(2, _loc2_.method_5596);
        this.view.method_1284.currentEntry = _loc2_.displaySetting3DqualityAntialias;
        this.view.method_2576.currentEntry = _loc2_.displaySetting3DqualityLights;
        this.view.method_6387.currentEntry = _loc2_.displaySetting3DqualityTextures;
        this.view.method_4457.currentEntry = _loc2_.displaySetting3DsizeTextures;
        this.view.method_1223.currentEntry = _loc2_.displaySetting3DqualityEffects;
        this.view.method_2129.currentEntry = _loc2_.displaySetting3DtextureFiltering;
        this.view.method_1597.currentEntry = _loc2_.name_44;
        this.view.method_3419.currentEntry = _loc2_.name_16;
        this.view.method_2761.selection = _loc2_.method_2761;
        this.view.method_4459.selection = _loc2_.method_4459;
        this.view.method_1879.selection = _loc2_.method_1879;
        this.view.method_4351.selection = _loc2_.method_5692;
        this.view.autoLogin.selection = _loc2_.autoLogin;
        this.view.doubleClickAttack.selection = _loc2_.doubleClickAttack;
        this.view.method_6156.selection = _loc2_.method_6156;
        this.view.showBattlerayNotifications.selection = _loc2_.method_4733;
        this.view.showLowHpWarning.selection = _loc2_.showLowHpWarnings;
        var _loc3_: Vector.<class_2535> = new Vector.<class_2535>();
        _loc3_.push(new class_2535(class_2535.const_1182, _loc2_.method_3208, "sett_setting5", null));
        _loc3_.push(new class_2535(class_2535.const_105, _loc2_.method_2364, "sett_setting8", null));
        _loc3_.push(new class_2535(class_2535.const_22, _loc2_.method_6273, "sett_setting9", null));
        _loc3_.push(new class_2535(class_2535.const_3219, _loc2_.method_706, "sett_setting12", null));
        _loc3_.push(new class_2535(class_2535.const_2796, _loc2_.method_3810, "sett_setting18", null));
        _loc3_.push(new class_2535(class_2535.const_3254, _loc2_.method_5736, "sett_setting20", null));
        _loc3_.push(new class_2535(class_2535.const_3322, _loc2_.method_525, "sett_setting21", null));
        _loc3_.push(new class_2535(class_2535.const_2206, _loc2_.method_2596, "setting_minimap_background_image", null));
        _loc3_.push(new class_2535(class_2535.const_3256, _loc2_.method_5392, "setting_displayNotifications", null));
        _loc3_.push(new class_2535(class_2535.const_1845, _loc2_.autoQualityReduction, "setting_allow_auto_quality", "ttip_setting_allow_auto_quality"));
        _loc3_.push(new class_2535(class_2535.const_213, _loc2_.hoverShips, "setting_hover_ships", "ttip_setting_hover_ships"));
        _loc3_.push(new class_2535(class_2535.const_1947, _loc2_.method_2258, "sett_setting14", null));
        _loc3_.push(new class_2535(class_2535.const_3213, _loc2_.name_154, "setting_alwaysDraggableWindows", null));
        _loc3_.push(new class_2535(class_2535.const_484, _loc2_.method_4912, "setting_displayWindowsBackground", null));
        _loc3_.push(new class_2535(class_2535.const_1560, _loc2_.method_6233, "setting_display_premium_quickslot", "ttip_setting_premium_quickslot"));
        _loc3_.push(new class_2535(class_2535.const_1003, _loc2_.proActionBarEnabled, "setting_pro_action_bar_enabled", null));
        _loc3_.push(new class_2535(class_2535.const_2539, _loc2_.proActionBarAutohideEnabled, "setting_auto_hide_pro_action_bar_enabled", null));
        _loc3_.push(new class_2535(class_2535.const_2189, _loc2_.proActionBarKeyboardInputEnabled, "pro_action_bar_keyboard_input_enabled", null));
        this.view.method_6155.list = new VectorCollection(_loc3_);
        this.view.playCombatMusic.selection = _loc2_.playCombatMusic;
        this.view.method_2475.currentStep = _loc2_.method_6008;
        this.view.musicVolume.currentStep = _loc2_.musicVolume;
        this.view.method_4421.currentStep = _loc2_.method_4421;
        var _loc4_: Vector.<class_2534>;
        (_loc4_ = new Vector.<class_2534>()).push(this.method_1862(_loc2_, class_2534.const_660, "keyboard_action_activate_slot", 1));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_2872, "keyboard_action_activate_slot", 2));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_168, "keyboard_action_activate_slot", 3));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_2346, "keyboard_action_activate_slot", 4));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_2562, "keyboard_action_activate_slot", 5));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_1580, "keyboard_action_activate_slot", 6));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_726, "keyboard_action_activate_slot", 7));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_2247, "keyboard_action_activate_slot", 8));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_1989, "keyboard_action_activate_slot", 9));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_2619, "keyboard_action_activate_slot", 0));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_855, "keyboard_action_activate_premium_slot", 1));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_790, "keyboard_action_activate_premium_slot", 2));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_1225, "keyboard_action_activate_premium_slot", 3));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_3153, "keyboard_action_activate_premium_slot", 4));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_1412, "keyboard_action_activate_premium_slot", 5));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_1699, "keyboard_action_activate_premium_slot", 6));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_1604, "keyboard_action_activate_premium_slot", 7));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_2056, "keyboard_action_activate_premium_slot", 8));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_171, "keyboard_action_activate_premium_slot", 9));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_671, "keyboard_action_activate_premium_slot", 0));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_2504, "keyboard_action_activate_jump_gate"));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_1957, "keyboard_action_toggle_config"));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_1736, "keyboard_action_laser_attack"));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_1805, "keyboard_action_rocket_attack"));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_2590, "keyboard_action_activate_pet"));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_1705, "keyboard_action_guard_mode"));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_2550, "keyboard_action_combo_repair_mode"));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_1950, "keyboard_action_logout"));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_2599, "keyboard_action_toggle_windows"));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_538, "keyboard_action_toggle_monitoring"));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_2964, "keyboard_action_zoom_in"));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_2781, "keyboard_action_zoom_out"));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_3144, "keyboard_action_focus_chat"));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_1824, "keyboard_action_toggle_category_bar"));
        _loc4_.push(this.method_1862(_loc2_, class_2534.const_2439, "keyboard_action_show_pro_action_bar"));
        this.view.method_4256.list = new VectorCollection(_loc4_);
        this.method_2293();
        this.view.method_5107.enabled = false;
    }

    private function method_1862(param1: class_2302, param2: int, param3: String, param4: int = -1): class_2534 {
        if (param1.method_3956[param2] is int) {
            return new class_2534(param2, param3, param1.method_3956[param2], param4);
        }
        var _loc5_: Vector.<int>;
        if ((Boolean(_loc5_ = param1.method_3956[param2] as Vector.<int>)) && _loc5_.length > 0) {
            return new class_2534(param2, param3, _loc5_[0], param4);
        }
        return new class_2534(param2, param3, -1, param4);
    }

    private function method_1912(param1: MouseEvent): void {
        var _loc2_: ConfigModePopup = ConfigModePopup(class_57.getInstance().createWindow(class_57.const_663, class_57.const_2956));
        if (!facade.hasMediator(ConfigModePopupMediator.NAME)) {
            facade.registerMediator(new ConfigModePopupMediator(_loc2_));
        }
        sendNotification(GuiNotifications.MANAGE_MENUS_CONFIG_MODE, true);
        sendNotification(GuiNotifications.MINIMIZE_WINDOW_BY_ID, GuiConstants.SETTINGS_WINDOW);
    }

    private function method_2870(param1: DropDownBoxEvent): void {
        var _loc2_: * = null;
        for each(_loc2_ in this.view.method_1858) {
            if (_loc2_ != param1.target) {
                _loc2_.forceCollapse();
            }
        }
    }

    private function method_6041(param1: DropDownBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2532(class_2532.const_741, param1.index));
    }

    private function method_6268(param1: DropDownBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2532(class_2532.const_1878, param1.index));
    }

    private function method_1585(param1: DropDownBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2532(class_2532.const_620, param1.index));
    }

    private function method_5179(param1: DropDownBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2532(class_2532.const_1635, param1.index));
    }

    private function method_2888(param1: DropDownBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2532(class_2532.const_307, param1.index));
    }

    private function method_4675(param1: DropDownBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2532(class_2532.const_2822, param1.index));
    }

    private function method_2108(param1: DropDownBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2532(class_2532.const_1472, param1.index));
    }

    private function method_815(param1: DropDownBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2532(class_2532.const_1222, param1.index));
    }

    private function method_106(param1: DropDownBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2532(class_2532.const_1430, param1.index));
    }

    private function method_2356(param1: DropDownBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2532(class_2532.const_1682, param1.index));
    }

    private function method_5957(param1: DropDownBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2532(class_2532.const_3009, param1.index));
    }

    private function method_5981(param1: DropDownBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2532(class_2532.const_1731, param1.index));
    }

    private function method_5160(param1: DropDownBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2532(class_2532.const_1415, param1.index));
    }

    private function method_2488(param1: DropDownBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2532(class_2532.const_1555, param1.index));
    }

    private function method_5517(param1: SliderNStepsEvent): void {
        var _loc4_: * = null;
        var _loc2_: int = param1.value;
        var _loc3_: int = param1.maxValue;
        if (!this.view.advanced.selection) {
            _loc4_ = new <String>["quality_low", "quality_medium", "quality_good", "quality_high"];
            this.view.method_5869.text = class_88.getItem(_loc4_[_loc2_ - 1]);
        } else {
            this.view.method_5869.text = class_88.getItem("quality_custom");
        }
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2533(class_2533.const_848, _loc2_, _loc3_));
    }

    private function method_6240(param1: SliderNStepsEvent): void {
        var _loc2_: int = param1.value;
        var _loc3_: int = param1.maxValue;
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2533(class_2533.const_2682, _loc2_, _loc3_));
    }

    private function method_1967(param1: SliderNStepsEvent): void {
        var _loc2_: int = param1.value;
        var _loc3_: int = param1.maxValue;
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2533(class_2533.const_1224, _loc2_, _loc3_));
    }

    private function method_3213(param1: SliderNStepsEvent): void {
        var _loc2_: int = param1.value;
        var _loc3_: int = param1.maxValue;
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2533(class_2533.const_2690, _loc2_, _loc3_));
    }

    override public function onRegister(): void {
        this.method_2293();
        this.var_841.addEventListener(SimpleWindowEvent.const_1770, this.method_2663);
    }

    private function method_2293(): void {
        if (false) {
            this.view.use2D.visible = true;
            this.view.use2DLabel.visible = true;
        } else {
            this.view.use2D.enabled = false;
            this.view.use2D.mouseEnabled = true;
            this.view.use2D.tooltipTemplateID = "commonui_tooltip_simple";
            this.view.use2D.tooltipDataAssigner = new DefaultTooltipDataAssigner();
            this.view.use2D.tooltipData = class_88.getItem("ttip_3d_not_available");
            this.view.use2D.addEventListener(MouseEvent.ROLL_OVER, this.method_4312);
            this.view.use2DLabel.localizedText = "setting_use3D";
        }
        if (this.view.advanced.selection) {
            this.view.method_609.visible = !this.view.use2D.visible || Boolean(this.view.use2D.selection);
            this.view.method_557.visible = !this.view.method_609.visible;
        } else {
            this.view.method_609.visible = false;
            this.view.method_557.visible = false;
        }
    }

    private function method_4312(param1: MouseEvent): void {
        Mouse.cursor = "arrow";
        UISystem.getInstance().tooltipManager.assignTooltipTemplateID(this.view.use2D.tooltipTemplateID, this.view.use2D);
    }

    private function method_4714(param1: MouseEvent = null): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2535(class_2535.const_1066, this.view.use2D.selection));
    }

    private function method_1861(param1: CheckBoxEvent = null): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2535(class_2535.const_2119, this.view.advanced.selection));
        this.method_2293();
    }

    private function method_2156(param1: CheckBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2535(class_2535.const_223, this.view.method_2761.selection));
    }

    private function method_2713(param1: CheckBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2535(class_2535.const_2641, this.view.method_4459.selection));
    }

    private function method_4725(param1: CheckBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2535(class_2535.const_2736, this.view.method_1879.selection));
    }

    private function method_4783(param1: CheckBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2535(class_2535.const_1657, this.view.method_4351.selection));
    }

    private function method_3353(param1: CheckBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2535(class_2535.const_1054, this.view.autoLogin.selection));
    }

    private function method_834(param1: CheckBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2535(class_2535.const_1599, this.view.doubleClickAttack.selection));
    }

    private function method_5699(param1: CheckBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2535(class_2535.const_876, this.view.method_6156.selection));
    }

    private function method_4276(param1: CheckBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2535(class_2535.const_2809, this.view.showBattlerayNotifications.selection));
    }

    private function method_3865(param1: CheckBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2535(class_2535.const_3161, this.view.showLowHpWarning.selection));
    }

    private function method_86(param1: class_2531): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, param1.data);
    }

    private function method_893(param1: class_2531): void {
        var _loc4_: * = null;
        this.view.method_5610.visible = false;
        var _loc2_: class_2534 = param1.data as class_2534;
        var _loc3_: int = 0;
        while (_loc3_ < this.view.method_4256.list.length) {
            _loc4_ = this.view.method_4256.list.getItemAt(_loc3_) as class_2534;
            if (_loc2_.method_4918 == _loc4_.method_4918 && _loc2_.method_3976 != _loc4_.method_3976) {
                _loc4_.method_4918 = -1;
                this.view.method_4256.forceRedraw(InvalidationType.FILLITEMS);
                sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, _loc4_);
            }
            _loc3_++;
        }
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, param1.data);
    }

    private function method_2651(param1: CheckBoxEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED, new class_2535(class_2535.const_3274, this.view.playCombatMusic.selection));
    }

    private function method_5006(param1: TabBarEvent = null): void {
        var _loc2_: int = 0;
        while (_loc2_ < this.view.method_4174.length) {
            this.view.method_4174[_loc2_].visible = this.view.tabbar.currentlyActiveTab == _loc2_;
            _loc2_++;
        }
        this.view.method_4256.dispatchEvent(new class_2531(class_2531.TAB_SWITCHED, null));
        this.view.method_5610.visible = false;
    }

    private function method_3544(param1: MouseEvent): void {
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SAVE_SETTINGS_USER_REQUEST, this.view.tabbar.currentlyActiveTab);
        this.view.method_5107.enabled = false;
        this.method_3027();
    }

    private function get view(): class_2296 {
        return viewComponent as class_2296;
    }
}
}
