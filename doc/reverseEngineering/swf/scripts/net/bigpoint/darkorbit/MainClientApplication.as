package net.bigpoint.darkorbit {

import flash.events.Event;
import flash.system.Security;

import mx.binding.BindingManager;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;
import mx.styles.CSSCondition;
import mx.styles.CSSSelector;
import mx.styles.CSSStyleDeclaration;

import net.bigpoint.darkorbit.mvc.common.view.skins.DOButtonSkinWithColoredText;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOCustomImageBgContainerSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOCustomScaleBgContainerSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.DODownGradListSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.DODownGradWindowSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOListSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOSkinnable9ScaleContainerSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOToolTipBorderSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOWindowSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.scroller.DOScrollerSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.scroller.DOScrollerSkinWithoutBorder;
import net.bigpoint.darkorbit.mvc.common.view.skins.scroller.hScroll.DOHScrollBarSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.scroller.hScroll.DOHScrollBarThumbSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.scroller.hScroll.DOHScrollBarTrackSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.scroller.hScroll.DOHScrollDownButtonSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.scroller.hScroll.DOHScrollUpButtonSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.scroller.vScroll.DOVScrollBarSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.scroller.vScroll.DOVScrollBarThumbSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.scroller.vScroll.DOVScrollBarTrackSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.scroller.vScroll.DOVScrollDownButtonSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.scroller.vScroll.DOVScrollUpButtonSkin;
import net.bigpoint.darkorbit.settings.Settings;

import package_2.class_1;
import package_2.class_6;

import package_3.class_2;

import package_4.class_3;
import package_4.class_7;

import package_5.class_4;

import package_6.class_5;

import package_7.class_8;

import spark.components.Application;
import spark.components.SkinnableContainer;

public class MainClientApplication extends Application {


    private var var_3207: class_9;

    private var var_647: SkinnableContainer;

    private var __moduleFactoryInitialized: Boolean = false;

    mx_internal var var_61: Boolean = false;

    public function MainClientApplication() {
        super();
        mx_internal::_document = this;
        this.width = 1280;
        this.height = 900;
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_676);
        this.addEventListener("creationComplete", this.method_2267);
        this.addEventListener("addedToStage", this.method_3778);
    }

    override public function set moduleFactory(param1: IFlexModuleFactory): void {
        var factory: IFlexModuleFactory = param1;
        super.moduleFactory = factory;
        if (this.__moduleFactoryInitialized) {
            return;
        }
        this.__moduleFactoryInitialized = true;
        if (!this.styleDeclaration) {
            this.styleDeclaration = new CSSStyleDeclaration(null, styleManager);
        }
        this.styleDeclaration.defaultFactory = function (): void {
            this.backgroundAlpha = 0;
            this.backgroundColor = 0;
        };
        mx_internal::method_443();
    }

    override public function initialize(): void {
        super.initialize();
    }

    private function handleInit(): void {
        try {
            Security.allowDomain("package_1");
        } catch (e: Error) {
        }
    }

    private function method_396(): void {
        this.main.init(this, this.windowContainer);
    }

    [SecureSWF(rename="off")]
    public function startGame(): void {
        this.main.method_1936();
    }

    [SecureSWF(rename="off")]
    public function get autoStartEnabled(): Boolean {
        return Settings.singleSessionAutoStartEnabled;
    }

    [SecureSWF(rename="off")]
    public function launchClientButtonClicked(): void {
        this.main.method_1936();
    }

    [SecureSWF(rename="off")]
    public function forwardEventDispatch(param1: Event): void {
        systemManager.dispatchEvent(param1);
    }

    private function method_676(): Array {
        return [this.method_2857(), this.method_3866()];
    }

    private function method_2857(): class_9 {
        var _loc1_: class_9 = new class_9();
        _loc1_.initialized(this, "main");
        this.main = _loc1_;
        BindingManager.executeBindings(this, "main", this.main);
        return _loc1_;
    }

    private function method_3866(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.id = "windowContainer";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.windowContainer = _loc1_;
        BindingManager.executeBindings(this, "windowContainer", this.windowContainer);
        return _loc1_;
    }

    public function method_2267(param1: FlexEvent): void {
        this.handleInit();
    }

    public function method_3778(param1: Event): void {
        this.method_396();
    }

    mx_internal function method_443(): void {
        var var_187: CSSStyleDeclaration = null;
        var var_4469: Array = null;
        var var_3084: Array = null;
        var var_838: CSSCondition = null;
        var var_3312: CSSSelector = null;
        if (mx_internal::var_61) {
            return;
        }
        mx_internal::var_61 = true;
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "questWindow");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOWindow", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOWindow.questWindow");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DOWindowSkin;
                this.background = "placeholders";
                this.resizable = "false";
                this.titleColor = 15262143;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "jackpotWindow");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOWindow", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOWindow.jackpotWindow");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DOWindowSkin;
                this.background = "placeholders";
                this.resizable = "false";
                this.headerHeight = 37;
                this.titleColor = 15262143;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "tdmResultWindow");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOWindow", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOWindow.tdmResultWindow");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DOWindowSkin;
                this.background = "placeholders";
                this.resizable = "false";
                this.headerHeight = 37;
                this.titleColor = 15262143;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "battleStationPopup");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOWindow", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOWindow.battleStationPopup");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DOWindowSkin;
                this.background = "placeholders";
                this.resizable = "false";
                this.titleColor = 15262143;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "battleStationBuildWindow");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOWindow", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOWindow.battleStationBuildWindow");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DOWindowSkin;
                this.background = "placeholders";
                this.resizable = "true";
                this.titleColor = 15262143;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "companyHierarchyWindow");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOWindow", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOWindow.companyHierarchyWindow");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DOWindowSkin;
                this.background = "placeholders";
                this.resizable = "false";
                this.titleColor = 15262143;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "wordPuzzleWindow");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOWindow", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOWindow.wordPuzzleWindow");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DODownGradWindowSkin;
                this.background = "placeholders";
                this.resizable = "false";
                this.titleColor = 15262143;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "countDownStatusWindow");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOWindow", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOWindow.countDownStatusWindow");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DODownGradWindowSkin;
                this.background = "placeholders";
                this.resizable = "false";
                this.titleColor = 15262143;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "settingsWindow");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOWindow", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOWindow.settingsWindow");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.height = "480";
                this.skinClass = DOWindowSkin;
                this.width = "420";
                this.background = "placeholders";
                this.resizable = "true";
                this.titleColor = 15262143;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "questWindowOuter");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOViewContainerBase", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOViewContainerBase.questWindowOuter");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.borderColour = 3423815;
                this.backgroundColour = 0;
                this.borderAlpha = 1;
                this.backgroundAlpha = 1;
                this.borderWeight = 1;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "questWindowInvisible");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOViewContainerBase", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOViewContainerBase.questWindowInvisible");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.borderColour = 3423815;
                this.backgroundColour = 2239282;
                this.borderAlpha = 0;
                this.backgroundAlpha = 0;
                this.borderWeight = 1;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "questWindowAcceptQuest");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase.questWindowAcceptQuest");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.downState = "button_green_down";
                this.scalable = false;
                this.libID = "questWin";
                this.disabledState = "button_inactive";
                this.normalState = "button_green_normal";
                this.overState = "button_green_over";
                this.scale9rect = "10,14,1,1";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "greenButtonWithColoredText");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase.greenButtonWithColoredText");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.color = 15658734;
                this.skinClass = DOButtonSkinWithColoredText;
                this.downState = "button_green_down";
                this.scalable = false;
                this.libID = "questWin";
                this.disabledState = "button_inactive";
                this.normalState = "button_green_normal";
                this.overState = "button_green_over";
                this.scale9rect = "10,14,1,1";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "greenButtonWithColoredText");
        var_3084.push(var_838);
        var_838 = new CSSCondition("pseudo", "over");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase.greenButtonWithColoredText:over");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.color = 16777215;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "greenButtonWithColoredText");
        var_3084.push(var_838);
        var_838 = new CSSCondition("pseudo", "up");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase.greenButtonWithColoredText:up");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.color = 15658734;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "greenButtonWithColoredText");
        var_3084.push(var_838);
        var_838 = new CSSCondition("pseudo", "down");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase.greenButtonWithColoredText:down");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.color = 14737632;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "greenButtonWithColoredText");
        var_3084.push(var_838);
        var_838 = new CSSCondition("pseudo", "disabled");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase.greenButtonWithColoredText:disabled");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.color = 5592405;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "questWindowAbortQuest");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase.questWindowAbortQuest");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.downState = "button_blue_down";
                this.scalable = false;
                this.libID = "questWin";
                this.disabledState = "button_inactive";
                this.normalState = "button_blue_normal";
                this.overState = "button_blue_over";
                this.scale9rect = "10,14,1,1";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "scalableGreenConfirmButton");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase.scalableGreenConfirmButton");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.downState = "button_green_down";
                this.scalable = true;
                this.libID = "questWin";
                this.disabledState = "button_inactive";
                this.normalState = "button_green_normal";
                this.overState = "button_green_over";
                this.scale9rect = "10,14,1,1";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "scalableBlueCancelButton");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase.scalableBlueCancelButton");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.downState = "button_blue_down";
                this.scalable = true;
                this.libID = "questWin";
                this.disabledState = "button_inactive";
                this.normalState = "button_blue_normal";
                this.overState = "button_blue_over";
                this.scale9rect = "10,14,1,1";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "generalWindowCloseButton");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase.generalWindowCloseButton");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.downState = "winCloseBtn_down";
                this.scalable = false;
                this.libID = "ui";
                this.disabledState = "winCloseBtn_normal";
                this.normalState = "winCloseBtn_normal";
                this.overState = "winCloseBtn_over";
                this.scale9rect = "10,14,1,1";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "windowResizeHandle");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase.windowResizeHandle");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.downState = "resize_handle_normal";
                this.scalable = false;
                this.libID = "questWin";
                this.disabledState = "resize_handle_normal";
                this.normalState = "resize_handle_normal";
                this.overState = "resize_handle_over";
                this.scale9rect = "10,14,1,1";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "sliderArrow");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase.sliderArrow");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.downState = "slider_button_hover";
                this.scalable = false;
                this.libID = "battleStationsUI";
                this.disabledState = "slider_button_normal";
                this.normalState = "slider_button_normal";
                this.overState = "slider_button_hover";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "downArrowButtonNormal");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase.downArrowButtonNormal");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.downState = "btn_filter_normal_click";
                this.scalable = false;
                this.libID = "battleStationsUI";
                this.disabledState = "btn_filter_normal_normal";
                this.normalState = "btn_filter_normal_normal";
                this.overState = "btn_filter_normal_hover";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "downArrowButtonActive");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase.downArrowButtonActive");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.downState = "btn_filter_active_click";
                this.scalable = false;
                this.libID = "battleStationsUI";
                this.disabledState = "btn_filter_active_normal";
                this.normalState = "btn_filter_active_normal";
                this.overState = "btn_filter_active_hover";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "questWindowTabs");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOTabButtonBase", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOTabButtonBase.questWindowTabs");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.downAndSelectedState = "tabSelected";
                this.downState = "tabSelected";
                this.upAndSelectedState = "tabSelected";
                this.disabledAndSelectedState = "tabDisabled";
                this.overAndSelectedState = "tabSelected";
                this.upState = "tabDisabled";
                this.libID = "questWin";
                this.disabledState = "tabDisabled";
                this.overState = "tabRollover";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "tdmResultWinTabs");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOTabButtonBase", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOTabButtonBase.tdmResultWinTabs");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.downAndSelectedState = "tabSelected";
                this.downState = "tabSelected";
                this.upAndSelectedState = "tabSelected";
                this.disabledAndSelectedState = "tabDisabled";
                this.overAndSelectedState = "tabSelected";
                this.upState = "tabDisabled";
                this.libID = "tdmResultWin";
                this.disabledState = "tabDisabled";
                this.overState = "tabDisabled";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "questWindowTabBar");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("net.bigpoint.darkorbit.mvc.common.view.components.DOScalableDivider", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.darkorbit.mvc.common.view.components.DOScalableDivider.questWindowTabBar");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.libID = "questWin";
                this.linkageID = "tabDivider_x7y8";
                this.scale9rect = "7,8,1,1";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "skinnedScroller");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".skinnedScroller");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DOScrollerSkin;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "skinnedScrollerWithoutBorder");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".skinnedScrollerWithoutBorder");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DOScrollerSkinWithoutBorder;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "skinnedVScrollBar");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".skinnedVScrollBar");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DOVScrollBarSkin;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "skinnedVScrollBarTrack");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".skinnedVScrollBarTrack");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DOVScrollBarTrackSkin;
                this.track = "track_bg";
                this.libID = "questWin";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "skinnedVScrollBarThumb");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".skinnedVScrollBarThumb");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DOVScrollBarThumbSkin;
                this.libID = "questWin";
                this.thumb = "scroll_thumb";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "skinnedVScrollBarDownButton");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".skinnedVScrollBarDownButton");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DOVScrollDownButtonSkin;
                this.upState = "arrow_down";
                this.libID = "questWin";
                this.overState = "arrow_down_active";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "skinnedVScrollBarUpButton");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".skinnedVScrollBarUpButton");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DOVScrollUpButtonSkin;
                this.upState = "arrow_up";
                this.libID = "questWin";
                this.overState = "arrow_up_active";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "skinnedHScrollBar");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".skinnedHScrollBar");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DOHScrollBarSkin;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "skinnedHScrollBarTrack");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".skinnedHScrollBarTrack");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DOHScrollBarTrackSkin;
                this.track = "track_bg";
                this.libID = "questWin";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "skinnedHScrollBarThumb");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".skinnedHScrollBarThumb");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DOHScrollBarThumbSkin;
                this.libID = "questWin";
                this.thumb = "scroll_thumb";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "skinnedHScrollBarLeftButton");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".skinnedHScrollBarLeftButton");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DOHScrollDownButtonSkin;
                this.upState = "arrow_up";
                this.libID = "questWin";
                this.overState = "arrow_up_active";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "skinnedHScrollBarRightButton");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".skinnedHScrollBarRightButton");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = DOHScrollUpButtonSkin;
                this.upState = "arrow_up";
                this.libID = "questWin";
                this.overState = "arrow_up_active";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "skinnedList");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".skinnedList");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.contentBackgroundAlpha = 0;
                this.skinClass = DOListSkin;
                this.borderAlpha = 0;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "skinnedListDownGrade");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".skinnedListDownGrade");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.contentBackgroundAlpha = 0;
                this.skinClass = DODownGradListSkin;
                this.borderAlpha = 0;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "skinnedDataGrid");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".skinnedDataGrid");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.borderVisible = false;
                this.skinClass = class_8;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "skinnedDataGridHeader");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".skinnedDataGridHeader");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.fontColor = "#424a50";
                this.paddingTop = 2;
                this.column1align = "center";
                this.paddingLeft = 4;
                this.paddingBottom = 1;
                this.paddingRight = 5;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "skinnedDataGridRow");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".skinnedDataGridRow");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.fontColorActive = "#a59a61";
                this.fontColor = "#6b6b6b";
                this.column2align = "left";
                this.paddingTop = 6;
                this.fontColorHover = "#00FFFF";
                this.column1align = "center";
                this.column4align = "left";
                this.column3align = "left";
                this.paddingLeft = 5;
                this.paddingBottom = 0;
                this.paddingRight = 5;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "doCheckBox");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".doCheckBox");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.uncheckedState = "check_box_unchecked";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.checkedHoveredState = "check_box_checked_hovered";
                this.libID = "questWin";
                this.checkedState = "check_box_checked";
                this.uncheckedHoveredState = "check_box_unchecked_hovered";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "doCheckBoxFilterAvailable");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".doCheckBoxFilterAvailable");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.uncheckedState = "quests_available_inactive";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.checkedHoveredState = "quests_available_active_hovered";
                this.libID = "questWin";
                this.checkedState = "quests_available_active";
                this.uncheckedHoveredState = "quests_available_inactive_hovered";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "doCheckBoxFilterUnavailable");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".doCheckBoxFilterUnavailable");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.uncheckedState = "quests_unavailable_inactive";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.checkedHoveredState = "quests_unavailable_active_hovered";
                this.libID = "questWin";
                this.checkedState = "quests_unavailable_active";
                this.uncheckedHoveredState = "quests_unavailable_inactive_hovered";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "doCheckBoxFilterCompleted");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".doCheckBoxFilterCompleted");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.uncheckedState = "quests_completed_inactive";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.checkedHoveredState = "quests_completed_active_hovered";
                this.libID = "questWin";
                this.checkedState = "quests_completed_active";
                this.uncheckedHoveredState = "quests_completed_inactive_hovered";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "doCheckBoxLevelOrder");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".doCheckBoxLevelOrder");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.uncheckedState = "quests_mission_sort_UP_active";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.checkedHoveredState = "quests_mission_sort_DOWN_active_hovered";
                this.libID = "questWin";
                this.checkedState = "quests_mission_sort_DOWN_active";
                this.uncheckedHoveredState = "quests_mission_sort_UP_active_hovered";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "doCheckBoxFilterAttempted");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".doCheckBoxFilterAttempted");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.uncheckedState = "challenge_attempted_inactive";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.checkedHoveredState = "challenge_attempted_active_hovered";
                this.libID = "questWin";
                this.checkedState = "challenge_attempted_active";
                this.uncheckedHoveredState = "challenge_attempted_inactive_hovered";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "doCheckBoxFilterUnattempted");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".doCheckBoxFilterUnattempted");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.uncheckedState = "challenge_unattempted_inactive";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.checkedHoveredState = "challenge_unattempted_active_hovered";
                this.libID = "questWin";
                this.checkedState = "challenge_unattempted_active";
                this.uncheckedHoveredState = "challenge_unattempted_inactive_hovered";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "questListItemRendererContentStyle");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".questListItemRendererContentStyle");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = null;
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_3084 = [];
        var_838 = new CSSCondition("class", "instalationBackground");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer .instalationBackground");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.backgroundBitmap = "instalation_bg_with_holsters";
                this.skinClass = DOCustomImageBgContainerSkin;
                this.libID = "battleStationsUI";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = null;
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_3084 = [];
        var_838 = new CSSCondition("class", "moduleSingleHolsterBackground");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer .moduleSingleHolsterBackground");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.backgroundBitmap = "single_holster_background";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.libID = "battleStationsUI";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = null;
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_3084 = [];
        var_838 = new CSSCondition("class", "moduleDoubleHolsterBackground");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer .moduleDoubleHolsterBackground");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.backgroundBitmap = "double_holster_background";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.libID = "battleStationsUI";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = null;
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_3084 = [];
        var_838 = new CSSCondition("class", "ratingsBackground");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer .ratingsBackground");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.backgroundBitmap = "ratings_background_gradient";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.libID = "battleStationsUI";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = null;
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_3084 = [];
        var_838 = new CSSCondition("class", "selectionSliderPopupBg");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer .selectionSliderPopupBg");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.backgroundBitmap = "slider_background";
                this.skinClass = DOCustomImageBgContainerSkin;
                this.libID = "battleStationsUI";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "TeamDeathMatchLobbyWindowMatchoverviewCSS");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".TeamDeathMatchLobbyWindowMatchoverviewCSS");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.scale9Grid = "7,7,1,1";
                this.skinClass = class_5;
                this.libID = "tdmLobbyWindow";
                this.skinID = "innerFrameTop_15x9";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "TeamDeathMatchLobbyWindowMatchdetailCSS");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration(".TeamDeathMatchLobbyWindowMatchdetailCSS");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.scale9Grid = "7,1,1,1";
                this.skinClass = DOSkinnable9ScaleContainerSkin;
                this.libID = "tdmLobbyWindow";
                this.skinID = "innerFrameBottom_15x9";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "jackpotGrid");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.DataGrid", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.DataGrid.jackpotGrid");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.scale9Grid = "9,9,1,1";
                this.skinClass = class_4;
                this.libID = "jackpotResultWin";
                this.skinID = "innerFrame";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "skinnedListTDM");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.DataGrid", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.DataGrid.skinnedListTDM");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.contentBackgroundAlpha = 0;
                this.scale9Grid = "7,7,1,1";
                this.skinClass = class_2;
                this.libID = "tdmResultWin";
                this.skinID = "tooltipFrame";
                this.borderAlpha = 1;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "jackpot");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.jackpot");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.scale9Grid = "9,9,1,1";
                this.skinClass = DOSkinnable9ScaleContainerSkin;
                this.libID = "jackpotResultWin";
                this.skinID = "frameSprite";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "tdmResult");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.tdmResult");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.scale9Grid = "7,7,1,1";
                this.skinClass = class_3;
                this.libID = "tdmResultWin";
                this.skinID = "innerFrame";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "tdmResultBorder");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.tdmResultBorder");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.scale9Grid = "9,9,1,1";
                this.skinClass = DOSkinnable9ScaleContainerSkin;
                this.libID = "tdmResultWin";
                this.skinID = "frameSprite";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "tdmAccordion");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.tdmAccordion");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.scale9Grid = "7,7,1,1";
                this.skinClass = DOSkinnable9ScaleContainerSkin;
                this.libID = "tdmResultWin";
                this.skinID = "accordionFrame";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "emergencyRepairBackground");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.emergencyRepairBackground");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.backgroundBitmap = "emergency_repair_background";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.libID = "battleStationsUI";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "constructionProgressBackground");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.constructionProgressBackground");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.backgroundBitmap = "progress_background";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.libID = "battleStationsUI";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "factionLogoEIC");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.factionLogoEIC");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.backgroundBitmap = "faction_eic_logo";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.libID = "battleStationsUI";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "factionLogoMMO");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.factionLogoMMO");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.backgroundBitmap = "faction_mmo_logo";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.libID = "battleStationsUI";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "factionLogoVRU");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.factionLogoVRU");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.backgroundBitmap = "faction_vru_logo";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.libID = "battleStationsUI";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "factionLogoNeutral");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.factionLogoNeutral");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.backgroundBitmap = "faction_neutral_logo";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.libID = "battleStationsUI";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "tdmToolTip");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.tdmToolTip");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.hoverKey = "icon_hover";
                this.skinClass = class_7;
                this.libID = "tdmResultWin";
                this.normalKey = "icon_std";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("id", "rewardsList");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("package_1", var_3084, var_3312);
        var_3084 = null;
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("*#rewardsList spark.components.SkinnableContainer");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.amountFontColor = "#ffffff";
                this.rewardNameFontColor = "#99e7fd";
                this.labelsPaddingTop = 4;
                this.labelsPaddingBottom = 0;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("id", "components");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("package_1", var_3084, var_3312);
        var_3084 = null;
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("*#components spark.components.SkinnableContainer");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.amountFontColor = "#ffffff";
                this.rewardNameFontColor = "#99e7fd";
                this.labelsPaddingTop = 4;
                this.labelsPaddingBottom = 0;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "teamDeathMatchLobbywindow");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.teamDeathMatchLobbywindow");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.scale9Grid = "9,9,1,1";
                this.skinClass = DOSkinnable9ScaleContainerSkin;
                this.libID = "tdmLobbyWindow";
                this.skinID = "frameSprite";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "teamDeathMatchFactionLogoEIC");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.teamDeathMatchFactionLogoEIC");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.backgroundBitmap = "logoLobbyEIC";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.libID = "tdmLobbyWindow";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "teamDeathMatchFactionLogoMMO");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.teamDeathMatchFactionLogoMMO");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.backgroundBitmap = "logoLobbyMMO";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.libID = "tdmLobbyWindow";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "teamDeathMatchFactionLogoVRU");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.teamDeathMatchFactionLogoVRU");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.backgroundBitmap = "logoLobbyVRU";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.libID = "tdmLobbyWindow";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "teamDeathMatchFactionLogoPanel");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.SkinnableContainer", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.teamDeathMatchFactionLogoPanel");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.backgroundBitmap = "panel_133x55";
                this.skinClass = DOCustomScaleBgContainerSkin;
                this.libID = "tdmLobbyWindow";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = null;
        var_3312 = new CSSSelector("mx.controls.ToolTip", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("mx.controls.ToolTip");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.borderStyle = "solid";
                this.borderColor = 1873341;
                this.color = 13421772;
                this.backgroundColor = 0;
                this.borderSkin = DOToolTipBorderSkin;
                this.cornerRadius = 0;
                this.fontSize = 12;
                this.border = 1;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "filterOptionButton");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.Button", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.Button.filterOptionButton");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.overStateBackgroundColor = 3555401;
                this.brightBackgroundColor = 2238767;
                this.darkBackgroundColor = 1843495;
                this.separatorColor = 1186592;
                this.activeFontColor = 15459011;
                this.unactiveFontColor = 9211010;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = [];
        var_838 = new CSSCondition("class", "clanBattleStationPopupHSlider");
        var_3084.push(var_838);
        var_3312 = new CSSSelector("spark.components.HSlider", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("spark.components.HSlider.clanBattleStationPopupHSlider");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.arrowButtonStyleName = "sliderArrow";
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = null;
        var_3312 = new CSSSelector("net.bigpoint.as3toolbox.guicomponents.components.Scale9GridImage", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.as3toolbox.guicomponents.components.Scale9GridImage");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = class_6;
            };
        }
        var_3312 = null;
        var_3084 = null;
        var_3084 = null;
        var_3312 = new CSSSelector("net.bigpoint.as3toolbox.guicomponents.components.Scale9GridImageButton", var_3084, var_3312);
        var_187 = styleManager.getStyleDeclaration("net.bigpoint.as3toolbox.guicomponents.components.Scale9GridImageButton");
        if (!var_187) {
            var_187 = new CSSStyleDeclaration(var_3312, styleManager);
        }
        if (var_187.factory == null) {
            var_187.factory = function (): void {
                this.skinClass = class_1;
            };
        }
        styleManager.initProtoChainRoots();
    }

    [Bindable(event="propertyChange")]
    public function get main(): class_9 {
        return this.var_3207;
    }

    public function set main(param1: class_9): void {
        var _loc2_: * = null;
        _loc2_ = this.var_3207;
        if (_loc2_ !== param1) {
            this.var_3207 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "main", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get windowContainer(): SkinnableContainer {
        return this.var_647;
    }

    public function set windowContainer(param1: SkinnableContainer): void {
        var _loc2_: * = null;
        _loc2_ = this.var_647;
        if (_loc2_ !== param1) {
            this.var_647 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "windowContainer", _loc2_, param1));
            }
        }
    }
}
}
