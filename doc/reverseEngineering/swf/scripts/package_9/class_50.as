package package_9 {

import com.bigpoint.utils.class_73;
import com.greensock.TweenLite;
import com.greensock.TweenMax;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.display.Stage;
import flash.display.StageDisplayState;
import flash.events.Event;
import flash.events.FullScreenEvent;
import flash.events.TimerEvent;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.utils.Timer;
import flash.utils.clearTimeout;
import flash.utils.getTimer;
import flash.utils.setTimeout;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.gui.class_58;
import net.bigpoint.darkorbit.map.class_87;
import net.bigpoint.darkorbit.map.class_95;
import net.bigpoint.darkorbit.map.common.class_80;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.mvc.common.model.vo.ViewportResizeValuesVO;
import net.bigpoint.darkorbit.mvc.common.view.ScreenNotifications;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuNotifications;
import net.bigpoint.darkorbit.settings.Settings;

import package_14.class_52;

import package_17.class_62;

import package_19.class_68;
import package_19.class_70;

import package_25.class_78;

import package_26.class_79;
import package_26.class_94;

import package_27.class_82;

import package_28.EventStreamClient;

import package_29.class_84;

import package_30.class_91;

import package_32.HintsMediator;

import package_33.class_93;

import package_34.HintsNotifications;

public class class_50 {

    public static var var_4664: int = 0;

    public static var var_1705: int = 1;

    public static var var_3802: int = 2;

    public static var var_2322: int = 3;

    public static var var_2894: int = 4;

    public static var var_894: int = 5;

    public static var var_3454: int;

    public static var var_438: int;

    public static var camera: Point = new Point();

    public static var var_3902: int = -1;

    public static var var_1535: int = 0;

    private static var _instance: class_50;

    private static var var_3291: Sprite;

    private static var var_2767: int;

    private static const const_2937: uint = 10000;

    private static const RESIZE_DELAY: int = 250;

    public static const const_1672: int = 750;

    private static var var_3951: int = const_1672;

    public static const const_3259: int = 600;

    private static var var_1460: int = const_3259;

    private static const const_2828: Vector.<class_52> = new Vector.<class_52>();


    public const const_2351: class_68 = new class_70();

    private var var_2383: Sprite;

    private var var_4366: Sprite;

    private var var_3733: Sprite;

    private var var_5052: Sprite;

    private var var_4059: DisplayObjectContainer;

    private var tooltipLayer: Sprite;

    private var var_3272: Sprite;

    private var var_742: Sprite;

    private var var_900: Sprite;

    private var var_512: Sprite;

    private var var_1507: Sprite;

    private var var_449: Number = 0;

    private var var_4682: Number = 0;

    private var var_2586: Number = 0;

    private var name_20: class_62;

    private var var_2781: Sprite;

    private var var_2248: Timer;

    private var _hasFocus: Boolean;

    private var var_1621: ViewportResizeValuesVO;

    private var _resizeTimeout: int;

    private var var_4430: Number = 0;

    private var var_870: Boolean = false;

    private var var_3594: int;

    private var var_1642: int = 5;

    private var var_4457: class_83;

    private var var_4637: class_95;

    private var _mapView: class_87;

    private var var_896: class_78;

    private var var_3223: Sprite;

    private var var_1282: class_86;

    private var var_3324: Function;

    private var _map: class_90;

    public const const_733: class_68 = new class_70();

    private var var_2795: class_84;

    public function class_50(param1: Function) {
        this._map = new class_90(-1);
        this.var_2795 = new class_84();
        super();
        if (param1 !== method_336) {
            throw new Error("ScreenManager is a Singleton and can only be accessed through ScreenManager.getInstance()");
        }
        class_81.const_934.changed.add(this.method_6306);
        class_81.const_227.changed.add(this.method_6306);
    }

    public static function getInstance(): class_50 {
        if (_instance == null) {
            _instance = new class_50(method_336);
        }
        return _instance;
    }

    public static function method_4278(): Sprite {
        return var_3291;
    }

    public static function method_6533(): int {
        return var_3951;
    }

    public static function method_1269(): int {
        return var_1460;
    }

    public static function method_1849(): int {
        return var_3454;
    }

    public static function method_5866(): int {
        return var_438;
    }

    private static function method_336(): void {
    }

    public static function method_5621(param1: class_52): void {
        removeObserver(param1);
        const_2828.push(param1);
        ++var_2767;
    }

    public static function removeObserver(param1: class_52): void {
        var _loc2_: int = int(const_2828.indexOf(param1));
        if (_loc2_ != -1) {
            const_2828.splice(_loc2_, 1);
            --var_2767;
        }
    }

    public static function method_5546(param1: class_52): Boolean {
        if (const_2828.indexOf(param1) != -1) {
            return true;
        }
        return false;
    }

    public function get map(): class_90 {
        return this._map;
    }

    public function set map(param1: class_90): void {
        if (this._map) {
            this._map.method_1203().const_719.remove(this.method_4074);
            this._map.cleanup();
            class_94.getInstance().method_6247();
            class_82.cleanup();
        }
        this._map = param1;
        var_1535 = var_3802;
        TweenLite.killTweensOf(class_50.camera);
        this.var_4457.map = this._map;
        this._mapView.load(this._map);
        this.minimap.map = this._map;
        if (this._map) {
            this.var_2795 = this._map.method_328(class_80);
            this._map.method_1203().const_719.add(this.method_4074);
            this.method_4074(this._map.hero);
        }
        this.const_733.dispatch();
    }

    public function init(param1: Sprite): void {
        this.var_3223 = param1;
        this.stage.addEventListener("fullScreenInteractiveAccepted", this.method_3911);
        this.name_20 = class_62.getInstance();
        this.stage.addEventListener(Event.RESIZE, this.method_4951);
        this.stage.addEventListener(Event.DEACTIVATE, this.method_684);
        this.stage.addEventListener(Event.ACTIVATE, this.method_6223);
        this.var_1621 = new ViewportResizeValuesVO(new class_73(this.stageWidth, this.stageHeight));
        this.var_2383 = new Sprite();
        this.var_2383.graphics.clear();
        this.var_2383.graphics.beginFill(255, 0);
        this.var_2383.graphics.drawRect(0, 0, 100, 100);
        this.var_2383.graphics.endFill();
        this.var_3223.addChildAt(this.var_2383, 0);
        this.var_4457 = new class_83(this.stage, this.var_2383);
        this.method_3531();
    }

    public function shakeScreen(): void {
        this.var_3594 = 40;
        this.var_1642 = 5;
        this.var_870 = true;
    }

    public function method_370(param1: uint, param2: Number = 0.4, param3: Number = 0.25, param4: Number = 0.75): void {
        if (this.var_1507 == null) {
            this.var_1507 = new Sprite();
            this.var_1507.mouseEnabled = false;
            this.var_1507.mouseChildren = false;
            this.var_1507.graphics.beginFill(param1);
            this.var_1507.graphics.drawRect(0, 0, var_3951, var_1460);
            this.var_1507.alpha = 0;
            this.var_3223.addChild(this.var_1507);
            TweenLite.to(this.var_1507, param3, {
                "alpha": param2,
                "onComplete": this.method_2775,
                "onCompleteParams": [param4]
            });
        }
    }

    private function method_6223(param1: Event): void {
        this._hasFocus = true;
    }

    private function method_684(param1: Event): void {
        this._hasFocus = false;
    }

    public function method_876(param1: Function): void {
        this.var_3324 = param1;
        this.var_4637 = new class_95(this.stage, this.var_3223);
        this.var_4637.method_4845.add(this.method_5277);
        this.var_4637.method_4845.add(this.method_4782);
        this.method_5984(Settings.FORCE_2D.value);
    }

    public function method_5984(param1: Boolean): void {
        this._mapView = null;
        this.var_4637.method_3461(param1);
    }

    public function method_3501(): void {
        var _loc1_: * = this.stage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE;
        if (_loc1_) {
            this.var_1621.beforeResize = new class_73(this.stageWidth, this.stageHeight);
            this.stage.displayState = StageDisplayState.NORMAL;
            _loc1_ = false;
            this.stage.removeEventListener(FullScreenEvent.FULL_SCREEN, this.method_1507);
        } else {
            this.var_1621.beforeResize = new class_73(this.stageWidth, this.stageHeight);
            this.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
            _loc1_ = true;
            this.stage.addEventListener(FullScreenEvent.FULL_SCREEN, this.method_1507);
            EventStreamClient.track("switch_fullscreen", {"fullscreen": 1});
        }
        this.name_20.sendNotification(FeaturesMenuNotifications.TOGGLE_BTN_SELECTION, _loc1_, FeaturesMenuConstants.FULLSCREEN);
        this.method_1477(_loc1_);
    }

    public function method_3531(): void {
        var _loc1_: * = null;
        if (false) {
            clearTimeout(this._resizeTimeout);
            this._resizeTimeout = 0;
            if (!this.stage) {
                return;
            }
            this.method_956();
            class_94.getInstance().method_2670(new Rectangle(0, 0, this.stageWidth, this.stageHeight));
            this.name_20.method_2407(HintsNotifications.const_1365);
            this.name_20.method_2407(GuiNotifications.UPDATE_MENUS_CONFIG_MODE);
            _loc1_ = new Rectangle();
            _loc1_.width = this.stage.stageWidth;
            _loc1_.height = this.stage.stageHeight;
            this.method_6170.afterResize = new class_73(this.stageWidth, this.stageHeight);
            this.name_20.sendNotification(ScreenNotifications.SCREEN_VIEWPORT_RESIZED);
            this.method_6170.beforeResize = new class_73(this.stageWidth, this.stageHeight);
            this.const_2351.dispatch();
        }
    }

    public function method_5799(): Sprite {
        return this.var_4366;
    }

    public function method_1621(): Sprite {
        return this.var_3272;
    }

    public function method_2076(): Sprite {
        return this.tooltipLayer;
    }

    public function method_6313(): Sprite {
        return this.var_5052;
    }

    public function method_6171(): Sprite {
        return this.var_742;
    }

    private function method_2775(param1: Number): void {
        if (this.var_1507 != null) {
            TweenLite.to(this.var_1507, param1, {
                "alpha": 0,
                "onComplete": this.method_2369
            });
        }
    }

    private function method_2369(): void {
        if (this.var_1507 != null) {
            if (this.var_3223.contains(this.var_1507)) {
                this.var_3223.removeChild(this.var_1507);
            }
            this.var_1507 = null;
        }
    }

    private function method_5277(): void {
        this._mapView = this.var_4637.method_3528;
        this.method_956();
        if (this._map) {
            this._mapView.load(this._map);
        }
    }

    private function method_4782(): void {
        this.var_4637.method_4845.remove(this.method_4782);
        this.var_896 = new class_78();
        this.var_4366 = new Sprite();
        this.var_4366.mouseEnabled = false;
        this.var_4366.mouseChildren = false;
        this.var_3223.addChild(this.var_4366);
        this.var_3733 = new Sprite();
        this.var_3733.mouseEnabled = false;
        this.var_3733.mouseChildren = false;
        this.var_3223.addChild(this.var_3733);
        this.var_512 = new Sprite();
        this.var_512.mouseEnabled = class_9.const_3029;
        this.var_3223.addChild(this.var_512);
        var_3291 = new Sprite();
        var_3291.mouseEnabled = class_9.const_3029;
        this.var_3223.addChild(var_3291);
        this.var_900 = new Sprite();
        this.var_900.mouseEnabled = class_9.const_3029;
        this.var_3223.addChild(this.var_900);
        this.var_742 = new Sprite();
        this.var_742.mouseEnabled = class_9.const_3029;
        this.var_3223.addChild(this.var_742);
        this.var_4059 = new Sprite();
        this.var_4059.mouseEnabled = class_9.const_3029;
        this.var_3223.stage.addChild(this.var_4059);
        this.var_5052 = new Sprite();
        this.var_5052.mouseEnabled = class_9.const_3029;
        this.var_3223.stage.addChild(this.var_5052);
        this.tooltipLayer = new Sprite();
        this.tooltipLayer.mouseEnabled = false;
        this.var_3223.stage.addChild(this.tooltipLayer);
        class_79.getInstance().init(this.tooltipLayer);
        this.var_3272 = new Sprite();
        this.var_3272.mouseEnabled = false;
        this.var_3223.stage.addChild(this.var_3272);
        Settings.showUI.changed.add(this.method_3839);
        this.method_3839();
        this.name_20.registerMediator(new HintsMediator(this.var_3272));
        this.name_20.sendNotification(ScreenNotifications.SCREEN_VIEWPORT_RESIZED);
        this.stage.addEventListener(Event.ENTER_FRAME, this.handleEnterFrame);
        this.stage.addEventListener(Event.RENDER, this.method_1404);
        if (this.var_3324 != null) {
            this.var_3324();
            this.var_3324 = null;
        }
    }

    private function method_3839(): void {
        this.var_4366.visible = this.var_3733.visible = var_3291.visible = this.var_900.visible = this.var_512.visible = this.var_742.visible = this.var_4059.visible = this.var_5052.visible = this.tooltipLayer.visible = Settings.showUI.value;
    }

    private function method_5853(): void {
        if (this.var_2248) {
            this.var_2248.removeEventListener(TimerEvent.TIMER, this.method_176);
            this.var_2248.stop();
            this.var_2248 = null;
        }
    }

    private function method_2834(): void {
        this.var_2248 = new Timer(const_2937, 3);
        this.var_2248.addEventListener(TimerEvent.TIMER, this.method_176);
        this.var_2248.start();
    }

    private function method_1477(param1: Boolean): void {
        if (param1) {
            this.method_2834();
        } else {
            this.method_5853();
        }
    }

    private function method_956(): void {
        var_3951 = this.stageWidth;
        var_3454 = Number(var_3951) / 2;
        var_1460 = this.stageHeight;
        var_438 = Number(var_1460) / 2;
        if (this._mapView) {
            this.var_2383.width = var_3951;
            this.var_2383.height = var_1460;
            this._mapView.method_3361(var_3951, var_1460);
        }
    }

    private function method_4951(param1: Event): void {
        clearTimeout(this._resizeTimeout);
        this._resizeTimeout = setTimeout(this.method_3531, RESIZE_DELAY);
    }

    private function handleEnterFrame(param1: Event): void {
        this.stage.invalidate();
    }

    private function method_1507(param1: FullScreenEvent): void {
        this.var_1621.beforeResize = new class_73(this.var_1621.afterResize.x, this.method_6170.afterResize.y);
        if (this.stage.displayState == StageDisplayState.NORMAL) {
            this.stage.removeEventListener(FullScreenEvent.FULL_SCREEN, this.method_1507);
            TweenMax.delayedCall(0.25, this.method_3531);
            this.method_1477(false);
            this.name_20.sendNotification(FeaturesMenuNotifications.TOGGLE_BTN_SELECTION, false, FeaturesMenuConstants.FULLSCREEN);
            EventStreamClient.track("switch_fullscreen", {"fullscreen": 0});
        }
    }

    private function method_3911(param1: FullScreenEvent): void {
        this.method_5853();
    }

    private function method_176(param1: TimerEvent): void {
        this.name_20.method_2407(GuiNotifications.WRITE_NOTIFICATION, "\n \n \n" + class_88.getItem("msg_fullscreen_active_accept_reminder"));
    }

    private function method_1404(param1: Event = null): void {
        var _loc3_: Number = NaN;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        this.var_449 = getTimer();
        this.var_2586 = Number(this.var_449) - Number(this.var_4682);
        var _loc2_: int = 0;
        while (_loc2_ < var_2767) {
            const_2828[_loc2_].updateTimer(this.var_2586);
            _loc2_++;
        }
        this.var_4682 = this.var_449;
        if (this._map != null) {
            if (var_1535 == var_3802) {
                if ((_loc5_ = this.map.method_1203().method_2455(var_3902)) != null) {
                    camera.x = _loc5_.x;
                    camera.y = _loc5_.y;
                } else {
                    var_1535 = var_4664;
                }
            }
            if (this.map.hero != null && var_1535 == var_4664) {
                camera.x = int(this.map.hero.x);
                camera.y = int(this.map.hero.y);
            }
            if (this.var_870) {
                this.var_4430 += this.var_2586;
                if (this.var_4430 > 24) {
                    --this.var_3594;
                    if (Number(this.var_3594) % 10 == 0) {
                        --this.var_1642;
                    }
                    if (this.var_3594 < 0) {
                        this.var_870 = false;
                    } else {
                        camera.x += Number(this.var_1642) * Math.cos(this.var_3594);
                        camera.y += Number(this.var_1642) * Math.sin(this.var_3594);
                    }
                    this.var_4430 = 0;
                }
            }
            _loc3_ = Number(this.var_2586) / 1000;
            _loc4_ = this.var_2795.traits.length - 1;
            while (_loc4_ >= 0) {
                class_80(this.var_2795.traits[_loc4_]).updateObj(_loc3_);
                _loc4_--;
            }
            if (this._mapView) {
                this._mapView.update(camera.x, camera.y, _loc3_);
            }
        }
    }

    private function method_4074(param1: class_86): void {
        if (this.var_1282) {
            this.var_1282.hp.changed.remove(this.method_5698);
        }
        this.var_1282 = param1;
        if (this.var_1282) {
            this.var_1282.hp.changed.add(this.method_5698);
            this.method_5698();
        }
    }

    private function method_5698(): void {
        class_58.instance.updateInfoField(GuiConstants.SHIP_WINDOW, class_93.var_3654, class_91.const_744);
        class_58.instance.updateInfoField(GuiConstants.SHIP_WINDOW, class_93.var_3654, class_91.const_684);
        class_58.instance.updateInfoField(GuiConstants.SHIP_WINDOW, class_93.var_3654, class_91.const_281);
    }

    private function method_6306(): void {
        class_58.instance.updateInfoField(GuiConstants.SHIP_WINDOW, class_93.var_1265, class_91.const_1274);
    }

    public function get method_6457(): Sprite {
        return this.var_900;
    }

    public function get method_608(): Sprite {
        return this.var_512;
    }

    public function get method_6228(): DisplayObjectContainer {
        if (!this.var_2781) {
            this.var_2781 = new Sprite();
        }
        if (!this.var_3733.contains(this.var_2781)) {
            this.var_3733.addChild(this.var_2781);
        }
        this.var_2781.x = class_50.var_3454;
        return this.var_2781;
    }

    public function method_6003(): void {
        if (this.stage.displayState != StageDisplayState.NORMAL) {
            this.stage.displayState = StageDisplayState.NORMAL;
        } else {
            this.name_20.method_2407(ScreenNotifications.FULLSCREEN_CHANGE_COMPLETE);
        }
    }

    public function get method_6170(): ViewportResizeValuesVO {
        return this.var_1621;
    }

    public function get stageWidth(): Number {
        return !!this.stage ? Number(this.stage.stageWidth) : 0;
    }

    public function get stageHeight(): Number {
        return !!this.stage ? Math.max(const_3259, this.stage.stageHeight) : 0;
    }

    public function get name_118(): class_73 {
        return new class_73(this.stageWidth, this.stageHeight);
    }

    public function get stage(): Stage {
        return !!this.var_3223 ? this.var_3223.stage : null;
    }

    public function get method_4978(): Boolean {
        return this._resizeTimeout > 0;
    }

    public function method_2602(): DisplayObjectContainer {
        return this.var_4059;
    }

    public function method_574(param1: int, param2: int, param3: class_73 = null): class_73 {
        return this._mapView.method_574(param1, param2, param3);
    }

    public function get minimap(): class_78 {
        return this.var_896;
    }

    public function get method_3528(): class_87 {
        return this._mapView;
    }

    public function get method_1772(): class_83 {
        return this.var_4457;
    }

    public function get method_5413(): Boolean {
        return this._hasFocus;
    }

    public function get hitLayer(): Sprite {
        return this.var_2383;
    }
}
}
