package net.bigpoint.darkorbit.gui.windows {

import flash.events.EventDispatcher;
import flash.utils.Dictionary;

import mx.core.IFlexDisplayObject;
import mx.events.FlexEvent;

import net.bigpoint.darkorbit.gui.class_58;
import net.bigpoint.darkorbit.mvc.arena.view.ArenaTournamentWindow;
import net.bigpoint.darkorbit.mvc.common.view.components.DODowngradeWindow;
import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
import net.bigpoint.darkorbit.mvc.common.view.components.LeaveGamePopUp;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.configurationModePopup.components.ConfigModePopup;
import net.bigpoint.darkorbit.mvc.sectorControlWindow.view.SectorControlLobbyWindow;

import package_26.class_94;

import package_46.class_131;

import package_47.class_135;

import package_48.class_137;

import package_49.class_139;

import package_50.class_140;
import package_50.class_144;
import package_50.class_147;
import package_50.class_148;
import package_50.class_154;

import package_51.class_141;

import package_52.class_143;

import package_53.class_146;

import package_54.class_149;
import package_54.class_157;
import package_54.class_160;

import package_55.class_151;

import package_56.class_152;

import package_57.class_153;

import package_58.SectorControlLeaveQueuePopUp;
import package_58.class_155;

import package_59.class_159;

import package_60.class_161;

import package_61.JackpotArenaMatchResultWindow;

import package_9.class_50;

import spark.components.Label;
import spark.components.SkinnableContainer;
import spark.components.TitleWindow;

public class class_57 extends EventDispatcher {

    private static var _instance: class_57;

    public static const BS_: String = "BS_";

    public static const const_494: String = "window.ArenaTournament";

    public static const SETTINGS_WINDOW: String = "window.Settings";

    public static const const_2173: String = "window.QuestGiver";

    public static const const_394: String = "window.BattleStationBuild";

    public static const const_3096: String = "window.CompanyHierarchy";

    public static const const_1955: String = "window.WordPuzzle";

    public static const const_2498: String = "window.CountDownStatus";

    public static const const_1042: String = "window.LeaveMatchPopUp";

    public static const const_2120: String = "window.BSConfirmModuleRemovalPopUp";

    public static const const_2902: String = "window.BSPopUpWithSelectionSlider";

    public static const const_497: String = "window.BSPopUpWithProgressBar";

    public static const const_716: String = "window.BSPopUpWithErrorMessage";

    public static const const_264: String = "window.BSPopUpWithCountdownTimer";

    public static const const_3015: String = "window.BSPopUpWithActivation";

    public static const const_468: String = "window.BSPopUpWithNoClanMessage";

    public static const const_602: String = "window.BSPopUpWithInventoryFiltere";

    public static const const_663: String = "window.menuConfigModePopup";

    public static const const_3114: String = "window.SectorControlLobbyWindow";

    public static const const_1326: String = "window.SectorControlParticipationPopUp";

    public static const const_1671: String = "window.SectorControlLeaveQueuePopUp";

    public static const const_615: String = "window.SoundConfing";

    public static const const_378: String = "window.TeamDeathMatchLobbyWindow";

    public static const const_3194: String = "window.TeamDeathMatchResultWindow";

    public static const const_1347: String = "window.TeamDeathMatchPlayerRequirementPopup";

    public static const const_1666: String = "window.TeamDeathMatchMatchParticipationPopup";

    public static const const_3139: String = "window.TeamDeathMatchMatchErrorPopup";

    public static const const_1792: String = "window.JackpotArenaMatchResultWindow";

    public static const const_728: String = "window.HelpVideoPopup";

    public static const const_2956: String = "windowCentered";

    public static const const_344: String = "windowLeftAligned";

    public static const const_729: String = "windowRightAligned";


    private var windowContainer: SkinnableContainer;

    private var var_480: SkinnableContainer;

    private var var_2091: Dictionary;

    private var var_879: Dictionary;

    private var var_815: Dictionary;

    private var var_4896: SkinnableContainer;

    public function class_57(param1: Function) {
        this.var_2091 = new Dictionary();
        this.var_879 = new Dictionary();
        this.var_815 = new Dictionary();
        this.var_4896 = new SkinnableContainer();
        super();
        if (param1 != method_336) {
            throw new Error("WindowManager is a Singleton and can only be accessed through WindowManager.getInstance()");
        }
    }

    public static function getInstance(): class_57 {
        if (_instance == null) {
            _instance = new class_57(method_336);
        }
        return _instance;
    }

    private static function method_336(): void {
    }

    public function init(param1: SkinnableContainer): void {
        this.windowContainer = param1;
        this.var_480 = this.var_480;
        param1.addElement(this.var_4896);
        this.var_879[const_494] = ArenaTournamentWindow;
        this.var_879[SETTINGS_WINDOW] = class_161;
        this.var_879[const_2173] = class_139;
        this.var_879[const_3096] = class_151;
        this.var_879[const_1955] = class_146;
        this.var_879[const_2498] = class_143;
        this.var_879[const_394] = class_159;
        this.var_879[const_2120] = class_140;
        this.var_879[const_2902] = class_144;
        this.var_879[const_716] = class_147;
        this.var_879[const_264] = class_154;
        this.var_879[const_3015] = class_148;
        this.var_879[const_468] = class_140;
        this.var_879[const_602] = class_137;
        this.var_879[const_663] = ConfigModePopup;
        this.var_879[const_3114] = SectorControlLobbyWindow;
        this.var_879[const_1326] = class_155;
        this.var_879[const_1042] = LeaveGamePopUp;
        this.var_879[const_1671] = SectorControlLeaveQueuePopUp;
        this.var_879[const_378] = class_135;
        this.var_879[const_3194] = class_141;
        this.var_879[const_1347] = class_160;
        this.var_879[const_1666] = class_157;
        this.var_879[const_3139] = class_149;
        this.var_879[const_728] = class_152;
        this.var_879[const_1792] = JackpotArenaMatchResultWindow;
        this.var_879[const_615] = class_153;
    }

    public function createWindow(param1: String, param2: String = "windowCentered", param3: Object = null, param4: Boolean = true): DOWindow {
        if (this.method_971[param1]) {
            return this.method_971[param1];
        }
        var _loc5_: Class;
        var _loc6_: DOWindow = new (_loc5_ = this.var_879[param1])();
        this.method_971[param1] = _loc6_;
        DOWindow(_loc6_).windowType = param1;
        if (param4) {
            this.windowContainer.addElement(_loc6_);
            _loc6_.alignment = param2;
            _loc6_.addEventListener(FlexEvent.CREATION_COMPLETE, this.method_999);
        }
        return _loc6_;
    }

    private function method_999(param1: FlexEvent): void {
        var _loc2_: DOWindow = param1.target as DOWindow;
        if (_loc2_) {
            _loc2_.removeEventListener(FlexEvent.CREATION_COMPLETE, this.method_999);
            switch (_loc2_.alignment) {
                case const_2956:
                    _loc2_.x = 0 - _loc2_.width / 2;
                    _loc2_.y = 0 - _loc2_.height / 2;
                    break;
                case const_344:
                    _loc2_.x = 0 + (_loc2_.width + 20);
                    _loc2_.y = 0 - _loc2_.height / 2;
                    break;
                case const_729:
                    _loc2_.x = 0 - (_loc2_.width + 20);
                    _loc2_.y = 0 - _loc2_.height / 2;
            }
        }
    }

    public function method_1604(param1: String, param2: class_131): TitleWindow {
        var _loc3_: DODowngradeWindow = this.createWindow(param1, const_2956, null, false) as DODowngradeWindow;
        this.var_4896.addElementAt(_loc3_, 0);
        _loc3_.x = 1;
        _loc3_.y = 0;
        _loc3_.baseWindow = param2;
        _loc3_.title = param2.method_3482();
        param2.method_2321().removeChildAt(0);
        param2.method_2321().addChild(_loc3_);
        _loc3_.closeButton.visible = false;
        Label(_loc3_.titleDisplay).setStyle("left", 33);
        Label(_loc3_.titleDisplay).setStyle("top", 7);
        param2.method_468().visible = false;
        if (param1 != const_2498) {
            this.method_1598(param1);
        }
        return _loc3_;
    }

    public function method_2624(param1: String): void {
        if (this.method_971[param1]) {
            if (param1 == const_2498) {
                if (class_50.getInstance().map != null) {
                    class_94.getInstance().method_4106(class_58.instance.method_468(GuiConstants.CURCUBITOR_COUNTDOWN_STATUS_WINDOW));
                    class_58.instance.method_2624(GuiConstants.CURCUBITOR_COUNTDOWN_STATUS_WINDOW);
                }
            } else {
                this.windowContainer.removeElement(this.method_971[param1]);
            }
            this.method_1598(param1);
        }
    }

    private function method_1598(param1: String): void {
        delete this.method_971[param1];
    }

    public function method_1325(): void {
        var _loc1_: * = null;
        for (_loc1_ in this.method_971) {
            if (_loc1_ == const_2498) {
                this.method_2624(const_2498);
            } else if (_loc1_ == const_1955) {
                this.method_2624(const_1955);
            } else {
                this.windowContainer.removeElement(this.method_971[_loc1_]);
                delete this.method_971[_loc1_];
            }
        }
    }

    public function method_4369(param1: String): IFlexDisplayObject {
        if (this.method_971[param1]) {
            return this.method_971[param1];
        }
        return null;
    }

    public function get method_971(): Dictionary {
        return this.var_2091;
    }
}
}
