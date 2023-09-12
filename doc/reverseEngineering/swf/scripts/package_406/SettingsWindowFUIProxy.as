package package_406 {

import net.bigpoint.darkorbit.managers.keyboardManager.KeyboardMapper;
import net.bigpoint.darkorbit.mvc.gui.abstract.model.DOAbstractProxy;
import net.bigpoint.darkorbit.settings.BindableSettings;
import net.bigpoint.darkorbit.settings.Settings;

import package_73.class_196;

public class SettingsWindowFUIProxy extends DOAbstractProxy {

    public static const NAME: String = "SettingsWindowFUIProxy";


    private var var_602: class_2302 = null;

    public function SettingsWindowFUIProxy(param1: class_2302) {
        super(NAME, param1);
    }

    public function method_1536(param1: int): void {
        this.var_602 = this.model.clone();
        sendNotification(class_196.SETTINGS_WINDOW_FUI_SAVE_SETTINGS, this.model);
    }

    public function method_4156(param1: class_2535): void {
        switch (param1.method_5017) {
            case class_2535.const_2119:
                if (this.model.advanced != param1.method_3850) {
                    this.model.advanced = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_1066:
                if (this.model.use2D != param1.method_3850) {
                    this.model.use2D = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_2248:
                if (this.model.method_759 != param1.method_3850) {
                    this.model.method_759 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_223:
                if (this.model.method_2761 != param1.method_3850) {
                    this.model.method_2761 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_2641:
                if (this.model.method_4459 != param1.method_3850) {
                    this.model.method_4459 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_2736:
                if (this.model.method_1879 != param1.method_3850) {
                    this.model.method_1879 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_1657:
                if (this.model.method_5692 != param1.method_3850) {
                    this.model.method_5692 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_1054:
                if (this.model.autoLogin != param1.method_3850) {
                    this.model.autoLogin = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_1599:
                if (this.model.doubleClickAttack != param1.method_3850) {
                    this.model.doubleClickAttack = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_876:
                if (this.model.method_6156 != param1.method_3850) {
                    this.model.method_6156 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_2809:
                if (this.model.method_4733 != param1.method_3850) {
                    this.model.method_4733 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_3161:
                if (this.model.showLowHpWarnings != param1.method_3850) {
                    this.model.showLowHpWarnings = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_1182:
                if (this.model.method_3208 != param1.method_3850) {
                    this.model.method_3208 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_105:
                if (this.model.method_2364 != param1.method_3850) {
                    this.model.method_2364 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_22:
                if (this.model.method_6273 != param1.method_3850) {
                    this.model.method_6273 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_3219:
                if (this.model.method_706 != param1.method_3850) {
                    this.model.method_706 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_2796:
                if (this.model.method_3810 != param1.method_3850) {
                    this.model.method_3810 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_3254:
                if (this.model.method_5736 != param1.method_3850) {
                    this.model.method_5736 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_3322:
                if (this.model.method_525 != param1.method_3850) {
                    this.model.method_525 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_2206:
                if (this.model.method_2596 != param1.method_3850) {
                    this.model.method_2596 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_3256:
                if (this.model.method_5392 != param1.method_3850) {
                    this.model.method_5392 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_1845:
                if (this.model.autoQualityReduction != param1.method_3850) {
                    this.model.autoQualityReduction = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_213:
                if (this.model.hoverShips != param1.method_3850) {
                    this.model.hoverShips = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_1947:
                if (this.model.method_2258 != param1.method_3850) {
                    this.model.method_2258 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_3213:
                if (this.model.name_154 != param1.method_3850) {
                    this.model.name_154 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_484:
                if (this.model.method_4912 != param1.method_3850) {
                    this.model.method_4912 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_1560:
                if (this.model.method_6233 != param1.method_3850) {
                    this.model.method_6233 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_1003:
                if (this.model.proActionBarEnabled != param1.method_3850) {
                    this.model.proActionBarEnabled = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_2539:
                if (this.model.proActionBarAutohideEnabled != param1.method_3850) {
                    this.model.proActionBarAutohideEnabled = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_2189:
                if (this.model.proActionBarKeyboardInputEnabled != param1.method_3850) {
                    this.model.proActionBarKeyboardInputEnabled = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_124:
                if (this.model.method_366 != param1.method_3850) {
                    this.model.method_366 = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
                break;
            case class_2535.const_3274:
                if (this.model.playCombatMusic != param1.method_3850) {
                    this.model.playCombatMusic = param1.method_3850;
                    sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
                    break;
                }
        }
        sendNotification(class_196.SETTINGS_WINDOW_FUI_APPLY_MODEL_CHANGES, this.model);
    }

    private function get model(): class_2302 {
        return super.getData() as class_2302;
    }

    public function method_1268(param1: class_2532): void {
        switch (param1.method_2819) {
            case class_2532.const_741:
                this.model.method_4640 = param1.selectedIndex;
                break;
            case class_2532.const_1878:
                this.model.method_5112 = param1.selectedIndex;
                if (param1.selectedIndex == 2) {
                    this.model.method_5112 = Settings.QUALITY_HIGH;
                    break;
                }
                break;
            case class_2532.const_620:
                this.model.method_3387 = param1.selectedIndex;
                if (param1.selectedIndex == 1) {
                    this.model.method_3387 = Settings.QUALITY_HIGH;
                    break;
                }
                break;
            case class_2532.const_1635:
                this.model.method_2536 = param1.selectedIndex;
                break;
            case class_2532.const_307:
                this.model.method_5151 = param1.selectedIndex;
                break;
            case class_2532.const_2822:
                this.model.method_5596 = param1.selectedIndex;
                if (param1.selectedIndex == 1) {
                    this.model.method_5596 = Settings.QUALITY_HIGH;
                    break;
                }
                break;
            case class_2532.const_1472:
                this.model.displaySetting3DqualityAntialias = param1.selectedIndex;
                break;
            case class_2532.const_1222:
                this.model.displaySetting3DqualityLights = param1.selectedIndex;
                break;
            case class_2532.const_1430:
                this.model.displaySetting3DqualityTextures = param1.selectedIndex;
                break;
            case class_2532.const_1682:
                this.model.displaySetting3DsizeTextures = param1.selectedIndex;
                break;
            case class_2532.const_3009:
                this.model.displaySetting3DqualityEffects = param1.selectedIndex;
                break;
            case class_2532.const_1731:
                this.model.displaySetting3DtextureFiltering = param1.selectedIndex;
                break;
            case class_2532.const_1415:
                this.model.name_44 = param1.selectedIndex;
                break;
            case class_2532.const_1555:
                this.model.name_16 = param1.selectedIndex;
        }
        sendNotification(class_196.SETTINGS_WINDOW_FUI_APPLY_MODEL_CHANGES, this.model);
        sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
    }

    public function method_6218(param1: class_2533): void {
        switch (param1.method_1682) {
            case class_2533.const_848:
                this.model.method_3958 = param1.method_3610 - 1;
                this.method_3496();
                break;
            case class_2533.const_2682:
                this.model.method_6008 = param1.method_3610;
                break;
            case class_2533.const_1224:
                this.model.musicVolume = param1.method_3610;
                break;
            case class_2533.const_2690:
                this.model.method_4421 = param1.method_3610;
        }
        sendNotification(class_196.SETTINGS_WINDOW_FUI_APPLY_MODEL_CHANGES, this.model);
        sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
    }

    private function method_3496(): void {
        switch (this.model.method_3958) {
            case Settings.QUALITY_LOW:
                this.model.method_4640 = Settings.QUALITY_LOW;
                this.model.method_5112 = Settings.QUALITY_LOW;
                this.model.method_3387 = Settings.QUALITY_LOW;
                this.model.method_5151 = Settings.QUALITY_LOW;
                this.model.method_2536 = Settings.QUALITY_LOW;
                this.model.method_5596 = Settings.QUALITY_LOW;
                this.model.displaySetting3DqualityAntialias = BindableSettings.LOW;
                this.model.displaySetting3DqualityEffects = BindableSettings.LOW;
                this.model.displaySetting3DqualityLights = BindableSettings.LOW;
                this.model.displaySetting3DqualityTextures = BindableSettings.LOW;
                this.model.displaySetting3DtextureFiltering = BindableSettings.LOW;
                this.model.displaySetting3DsizeTextures = BindableSettings.LOW;
                this.model.name_44 = BindableSettings.LOW;
                this.model.name_16 = BindableSettings.LOW;
                break;
            case Settings.QUALITY_MEDIUM:
                this.model.method_4640 = Settings.QUALITY_MEDIUM;
                this.model.method_5112 = Settings.QUALITY_MEDIUM;
                this.model.method_3387 = Settings.QUALITY_LOW;
                this.model.method_5151 = Settings.QUALITY_MEDIUM;
                this.model.method_2536 = Settings.QUALITY_MEDIUM;
                this.model.method_5596 = Settings.QUALITY_LOW;
                this.model.displaySetting3DqualityAntialias = BindableSettings.MEDIUM;
                this.model.displaySetting3DqualityEffects = BindableSettings.MEDIUM;
                this.model.displaySetting3DqualityLights = BindableSettings.MEDIUM;
                this.model.displaySetting3DqualityTextures = BindableSettings.MEDIUM;
                this.model.displaySetting3DtextureFiltering = BindableSettings.MEDIUM;
                this.model.displaySetting3DsizeTextures = BindableSettings.MEDIUM;
                this.model.name_44 = BindableSettings.MEDIUM;
                this.model.name_16 = BindableSettings.MEDIUM;
                break;
            case Settings.QUALITY_GOOD:
                this.model.method_4640 = Settings.QUALITY_GOOD;
                this.model.method_5112 = Settings.QUALITY_HIGH;
                this.model.method_3387 = Settings.QUALITY_HIGH;
                this.model.method_5151 = Settings.QUALITY_MEDIUM;
                this.model.method_2536 = Settings.QUALITY_GOOD;
                this.model.method_5596 = Settings.QUALITY_HIGH;
                this.model.displaySetting3DqualityAntialias = BindableSettings.HIGH;
                this.model.displaySetting3DqualityEffects = BindableSettings.HIGH;
                this.model.displaySetting3DqualityLights = BindableSettings.HIGH;
                this.model.displaySetting3DqualityTextures = BindableSettings.HIGH;
                this.model.displaySetting3DtextureFiltering = BindableSettings.HIGH;
                this.model.displaySetting3DsizeTextures = BindableSettings.HIGH;
                this.model.name_44 = BindableSettings.HIGH;
                this.model.name_16 = BindableSettings.HIGH;
                break;
            case Settings.QUALITY_HIGH:
                this.model.method_4640 = Settings.gpuSupport ? 0 : Settings.QUALITY_GOOD;
                this.model.method_5112 = Settings.QUALITY_HIGH;
                this.model.method_3387 = Settings.QUALITY_HIGH;
                this.model.method_5151 = Settings.QUALITY_HIGH;
                this.model.method_2536 = Settings.QUALITY_HIGH;
                this.model.method_5596 = Settings.QUALITY_HIGH;
                this.model.displaySetting3DqualityAntialias = BindableSettings.ULTRA;
                this.model.displaySetting3DqualityEffects = BindableSettings.ULTRA;
                this.model.displaySetting3DqualityLights = BindableSettings.HIGH;
                this.model.displaySetting3DqualityTextures = BindableSettings.HIGH;
                this.model.displaySetting3DtextureFiltering = BindableSettings.HIGH;
                this.model.displaySetting3DsizeTextures = BindableSettings.HIGH;
                this.model.name_44 = BindableSettings.ULTRA;
                this.model.name_16 = BindableSettings.ULTRA;
        }
        sendNotification(class_196.SETTINGS_WINDOW_FUI_MODEL_CHANGED, this.model);
        sendNotification(class_196.SETTINGS_WINDOW_FUI_APPLY_MODEL_CHANGES, this.model);
    }

    public function method_4606(): void {
        this.model.method_759 = Settings.preloadUserShips;
        this.model.use2D = Settings.FORCE_2D.value;
        this.model.method_3958 = Settings.qualityPresetting;
        this.model.advanced = Settings.qualityCustomized;
        this.model.method_4640 = Settings.qualityBackground.value;
        this.model.method_5112 = Settings.qualityPoizone.value;
        this.model.method_3387 = Settings.qualityShip.value;
        this.model.method_2536 = Settings.qualityEngine.value;
        this.model.method_5151 = Settings.qualityExplosion.value;
        this.model.method_5596 = Settings.qualityCollectable.value;
        this.model.displaySetting3DqualityAntialias = Settings.displaySetting3DqualityAntialias.value;
        this.model.name_44 = Settings.qualityBackground.value;
        this.model.displaySetting3DqualityEffects = Settings.displaySetting3DqualityEffects.value;
        this.model.displaySetting3DqualityLights = Settings.displaySetting3DqualityLights.value;
        this.model.displaySetting3DqualityTextures = Settings.displaySetting3DqualityTextures.value;
        this.model.name_16 = Settings.qualityPoizone.value;
        this.model.displaySetting3DsizeTextures = Settings.displaySetting3DsizeTextures.value;
        this.model.displaySetting3DtextureFiltering = Settings.displaySetting3DtextureFiltering.value;
        this.model.method_2761 = Settings.autoBoost;
        this.model.method_4459 = Settings.autochangeAmmo;
        this.model.method_1879 = Settings.autoRefinement;
        this.model.method_5692 = Settings.quickSlotStopAttack;
        this.model.autoLogin = Settings.autoStartEnabled;
        this.model.doubleClickAttack = Settings.doubleclickAttackEnabled;
        this.model.method_6156 = Settings.autoBuyBootyKeys;
        this.model.showLowHpWarnings = Settings.showLowHpWarnings;
        this.model.method_4733 = Settings.displayBattlerayNotifications;
        this.model.method_3208 = Settings.displayPlayerNames.value;
        this.model.method_2364 = Settings.displayResources.value;
        this.model.method_6273 = Settings.displayBonusBoxes.value;
        this.model.method_706 = Settings.displayHitpointBubbles;
        this.model.method_3810 = Settings.displayDrones.value;
        this.model.method_5736 = Settings.displayFreeCargoBoxes.value;
        this.model.method_525 = Settings.displayNotFreeCargoBoxes.value;
        this.model.method_2596 = Settings.displayMiniMapBackgroundImage.value;
        this.model.method_5392 = Settings.displayNotifications.value;
        this.model.autoQualityReduction = Settings.allowAutoQuality.value;
        this.model.hoverShips = Settings.hoverShips.value;
        this.model.method_2258 = Settings.displayChat;
        this.model.name_154 = Settings.dragWindowsAlways;
        this.model.method_4912 = Settings.displayWindowsBackground;
        this.model.method_6233 = Settings.showPremiumQuickslotBar;
        this.model.proActionBarEnabled = Settings.proActionBarEnabled.value;
        this.model.proActionBarAutohideEnabled = Settings.proActionBarAutohideEnabled;
        this.model.proActionBarKeyboardInputEnabled = Settings.proActionBarKeyboardInputEnabled;
        this.model.method_366 = Settings.showNotOwnedItems;
        this.model.playCombatMusic = Settings.playCombatMusic;
        this.model.method_6008 = Settings.soundVolume;
        this.model.musicVolume = Settings.musicVolume;
        this.model.method_4421 = Settings.voiceVolume;
        this.method_2016();
        this.var_602 = this.model.clone();
        sendNotification(class_196.SETTINGS_WINDOW_FUI_MODEL_CHANGED, this.model);
        sendNotification(class_196.SETTINGS_WINDOW_FUI_APPLY_MODEL_CHANGES, this.model);
    }

    public function method_1215(): void {
        if (this.var_602) {
            setData(this.var_602.clone());
            sendNotification(class_196.SETTINGS_WINDOW_FUI_MODEL_CHANGED, this.model);
            sendNotification(class_196.SETTINGS_WINDOW_FUI_APPLY_MODEL_CHANGES, this.model);
        }
    }

    public function method_3906(param1: class_2534): void {
        this.model.method_3956[param1.method_3976] = new <int>[param1.method_4918];
        sendNotification(class_196.SETTINGS_WINDOW_FUI_ENABLE_SAVE_BUTTON);
    }

    public function method_2016(): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc1_: KeyboardMapper = KeyboardMapper.getInstance();
        for (_loc2_ in _loc1_.commandMap) {
            _loc3_ = class_2534.method_1459(_loc2_);
            if (Boolean(_loc3_) && _loc3_.length == 1) {
                this.model.method_3956[_loc3_[0]] = _loc1_.method_6497(_loc2_);
            } else if (Boolean(_loc3_) && _loc3_.length > 1) {
                _loc4_ = 0;
                while (_loc4_ < _loc3_.length) {
                    _loc5_ = _loc3_[_loc4_];
                    this.model.method_3956[_loc5_] = _loc1_.method_5293(_loc2_, new <String>[class_2534.method_1459(_loc2_).indexOf(_loc5_).toString()]);
                    if ((this.model.method_3956[_loc5_] as Vector.<int>).length == 0) {
                        (this.model.method_3956[_loc5_] as Vector.<int>).push(-1);
                    }
                    _loc4_++;
                }
            }
        }
    }
}
}
