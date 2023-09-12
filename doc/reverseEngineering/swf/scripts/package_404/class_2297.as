package package_404 {

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.Event;
import flash.utils.Dictionary;

import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.fui.components.window.PopupWindow;
import net.bigpoint.darkorbit.gui.class_1555;
import net.bigpoint.darkorbit.managers.keyboardManager.KeyboardMapper;
import net.bigpoint.darkorbit.managers.keyboardManager.class_1554;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.interfaces.IWindow;
import net.bigpoint.darkorbit.settings.Settings;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_191.class_1164;

import package_192.class_1557;

import package_28.EventStreamClient;

import package_33.class_93;

import package_38.class_200;

import package_406.class_2302;
import package_406.class_2534;

import package_46.class_131;

import package_64.class_171;

import package_84.class_243;

import package_9.class_50;

public class class_2297 extends class_243 {


    private var var_1410: IWindow;

    public function class_2297() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: * = null;
        if (param1.getBody() is class_2302) {
            _loc2_ = param1.getBody() as class_2302;
            this.method_6392(_loc2_);
            this.method_2436(_loc2_);
            this.method_5689(_loc2_);
            this.method_2878(_loc2_);
            this.method_5458(_loc2_);
        }
    }

    private function method_3797(param1: IWindow, param2: DisplayObjectContainer): void {
        this.var_1410 = param1;
        param1.maximize();
        (param1 as class_131).autoSize();
        var _loc3_: PopupWindow = new PopupWindow(param2, this.method_6459, this.method_5412);
    }

    private function method_5412(param1: Event): void {
        this.var_1410.minimize();
    }

    private function method_6459(param1: Event): void {
        this.var_1410.minimize();
        new class_1164().execute(null, null);
    }

    private function method_6392(param1: class_2302): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (Settings.FORCE_2D.value != param1.use2D) {
            _loc2_ = (!!guiManager.method_468(GuiConstants.CONFIRMATION_POPUP) ? guiManager.method_468(GuiConstants.CONFIRMATION_POPUP) : guiManager.createWindow(GuiConstants.CONFIRMATION_POPUP, class_50.getInstance().method_6313(), class_131.const_3085)) as class_131;
            _loc3_ = _loc2_.method_3694(0);
            _loc4_ = new Sprite();
            _loc3_.addElement(_loc4_);
            EventStreamClient.track("switch_view", {"use2D": (!!param1.use2D ? 1 : 0)});
            UISystem.getInstance().loadAndBuildWithResKey("confirmationPopup", _loc4_, this.method_3797, [_loc2_, _loc4_]);
        }
        Settings.FORCE_2D.value = param1.use2D;
        if (param1.use2D) {
            Settings.qualityBackground.value = param1.method_4640;
            Settings.qualityPoizone.value = param1.method_5112;
            Settings.qualityShip.value = param1.method_3387;
            Settings.qualityEngine.value = param1.method_2536;
            Settings.qualityExplosion.value = param1.method_5151;
            Settings.qualityCollectable.value = param1.method_5596;
        } else {
            Settings.displaySetting3DqualityAntialias.value = param1.displaySetting3DqualityAntialias;
            Settings.qualityBackground.value = param1.name_44;
            Settings.displaySetting3DqualityEffects.value = param1.displaySetting3DqualityEffects;
            Settings.displaySetting3DqualityLights.value = param1.displaySetting3DqualityLights;
            Settings.displaySetting3DqualityTextures.value = param1.displaySetting3DqualityTextures;
            Settings.qualityPoizone.value = param1.name_16;
            Settings.displaySetting3DsizeTextures.value = param1.displaySetting3DsizeTextures;
            Settings.displaySetting3DtextureFiltering.value = param1.displaySetting3DtextureFiltering;
        }
        Settings.preloadUserShips = param1.method_759;
        Settings.qualityCustomized = param1.advanced;
        Settings.qualityPresetting = param1.method_3958;
        guiManager.method_1383();
    }

    private function method_2436(param1: class_2302): void {
        Settings.autoBoost = param1.method_2761;
        Settings.autochangeAmmo = param1.method_4459;
        Settings.autoRefinement = param1.method_1879;
        Settings.quickSlotStopAttack = param1.method_5692;
        Settings.autoStartEnabled = param1.autoLogin;
        Settings.doubleclickAttackEnabled = param1.doubleClickAttack;
        Settings.autoBuyBootyKeys = param1.method_6156;
        Settings.displayBattlerayNotifications = param1.method_4733;
        Settings.showLowHpWarnings = param1.showLowHpWarnings;
        guiManager.method_2310();
    }

    private function method_5689(param1: class_2302): void {
        Settings.displayPlayerNames.value = param1.method_3208;
        Settings.displayResources.value = param1.method_2364;
        Settings.displayBonusBoxes.value = param1.method_6273;
        Settings.displayHitpointBubbles = param1.method_706;
        Settings.displayDrones.value = param1.method_3810;
        Settings.displayFreeCargoBoxes.value = param1.method_5736;
        Settings.displayNotFreeCargoBoxes.value = param1.method_525;
        Settings.displayMiniMapBackgroundImage.value = param1.method_2596;
        Settings.displayNotifications.value = param1.method_5392;
        Settings.allowAutoQuality.value = param1.autoQualityReduction;
        Settings.hoverShips.value = param1.hoverShips;
        Settings.displayChat = param1.method_2258;
        Settings.dragWindowsAlways = param1.name_154;
        this.method_3733();
        Settings.displayWindowsBackground = param1.method_4912;
        this.method_4213();
        Settings.showPremiumQuickslotBar = param1.method_6233;
        Settings.showNotOwnedItems = param1.method_366;
        Settings.proActionBarEnabled.value = param1.proActionBarEnabled;
        Settings.proActionBarKeyboardInputEnabled = param1.proActionBarKeyboardInputEnabled;
        Settings.proActionBarAutohideEnabled = param1.proActionBarAutohideEnabled;
        guiManager.method_3430();
    }

    private function method_2878(param1: class_2302): void {
        class_171.run(new class_200(false, param1.method_6008, param1.musicVolume, param1.method_4421, param1.playCombatMusic), true);
        guiManager.method_707();
    }

    private function method_5458(param1: class_2302): void {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc2_: KeyboardMapper = KeyboardMapper.getInstance();
        _loc2_.cleanup();
        var _loc3_: class_1557 = new class_1557();
        var _loc4_: class_1555 = new class_1555(guiManager.method_6185().method_6154());
        for (_loc5_ in param1.method_3956) {
            (_loc6_ = new class_1554()).name = class_2534.method_3622(int(_loc5_));
            _loc6_.keys = param1.method_3956[int(_loc5_)] as Vector.<int>;
            _loc6_.args = new Vector.<String>();
            if (class_2534.method_1459(_loc6_.name).indexOf(_loc5_) != -1) {
                _loc6_.args.push(class_2534.method_1459(_loc6_.name).indexOf(_loc5_));
            } else {
                _loc6_.args.push("0");
            }
            _loc3_.method_889(_loc6_);
            _loc4_.method_2039(_loc6_);
        }
        _loc2_.method_1900(_loc3_);
        _loc4_.method_1900();
        _loc3_.reset();
    }

    private function method_4213(): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc1_: Dictionary = guiManager.windows;
        for (_loc2_ in _loc1_) {
            _loc3_ = _loc1_[_loc2_] as class_131;
            if (false) {
                _loc3_.method_25();
                _loc3_.method_3086();
            } else {
                _loc3_.method_3883();
                _loc3_.method_1349();
            }
        }
    }

    private function method_3733(): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc1_: Dictionary = guiManager.windows;
        for (_loc2_ in _loc1_) {
            _loc3_ = _loc1_[_loc2_] as class_131;
            _loc3_.method_1949();
        }
    }
}
}
