package package_46 {

import com.bigpoint.utils.class_73;
import com.bigpoint.utils.class_968;
import com.greensock.TweenLite;
import com.greensock.TweenMax;
import com.greensock.easing.Expo;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.utils.Timer;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.gui.class_58;
import net.bigpoint.darkorbit.gui.windows.class_972;
import net.bigpoint.darkorbit.mvc.common.utils.ScreenScaleUtils;
import net.bigpoint.darkorbit.mvc.common.utils.TextUtils;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowDefinitionVO;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowVO;
import net.bigpoint.darkorbit.mvc.gui.interfaces.IWindow;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.ItemsControlMenuProxy;
import net.bigpoint.darkorbit.settings.Settings;

import package_11.class_39;

import package_142.class_970;

import package_17.class_62;

import package_26.class_94;

import package_33.class_93;

import package_70.SimpleWindowEvent;

import package_79.class_234;
import package_79.class_971;

import package_9.ResourceManager;
import package_9.class_50;

public class class_131 extends Sprite implements IWindow {

    public static const const_2826: uint = 6;

    public static const const_1324: uint = 25;

    public static const const_2011: uint = 25;

    public static const const_3023: int = -1;

    public static const const_2502: int = 1;

    public static const const_3085: int = 2;

    public static const const_1183: int = 0;

    public static const const_1901: int = 1;

    public static const const_2374: int = 0;

    public static const const_3298: int = 1;

    public static const const_2568: int = 2;

    private static const const_1864: int = 750;

    private static const const_3075: int = 750;

    private static const const_3211: int = 100;

    private static const const_1197: int = 4;

    private static const const_2962: int = 8;

    private static const const_316: int = 26;

    private static const const_937: String = "ui";

    protected static const const_3186: String = "window";

    protected static const const_78: String = "dragger";

    protected static const const_1586: String = "resizer";

    protected static const const_1944: String = "windowMaskContainer";

    protected static const const_490: String = "pattern";

    protected static const const_1419: String = "label";

    private static const const_1336: String = "gameclientCommonUI";


    protected var _featureWindowVO: FeatureWindowVO;

    protected var _guiManager: class_58;

    protected var var_2760: Boolean = true;

    protected var var_3405: TextField;

    protected var var_571: Sprite;

    protected var var_4960: class_971;

    protected var var_2747: MovieClip;

    protected var var_1863: Timer;

    protected var var_1026: Sprite;

    protected var var_483: Sprite;

    protected var var_1544: Point;

    protected var var_4702: class_970;

    protected var var_4714: class_970;

    protected var var_2689: class_970;

    protected var var_1763: class_970;

    protected var _rootContainer: MovieClip;

    protected var var_400: Sprite;

    protected var var_3515: MovieClip;

    protected var var_841: MovieClip;

    protected var var_2707: MovieClip;

    protected var var_4691: Sprite;

    protected var var_4202: class_975;

    protected var var_3187: Sprite;

    protected var _overlay: Sprite;

    protected var var_3656: Array;

    protected var _icon: class_972;

    protected var var_3445: Sprite;

    protected var var_1593: Number;

    protected var var_1842: Number;

    protected var var_3930: Number;

    protected var var_2810: int;

    protected var var_153: Boolean;

    protected var var_1987: int;

    protected var var_1236: Boolean = false;

    protected var var_3164: Boolean;

    protected var var_2668: Boolean;

    protected var var_3494: Boolean;

    protected var var_2892: Function;

    protected var var_3792: Number;

    protected var var_2711: Number;

    protected var var_526: Boolean;

    public function class_131() {
        this.var_1544 = new Point();
        this._rootContainer = new MovieClip();
        this.var_3656 = [];
        this.var_2892 = this.method_219;
        super();
    }

    public function preinitialize(param1: FeatureWindowVO, ...rest): void {
        this._featureWindowVO = param1;
        this._guiManager = rest[0] as class_58;
        var _loc3_: class_39 = rest[1] as class_39;
        this.method_3405(param1.showOnTop);
        cacheAsBitmap = true;
        this.method_4341(_loc3_);
        this.method_1074();
        this.method_3267();
        this.method_421();
        this.addChild(this._rootContainer);
        this.addChild(this.var_571 = new Sprite());
        this.var_4960 = new class_971(class_39(ResourceManager.name_15.getFinisher(const_937)), this._rootContainer);
        this.var_571.addChild(this.var_4960);
        this.addChild(this.var_3445 = new Sprite());
        class_973.method_5864(this._guiManager, this, this._featureWindowVO, _loc3_);
        this.method_3453();
        if (param1.titleTextKey) {
            this.setTitle(param1.titleTextKey);
        }
        if (this._featureWindowVO.helpText != null) {
            class_94.getInstance().method_4605(this, TextUtils.getTooltipText(this._featureWindowVO.helpText), 0, 0, 220, true);
        }
    }

    protected function method_421(): void {
        this.var_400 = new Sprite();
        this.var_400.graphics.beginFill(16711680, 0.4);
        this.var_400.graphics.drawRect(0, 0, 100, 100);
        this.var_400.graphics.endFill();
        this.var_400.mouseEnabled = false;
        this._rootContainer.mask = this.var_400;
        this._rootContainer.addChild(this.var_400);
    }

    protected function method_1074(): void {
        var _loc1_: MovieClip = this.var_3515[const_1944];
        _loc1_.mouseEnabled = false;
        _loc1_.cacheAsBitmap = true;
        this.var_2707 = _loc1_["windowMask"];
        this.var_2707.mouseEnabled = false;
        var _loc2_: MovieClip = this.var_3515[const_490];
        _loc2_.mouseEnabled = false;
        _loc2_.cacheAsBitmap = true;
        _loc2_.mask = _loc1_;
    }

    protected function method_4341(param1: class_39): void {
        this.var_3515 = this.method_626(param1);
        this.var_3515.addEventListener(MouseEvent.CLICK, this.method_147);
        this._rootContainer.addChild(this.var_3515);
        if (Boolean(this.definition.transparencySupport)) {
            this.var_3515.alpha = 0;
        }
    }

    protected function method_626(param1: class_39): MovieClip {
        var _loc2_: * = null;
        if (this.definition.zoomable) {
            _loc2_ = MovieClip(param1.getEmbeddedMovieClip("backgroundWithBottomControls"));
        } else if ((Boolean(this.definition.closeable) || Boolean(this.definition.minimizable)) && Boolean(this.definition.resizable)) {
            _loc2_ = MovieClip(param1.getEmbeddedMovieClip("backgroundWithTopControlsResizable"));
        } else if (Boolean(this.definition.closeable) || Boolean(this.definition.minimizable)) {
            _loc2_ = MovieClip(param1.getEmbeddedMovieClip("backgroundWithTopControls"));
        } else if (this.definition.resizable) {
            _loc2_ = MovieClip(param1.getEmbeddedMovieClip("backgroundNormalResizable"));
        } else {
            _loc2_ = MovieClip(param1.getEmbeddedMovieClip("backgroundNormal"));
        }
        return _loc2_;
    }

    protected function method_3267(): void {
        this.var_841 = this.var_3515[const_3186];
        this.var_1026 = this.var_3515[const_78];
        this.var_2747 = this.var_3515[const_1586];
        if (Boolean(this.definition.closeable) || Boolean(this.definition.minimizable)) {
            this.var_4702 = this.method_3626("closeBtn");
            this.var_4702.visible = this.definition.closeable;
            if (this.definition.closeable) {
                this.var_1593 = Number(this.var_841.width) - Number(this.var_4702.x);
                this.var_4702.addEventListener(MouseEvent.CLICK, this.method_4729);
            }
            this.var_4714 = this.method_3626("minimizeBtn");
            this.var_4714.visible = this.definition.minimizable;
            if (this.definition.minimizable) {
                this.var_4714.addEventListener(MouseEvent.CLICK, this.toggleVisibility);
                this.var_4714.addEventListener(MouseEvent.ROLL_OVER, this.method_858);
            }
        }
        if (this.definition.draggable) {
            this.var_1026.alpha = 0;
            this.var_1026.addEventListener(MouseEvent.MOUSE_DOWN, this.method_4305);
            if (Boolean(this.definition.transparencySupport)) {
                this.method_4580();
            }
            this.method_1949();
        } else {
            this.var_3515.removeChild(this.var_1026);
        }
        if (this.definition.resizable) {
            this.var_2747.alpha = 0;
            this.var_2747.addEventListener(MouseEvent.MOUSE_UP, this.method_5935);
            this.var_2747.addEventListener(MouseEvent.MOUSE_DOWN, this.method_1755);
            if (Boolean(this.definition.transparencySupport)) {
                this.method_5425();
            }
            this.var_2747.buttonMode = true;
        } else {
            this.var_3515.removeChild(this.var_2747);
        }
        if (this.definition.zoomable) {
            this.var_2689 = this.method_3626("zoomInBtn");
            this.var_2689.addEventListener(MouseEvent.CLICK, this.method_61);
            this.var_1842 = Number(this.var_841.width) - Number(this.var_2689.x);
            this.var_1763 = this.method_3626("zoomOutBtn");
            this.var_1763.addEventListener(MouseEvent.CLICK, this.method_2554);
            this.var_3930 = Number(this.var_841.width) - Number(this.var_1763.x);
            if (Boolean(this.definition.transparencySupport)) {
                this.method_1207();
            }
        }
        if (this.var_2760) {
            this.var_3405 = this.var_3515[const_1419];
            this.var_3405.defaultTextFormat = class_18.const_1729;
            this.var_3405.embedFonts = class_18.var_1745;
            this.var_3405.height = NaN;
            this.var_3405.autoSize = TextFieldAutoSize.LEFT;
            this.var_3405.mouseEnabled = false;
        }
        if (this.var_1026) {
            this.var_1026.cacheAsBitmap = true;
        }
        if (this.var_2747) {
            this.var_2747.cacheAsBitmap = true;
        }
        if (this.var_2689) {
            this.var_2689.cacheAsBitmap = true;
        }
        if (this.var_1763) {
            this.var_1763.cacheAsBitmap = true;
        }
        if (this.var_4702) {
            this.var_4702.cacheAsBitmap = true;
        }
        this.getUIContainer();
        this.var_4202 = new class_975(this);
        this._rootContainer.addChild(this.var_4202);
        this.var_841.cacheAsBitmap = true;
    }

    public function method_3764(param1: String, param2: Function = null, ...rest): void {
        var _loc4_: Sprite = this.getUIContainer();
        var _loc5_: Array = [param2, this];
        if (rest != null) {
            _loc5_ = _loc5_.concat(rest);
        }
        UISystem.getInstance().loadAndBuildWithResKey(param1, _loc4_, this.method_5860, _loc5_);
    }

    protected function method_5860(...rest): void {
        var _loc2_: Function = rest.shift() as Function;
        if (_loc2_ != null) {
            _loc2_(rest);
        }
    }

    public function update(param1: FeatureWindowVO, param2: Boolean): void {
        this._featureWindowVO = param1;
        if (param2) {
            if (Boolean(this._featureWindowVO.maximized) && !this.maximized) {
                this.maximize();
            }
            if (!this._featureWindowVO.maximized && Boolean(this.maximized)) {
                this.minimize();
            }
        } else if (this.maximized) {
            this.minimize(false);
        }
        this.setTitle(this._featureWindowVO.titleTextKey);
        if (param1.helpText != null) {
            class_94.getInstance().method_4605(this, TextUtils.getTooltipText(param1.helpText), 0, 0, 220, true);
        }
    }

    public function cleanup(param1: Boolean = true): void {
        this.var_3515.removeEventListener(MouseEvent.CLICK, this.method_147);
        if (this.definition.closeable) {
            this.var_4702.removeEventListener(MouseEvent.CLICK, this.method_4729);
        }
        if (this.definition.draggable) {
            this.var_1026.removeEventListener(MouseEvent.MOUSE_UP, this.method_5935);
            this.var_1026.removeEventListener(MouseEvent.MOUSE_DOWN, this.method_4305);
            this.method_4808();
        }
        if (this.definition.resizable) {
            this.var_2747.removeEventListener(MouseEvent.MOUSE_UP, this.method_5935);
            this.var_2747.removeEventListener(MouseEvent.MOUSE_DOWN, this.method_1755);
            this.method_4888();
        }
        if (this.definition.zoomable) {
            this.var_2689.removeEventListener(MouseEvent.CLICK, this.method_61);
            this.var_1763.removeEventListener(MouseEvent.CLICK, this.method_2554);
            this.method_5738();
        }
        if (this.var_3445 != null) {
            this.var_3445.removeEventListener(MouseEvent.CLICK, this.toggleVisibility);
            this.var_3445.removeEventListener(MouseEvent.MOUSE_OVER, this.method_4362);
            this.var_3445.removeEventListener(MouseEvent.MOUSE_OUT, this.method_1742);
            this.var_3445.removeEventListener(MouseEvent.MOUSE_DOWN, this.method_592);
        }
        if (param1) {
            TweenLite.to(this, 0.25, {
                "alpha": 0,
                "onComplete": this.method_2140
            });
        } else {
            this.method_2140();
        }
    }

    public function method_3883(): void {
        this.method_4580();
        this.method_5425();
        if (Boolean(this.var_2689) && Boolean(this.var_1763)) {
            this.method_1207();
        }
    }

    public function method_25(): void {
        this.method_4808();
        this.method_4888();
        if (Boolean(this.var_2689) && Boolean(this.var_1763)) {
            this.method_5738();
        }
    }

    private function method_4580(): void {
        this.var_1026.addEventListener(MouseEvent.MOUSE_OVER, this.method_1544);
        this.var_1026.addEventListener(MouseEvent.MOUSE_OUT, this.method_3881);
    }

    private function method_5425(): void {
        this.var_2747.addEventListener(MouseEvent.MOUSE_OVER, this.method_4209);
        this.var_2747.addEventListener(MouseEvent.MOUSE_OUT, this.method_4306);
    }

    private function method_1207(): void {
        this.var_2689.addEventListener(MouseEvent.MOUSE_OVER, this.method_4362);
        this.var_2689.addEventListener(MouseEvent.MOUSE_OUT, this.method_1742);
        this.var_1763.addEventListener(MouseEvent.MOUSE_OVER, this.method_4362);
        this.var_1763.addEventListener(MouseEvent.MOUSE_OUT, this.method_1742);
    }

    private function method_4808(): void {
        this.var_1026.removeEventListener(MouseEvent.MOUSE_OVER, this.method_1544);
        this.var_1026.removeEventListener(MouseEvent.MOUSE_OUT, this.method_3881);
    }

    private function method_4888(): void {
        this.var_2747.removeEventListener(MouseEvent.MOUSE_OVER, this.method_4209);
        this.var_2747.removeEventListener(MouseEvent.MOUSE_OUT, this.method_4306);
    }

    private function method_5738(): void {
        this.var_2689.removeEventListener(MouseEvent.MOUSE_OVER, this.method_4362);
        this.var_2689.removeEventListener(MouseEvent.MOUSE_OUT, this.method_1742);
        this.var_1763.removeEventListener(MouseEvent.MOUSE_OVER, this.method_4362);
        this.var_1763.removeEventListener(MouseEvent.MOUSE_OUT, this.method_1742);
    }

    private function method_4362(param1: MouseEvent): void {
        if (Boolean(this.definition.transparencySupport)) {
            this.method_3086();
        }
        if (this.maximized) {
            return;
        }
    }

    private function method_1742(param1: MouseEvent): void {
        if (Boolean(this.definition.transparencySupport)) {
            TweenLite.to(this.var_3515, 0.25, {"alpha": 0});
            if (Boolean(this.maximized) && !this.var_1236) {
                TweenLite.to(this.var_3445, 0.25, {"alpha": 0});
            }
            dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.BG_FADE_OUT));
        }
    }

    private function method_1544(param1: MouseEvent): void {
        this.method_3086();
    }

    private function method_3881(param1: MouseEvent): void {
        this.method_1349();
    }

    protected function method_14(param1: MouseEvent): void {
        this.method_5935();
    }

    public function method_4209(param1: MouseEvent): void {
        this.method_3086();
    }

    public function method_4306(param1: MouseEvent): void {
        this.method_1349();
    }

    private function method_5935(param1: MouseEvent = null): void {
        this.method_174.stop();
        stage.removeEventListener(MouseEvent.MOUSE_UP, this.method_14);
        stage.removeEventListener(MouseEvent.ROLL_OUT, this.method_14);
        dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_1979));
        stopDrag();
        if (this.var_1026.hasEventListener(MouseEvent.MOUSE_MOVE)) {
            this.var_1026.removeEventListener(MouseEvent.MOUSE_MOVE, this.method_1317);
            this.var_2747.removeEventListener(MouseEvent.MOUSE_MOVE, this.method_1317);
        }
        this.method_6188();
    }

    private function method_4305(param1: MouseEvent): void {
        if (false) {
            this._guiManager.method_4747(true);
            this.startDrag();
            this.parent.swapChildren(this, parent.getChildAt(-1));
            this.var_1026.addEventListener(MouseEvent.MOUSE_MOVE, this.method_1317);
            stage.addEventListener(MouseEvent.MOUSE_UP, this.method_1928);
            stage.addEventListener(MouseEvent.ROLL_OUT, this.method_1928);
        }
    }

    private function method_1317(param1: MouseEvent): void {
        this.var_3494 = true;
    }

    private function method_1928(param1: MouseEvent): void {
        stopDrag();
        x = int(x);
        y = int(y);
        stage.removeEventListener(MouseEvent.MOUSE_UP, this.method_1928);
        stage.removeEventListener(MouseEvent.ROLL_OUT, this.method_1928);
        if (this.var_1026) {
            this.var_1026.removeEventListener(MouseEvent.MOUSE_MOVE, this.method_1317);
        }
        this.method_6188();
    }

    private function method_592(param1: MouseEvent): void {
        if (this._rootContainer.visible) {
            return;
        }
        if (!this.maximized) {
            return;
        }
        this.startDrag();
    }

    private function method_61(param1: MouseEvent): void {
        dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_402));
        this.method_3711();
        this._guiManager.method_527();
    }

    private function method_2554(param1: MouseEvent): void {
        dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_705));
        this.method_3711();
        this._guiManager.method_527();
    }

    private function method_4729(param1: MouseEvent): void {
        this.cleanup();
    }

    private function method_2140(): void {
        dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.ON_CLOSE));
        this._guiManager.method_1705(this.id);
        this.method_1321(false);
        if (parent) {
            parent.removeChild(this);
        }
    }

    public function method_1349(): void {
        dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.BG_FADE_OUT));
        if (this.definition.transparencySupport) {
            TweenLite.to(this.var_3515, 0.25, {"alpha": 0});
            TweenLite.to(this.var_3445, 0.25, {"alpha": 0});
        }
    }

    public function method_3086(): void {
        dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.BG_FADE_IN));
        if (this.definition.transparencySupport) {
            this.var_3515.visible = true;
            TweenLite.to(this.var_3515, 0.25, {"alpha": Settings.maxWindowsTransparency});
            TweenLite.to(this.var_3445, 0.25, {"alpha": Settings.maxWindowsTransparency});
        }
    }

    protected function method_4759(param1: Bitmap): void {
        if (TweenMax.isTweening(param1)) {
            return;
        }
        param1.visible = false;
    }

    public function toggleVisibility(param1: MouseEvent = null): void {
        if (Boolean(this.isTweaning) || TweenMax.isTweening(this.var_400)) {
            return;
        }
        if (this._rootContainer.visible) {
            this.var_153 = false;
            if (this.definition.minimizable) {
                this.minimize();
            }
            dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_2300));
        } else {
            this.var_153 = true;
            if (this.definition.minimizable) {
                this.maximize();
            }
            dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_328));
        }
    }

    public function get maximized(): Boolean {
        if (this._rootContainer.visible) {
            return true;
        }
        return false;
    }

    public function minimize(param1: Boolean = true, param2: Boolean = false): void {
        if (this._icon) {
            this._icon.method_5156(false, Boolean(this.definition.openCloseAnimation) && !param2);
        }
        this.var_1236 = true;
        this.var_526 = true;
        this.var_153 = false;
        parent.removeChild(this);
        this._guiManager.method_6185().name_47.method_6171().addChild(this);
        TweenLite.killTweensOf(this.var_400);
        TweenLite.killTweensOf(this._rootContainer);
        TweenLite.killTweensOf(this, true);
        if (param1) {
            this.featureWindowVO.maximized = false;
            if (this.id == "settings") {
                this._guiManager.method_707(null);
            }
            dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_2430));
        }
        if (Boolean(this.definition.minimizable) && Boolean(this.maximized)) {
            this.var_1987 = this._guiManager.method_3360();
            this._guiManager.method_4277();
        }
        var _loc3_: Boolean = param2 ? false : Boolean(this.definition.openCloseAnimation);
        if (_loc3_) {
            TweenLite.to(this.var_400, 0.25, {
                "ease": Expo.easeOut,
                "height": 25,
                "onComplete": this.method_1706,
                "onCompleteParams": [_loc3_, param1]
            });
            if (Boolean(this.var_4960) && Boolean(this.maximized)) {
                this.var_4960.hide(false);
            }
        } else {
            TweenLite.killTweensOf(this.var_400);
            this.method_1706(_loc3_, param1);
        }
        if (this._overlay != null) {
            this._overlay.visible = false;
        }
    }

    private function method_1706(param1: Boolean, param2: Boolean = true): void {
        if (param1) {
            TweenLite.to(this.var_400, 0.25, {
                "ease": Expo.easeOut,
                "width": 0,
                "onComplete": this.onMinimized,
                "onCompleteParams": [this._rootContainer, param1, param2]
            });
            TweenLite.to(this._rootContainer, 0.25, {"alpha": 0});
        } else {
            this.var_400.width = 0;
            this._rootContainer.alpha = 0;
            this.onMinimized(this._rootContainer, param1, param2);
        }
    }

    private function onMinimized(param1: MovieClip, param2: Boolean, param3: Boolean = true): void {
        this.var_1236 = false;
        if (Boolean(this.definition.transparencySupport)) {
            this.var_3445.alpha = Settings.maxWindowsTransparency;
            dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.BG_FADE_OUT));
        }
        param1.visible = false;
        this.method_5479(false);
        if (param2 && param3) {
            this.method_3711();
        }
        if (Boolean(this._featureWindowVO.minimizedPosition) && param2) {
            TweenLite.to(this, 0.25, {
                "x": int(this._featureWindowVO.minimizedPosition.x) + class_972.const_1343,
                "y": int(this._featureWindowVO.minimizedPosition.y) + class_972.const_2757,
                "onComplete": this.method_140,
                "ease": Expo.easeOut
            });
        } else {
            this.method_140();
        }
    }

    private function method_5479(param1: Boolean): void {
        this.var_526 = param1;
        dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_1770));
    }

    public function maximize(param1: Boolean = true, param2: Boolean = false): void {
        if (param1) {
            this.featureWindowVO.maximized = true;
        }
        this.var_3445.visible = true;
        this._icon.method_5156(true, this.definition.openCloseAnimation);
        if (!this.maximized) {
            if (param2) {
                this.var_2892(false, param1);
            } else {
                this.var_2892(this.definition.openCloseAnimation, param1);
            }
        }
    }

    private function method_219(param1: Boolean = true, param2: Boolean = true): void {
        if (parent) {
            parent.removeChild(this);
        }
        class_50.method_4278().addChild(this);
        this.method_4253(param1, param2);
    }

    private function method_4140(param1: Boolean = true, param2: Boolean = true): void {
        if (parent) {
            parent.removeChild(this);
        }
        this._guiManager.method_6185().name_47.method_6313().addChild(this);
        this.method_4253(param1, param2);
    }

    private function method_4253(param1: Boolean = true, param2: Boolean = true): void {
        this.var_526 = true;
        this.var_153 = true;
        if (Boolean(this.definition.minimizable) && !this.maximized) {
            this._guiManager.method_1993();
        }
        var _loc3_: class_73 = ScreenScaleUtils.getRealPosFromPercentagePos(class_50.getInstance().name_118, this._featureWindowVO.size, this._featureWindowVO.position);
        if (param1) {
            TweenLite.to(this, 0.5, {
                "ease": Expo.easeOut,
                "x": int(_loc3_.x),
                "y": int(_loc3_.y),
                "onComplete": this.method_6466,
                "onCompleteParams": [param1, param2]
            });
        } else {
            x = _loc3_.x;
            y = _loc3_.y;
            this.method_6466(param1);
        }
        if (this._overlay != null) {
            this._overlay.visible = true;
        }
    }

    private function method_6466(param1: Boolean = true, param2: Boolean = true): void {
        this._rootContainer.visible = true;
        this.var_400.width = 0;
        this.var_400.height = const_2011;
        if (param1) {
            TweenLite.to(this.var_400, 0.25, {
                "ease": Expo.easeOut,
                "width": this.var_841.width,
                "onComplete": this.method_5411,
                "onCompleteParams": [param1]
            });
            TweenLite.to(this._rootContainer, 0.25, {"alpha": 1});
            TweenMax.delayedCall(0.25, this.method_5675, [param2]);
        } else {
            this.var_400.width = this.var_841.width;
            this.method_5411(param1);
            this._rootContainer.alpha = 1;
            this.method_5675(param2);
        }
    }

    private function method_5411(param1: Boolean = true): void {
        if (param1) {
            TweenLite.to(this.var_400, 0.25, {
                "ease": Expo.easeOut,
                "height": this.var_841.height
            });
        } else {
            this.var_400.height = this.var_841.height;
        }
    }

    private function method_5675(param1: Boolean = true): void {
        if (Boolean(this.definition.transparencySupport)) {
            TweenLite.to(this.var_3445, 0.25, {"alpha": 0});
            TweenLite.to(this.var_3515, 0.25, {"alpha": 0});
            dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.BG_FADE_OUT));
        }
        dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_940));
        this.var_526 = false;
        this.method_5635();
        if (param1) {
            this.method_3711();
        }
    }

    private function method_858(param1: MouseEvent): void {
        this.method_3086();
    }

    public function method_1067(): void {
        this.var_1544.x = this.var_2747.x;
        this.var_1544.y = this.var_2747.y;
    }

    public function setTitle(param1: String, param2: Boolean = true): void {
        var _loc3_: * = null;
        if (param2) {
            _loc3_ = class_88.getItem(param1);
        } else {
            _loc3_ = param1;
        }
        if (_loc3_ != null) {
            this.var_3405.text = _loc3_;
            if (this.var_3445 != null) {
                class_94.getInstance().method_1211(this.var_3445, _loc3_);
            }
        }
    }

    public function method_3482(): String {
        return this.var_3405.text;
    }

    public function method_6107(param1: String, param2: Boolean = true): void {
        var _loc3_: * = null;
        if (param2) {
            _loc3_ = class_88.getItem(param1);
        } else {
            _loc3_ = param1;
        }
        if (_loc3_ != null) {
            if (this.var_3445 != null) {
                class_94.getInstance().method_1211(this.var_3445, _loc3_);
            }
        }
    }

    private function method_6188(): void {
        this._guiManager.method_4747(false);
        if (!this._rootContainer.visible) {
            return;
        }
        this.method_5635();
        this.method_3711(true);
    }

    public function method_5120(): void {
        this.var_3445.buttonMode = false;
    }

    public function isLocked(): Boolean {
        if (!this.var_3445.buttonMode) {
            return true;
        }
        return false;
    }

    public function method_1081(): void {
        this.var_3445.buttonMode = true;
    }

    public function method_2029(): Boolean {
        return this.var_153;
    }

    public function method_1321(param1: Boolean): void {
        if (param1) {
            if (!this.var_3187) {
                this.var_3187 = new Sprite();
                this.var_3187.graphics.beginFill(4278190080);
                this.var_3187.graphics.drawRect(0, 0, class_50.method_6533(), class_50.method_1269());
                this.var_3187.alpha = 0.5;
            } else if (this.var_3187.parent) {
                this.var_3187.parent.removeChild(this.var_3187);
            }
            if (!this.maximized) {
                this.maximize(this.definition.openCloseAnimation);
            }
            this.var_3187.mouseEnabled = true;
            parent.addChild(this.var_3187);
            parent.swapChildren(this, this.var_3187);
        } else if (!param1 && this.var_3187 != null && Boolean(this.var_3187.parent)) {
            this.var_3187.parent.removeChild(this.var_3187);
            this.var_3187 = null;
        }
    }

    public function method_3599(): void {
        if (Boolean(this.var_3164) && Boolean(this.menuProxy.configMode) && Boolean(this.maximized)) {
            if (this.var_483 != null && Boolean(this.contains(this.var_483))) {
                this.method_6446();
            }
            this.var_483 = new Sprite();
            this.var_483.graphics.beginFill(16711680);
            this.var_483.graphics.drawRect(0, 0, this.var_841.width, this.var_841.height);
            this.var_483.alpha = 0.3;
            this.var_483.addEventListener(MouseEvent.MOUSE_DOWN, this.method_4305);
            this.var_483.buttonMode = true;
            this.addChild(this.var_483);
        }
    }

    public function method_6446(): void {
        if (Boolean(this.var_3164) && this.var_483 != null && Boolean(this.maximized) && Boolean(this.contains(this.var_483))) {
            this.var_483.removeEventListener(MouseEvent.MOUSE_DOWN, this.method_4305);
            stage.removeEventListener(MouseEvent.MOUSE_UP, this.method_1928);
            stage.removeEventListener(MouseEvent.ROLL_OUT, this.method_1928);
            this.removeChild(this.var_483);
        }
    }

    public function method_1949(): void {
        if (this.var_1026 != null) {
            this.var_1026.buttonMode = Settings.dragWindowsAlways;
        }
    }

    public function get method_4693(): Boolean {
        return this.var_3494;
    }

    public function get method_4091(): Boolean {
        return this.var_3187 != null;
    }

    public function method_6353(): void {
        if (this.method_4091) {
            this.var_3187.width = class_50.method_6533();
            this.var_3187.height = class_50.method_1269();
        }
    }

    public function get id(): String {
        return this._featureWindowVO.id;
    }

    private function method_147(param1: MouseEvent): void {
        var _loc2_: Sprite = Sprite(this.parent);
        _loc2_.swapChildren(this, _loc2_.getChildAt(_loc2_.numChildren - 1));
    }

    public function method_1655(param1: class_93): void {
        this.var_3656.push(param1);
        this._rootContainer.addChild(param1.method_4243);
    }

    public function method_468(): MovieClip {
        return this.var_841;
    }

    public function get iconContainer(): Sprite {
        return this.var_3445;
    }

    public function method_2321(): MovieClip {
        return this._rootContainer;
    }

    public function getUIContainer(): Sprite {
        if (this.var_4691 == null) {
            this.var_4691 = new Sprite();
            this.var_4691.x = const_2826;
            this.var_4691.y = const_1324;
            this._rootContainer.addChild(this.var_4691);
        }
        return this.var_4691;
    }

    public function method_2728(): void {
        var _loc1_: Sprite = this.method_2321();
        while (_loc1_.numChildren > 0) {
            _loc1_.removeChildAt(0);
        }
    }

    public function method_3694(param1: int): class_93 {
        var _loc3_: * = null;
        var _loc2_: int = 0;
        while (_loc2_ < this.var_3656.length) {
            _loc3_ = this.var_3656[_loc2_];
            if (_loc3_.method_3702() == param1) {
                return _loc3_;
            }
            _loc2_++;
        }
        return null;
    }

    public function method_1378(param1: int): class_93 {
        return this.var_3656[param1];
    }

    public function method_1743(param1: int): void {
        var _loc2_: class_93 = this.var_3656[param1];
        if (_loc2_ != null) {
            if (this._rootContainer.contains(_loc2_)) {
                this._rootContainer.removeChild(_loc2_.method_4243);
                this.var_3656.splice(param1, 1);
            }
        }
    }

    public function method_2440(param1: int): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc2_: int = 0;
        while (_loc2_ < this.var_3656.length) {
            _loc3_ = this.var_3656[_loc2_];
            if (_loc3_.method_3702() == param1) {
                if (_loc4_ = _loc3_.method_4243.parent) {
                    _loc4_.removeChild(_loc3_.method_4243);
                }
            }
            _loc2_++;
        }
    }

    public function removeAllElements(): void {
        var _loc1_: * = null;
        for each(_loc1_ in this.var_3656) {
            _loc1_.removeAllElements();
        }
    }

    public function method_1022(param1: class_93): void {
        var _loc3_: * = null;
        var _loc2_: int = 0;
        while (_loc2_ < this.var_3656.length) {
            _loc3_ = this.var_3656[_loc2_];
            if (_loc3_ == param1) {
                this._rootContainer.removeChild(param1.method_4243);
                this.var_3656.splice(_loc2_, 1);
            }
            _loc2_++;
        }
    }

    public function setSize(param1: Number, param2: Number): void {
        this.method_2134(param1);
        this.method_4621(param2);
        this.method_3453();
    }

    public function method_1410(param1: int, param2: Boolean = false): void {
        this.method_2134(param1, param2);
        this.method_3453();
    }

    protected function method_2134(param1: int, param2: Boolean = false): void {
        if (param1 == const_3023) {
            param1 = int(this.method_1414());
        }
        this.var_2747.x = param1;
        this.method_6087();
        if (param2) {
            this.var_841.width = param1;
        } else {
            this.var_841.width = this.var_2747.x + this.var_2747.width;
        }
        this.var_400.width = this.var_841.width;
        if (this.var_2707 != null) {
            this.var_2707.width = Number(this.var_841.width) - Number(const_2962);
        }
    }

    public function method_5152(param1: int, param2: Boolean = false): void {
        this.method_4621(param1, param2);
        this.method_3453();
    }

    protected function method_4621(param1: int, param2: Boolean = false): void {
        if (param1 == const_3023) {
            param1 = int(this.method_4583());
        }
        this.var_2747.y = param1;
        this.method_6087();
        if (param2) {
            this.var_841.height = param1;
        } else {
            this.var_841.height = this.var_2747.y + this.var_2747.height;
        }
        this.var_400.height = this.var_841.height;
        if (this.var_2707 != null) {
            this.var_2707.height = Number(this.var_841.height) - Number(const_1197);
        }
    }

    public function get size(): class_73 {
        if (Boolean(this.definition.resizable) || Boolean(this.definition.zoomable)) {
            return this.resizeDimension;
        }
        return this._featureWindowVO.size;
    }

    public function method_2876(): Number {
        return this.var_841.width;
    }

    public function method_2640(): Number {
        return this.var_841.height;
    }

    override public function get width(): Number {
        return this.var_841.width;
    }

    override public function get height(): Number {
        return this.var_841.height;
    }

    private function get method_4115(): Number {
        return Math.min(Number(this.name_47.stageWidth) - 100, const_1864);
    }

    private function get method_6495(): Number {
        return Math.min(Number(this.name_47.stageHeight) - 100, const_3075);
    }

    public function autoSize(): void {
        this.method_1410(const_3023);
        this.method_5152(const_3023);
    }

    private function method_4583(): int {
        var _loc3_: * = null;
        var _loc1_: int = 0;
        var _loc2_: int = 0;
        while (_loc2_ < this.var_3656.length) {
            _loc3_ = this.var_3656[_loc2_];
            if (_loc3_.height > _loc1_) {
                _loc1_ = int(_loc3_.height);
            }
            _loc2_++;
        }
        return _loc1_ + const_2011;
    }

    private function method_1414(): int {
        var _loc3_: * = null;
        var _loc1_: int = 0;
        var _loc2_: int = 0;
        while (_loc2_ < this.var_3656.length) {
            _loc3_ = this.var_3656[_loc2_];
            _loc1_ += _loc3_.width;
            _loc2_++;
        }
        return _loc1_ + 15;
    }

    public function method_821(): void {
        ++this.var_3792;
        this.method_3453();
    }

    public function method_1755(param1: MouseEvent): void {
        stage.addEventListener(MouseEvent.MOUSE_UP, this.method_14);
        dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_749));
        this._guiManager.method_4508(true);
        if (this._featureWindowVO.definition.resizeBounds != null) {
            this.var_2747.startDrag(false, this._featureWindowVO.definition.resizeBounds);
        } else {
            this.var_2747.startDrag();
        }
        this.method_174.start();
    }

    protected function get method_174(): Timer {
        if (this.var_1863 == null) {
            this.var_1863 = new Timer(100);
            this.var_1863.addEventListener(TimerEvent.TIMER, this.method_5208);
        }
        return this.var_1863;
    }

    protected function method_5208(param1: TimerEvent): void {
        this.method_3453();
    }

    protected function method_3453(): void {
        this.addEventListener(Event.ENTER_FRAME, this.method_3516);
    }

    protected function method_3516(param1: Event = null): void {
        removeEventListener(Event.ENTER_FRAME, this.method_3516);
        if (Boolean(this.definition.resizable) || Boolean(this.definition.zoomable) || Boolean(this.definition.expandable)) {
            if (this.var_2747.x != this.var_3792 || this.var_2747.y != this.var_2711) {
                this.var_2747.x = Math.max(this.var_2747.x, Math.max(150, this.var_3405.x + this.var_3405.width));
                if (this.var_2747.y < const_3211) {
                    this.var_2747.y = const_3211;
                }
                if (this.var_2747.x > this.method_4115) {
                    this.var_2747.x = this.method_4115;
                }
                if (this.var_2747.y > this.method_6495) {
                    this.var_2747.y = this.method_6495;
                }
                this.var_841.width = this.var_2747.x + this.var_2747.width;
                this.var_841.height = this.var_2747.y + this.var_2747.height;
                if (this.var_2707 != null) {
                    this.var_2707.width = Number(this.var_841.width) - Number(const_2962);
                    this.var_2707.height = Number(this.var_841.height) - Number(const_1197);
                    this.var_400.width = this.var_841.width;
                    this.var_400.height = this.var_841.height;
                }
                this.var_4202.width = this.var_841.width;
                this.var_4202.height = this.var_841.height;
                dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_1674));
            }
        }
        this.var_3792 = this.var_2747.x;
        this.var_2711 = this.var_2747.y;
        if (this.definition.draggable) {
            this.var_1026.width = this.var_841.width;
        }
        if (this.definition.closeable) {
            this.var_4702.x = Number(this.var_841.width) - Number(this.var_1593);
        }
        if (this.definition.zoomable) {
            this.var_2689.x = Number(this.var_841.width) - Number(this.var_1842);
            this.var_1763.x = Number(this.var_841.width) - Number(this.var_3930);
        }
        if (this.definition.minimizable) {
            this.var_4714.x = Number(this.var_841.width) - Number(const_316);
        }
    }

    public function get resizeDimension(): class_73 {
        return new class_73(this.var_2747.x, this.var_2747.y);
    }

    private function method_6087(): void {
        if (this.definition.resizable) {
            this.var_1544.x = this.var_2747.x;
            this.var_1544.y = this.var_2747.y;
        }
    }

    public function get method_5820(): MovieClip {
        return this.var_2747;
    }

    public function method_4136(param1: String, param2: String, param3: Vector.<class_234>): void {
        dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.SHOW_POPUP, false, true));
        this.var_4960.show(param1, param2, param3, this.var_841.width, this.var_841.height);
    }

    private function get menuProxy(): ItemsControlMenuProxy {
        return class_62.getInstance().retrieveProxy(ItemsControlMenuProxy.NAME) as ItemsControlMenuProxy;
    }

    public function get featureWindowVO(): FeatureWindowVO {
        return this._featureWindowVO;
    }

    public function set featureWindowVO(param1: FeatureWindowVO): void {
        this._featureWindowVO = param1;
        if (this._featureWindowVO.titleTextKey) {
            this.setTitle(this._featureWindowVO.titleTextKey);
        }
    }

    public function get definition(): FeatureWindowDefinitionVO {
        return this._featureWindowVO.definition;
    }

    public function get position(): class_73 {
        return new class_73(x, y);
    }

    private function method_3626(param1: String): class_970 {
        var _loc2_: DisplayObjectContainer = this.var_3515.getChildByName(param1) as DisplayObjectContainer;
        var _loc3_: class_970 = new class_970(_loc2_);
        this.var_3515.addChild(_loc3_);
        return _loc3_;
    }

    private function get name_47(): class_50 {
        return class_50.getInstance();
    }

    private function method_3405(param1: Boolean): void {
        this.var_2892 = param1 ? this.method_4140 : this.method_219;
    }

    public function method_5778(param1: int = -1, param2: Boolean = false): void {
        this.var_2810 = param1;
    }

    protected function method_2780(param1: DisplayObject, param2: Boolean): void {
        param1.visible = false;
        if (this.var_2810 == -1) {
            this.method_5778(this.var_2810, param2);
        } else {
            --this.var_2810;
            if (this.var_2810 > 0) {
                this.method_5778(this.var_2810, param2);
            }
        }
    }

    public function method_5635(): void {
        var _loc1_: * = null;
        if (stage) {
            _loc1_ = ScreenScaleUtils.correctOutsideViewportPosition(new Rectangle(this.x, this.y, this.width, this.height), new class_73(this.name_47.stageWidth, this.name_47.stageHeight), false);
            this.x = _loc1_.x;
            this.y = _loc1_.y;
        }
    }

    public function initIcon(param1: String, param2: class_39 = null, param3: class_968 = null): void {
        var _loc4_: BitmapData = param3.method_4093(this.id + GuiConstants.NORMAL_SUFFIX);
        var _loc5_: BitmapData = param3.method_4093(this.id + GuiConstants.HOVER_SUFFIX);
        if (Boolean(_loc4_) && Boolean(_loc5_)) {
            if (Boolean(this.definition.minimizable) || Boolean(this.definition.closeable)) {
                this.var_3445.addEventListener(MouseEvent.CLICK, this.toggleVisibility);
                this.var_3445.addEventListener(MouseEvent.MOUSE_DOWN, this.method_592);
                this.var_3445.addEventListener(MouseEvent.MOUSE_OVER, this.method_4362);
                this.var_3445.addEventListener(MouseEvent.MOUSE_OUT, this.method_1742);
                this.var_3445.buttonMode = true;
                if (Boolean(this.definition.transparencySupport)) {
                    this.var_3445.alpha = 0;
                }
            }
        }
        this._icon = new class_972(param2, _loc4_, _loc5_, this.definition.minimizable);
        this.var_3445.addChild(this._icon);
    }

    private function method_140(): void {
        this.var_3445.visible = false;
    }

    public function showInProgressOverlay(): void {
        this.var_4202.show();
    }

    public function hideInProgressOverlay(): void {
        this.var_4202.hide();
    }

    public function method_5436(param1: int, param2: int, param3: int, param4: int, param5: uint = 4473924, param6: Number = 0.7): void {
        this.var_3445.buttonMode = true;
        if (this._overlay == null) {
            this._overlay = new Sprite();
            this._overlay.graphics.beginFill(param5, param6);
            this._overlay.graphics.drawRect(param1, param2 + param4 * 0.65, param3, param4 * 0.35);
            this._overlay.graphics.endFill();
            this._overlay.buttonMode = true;
            this._overlay.useHandCursor = true;
            this._rootContainer.addChild(this._overlay);
        }
    }

    public function method_1710(): void {
        if (this._overlay != null) {
            this._rootContainer.removeChild(this._overlay);
            this._overlay = null;
        }
        this.method_1081();
    }

    public function method_3711(param1: Boolean = false): void {
        dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_1645, param1));
    }

    public function get isTweaning(): Boolean {
        return TweenMax.isTweening(this._rootContainer);
    }

    public function get isTweening(): Boolean {
        return this.var_526;
    }

    public function get method_5591(): Boolean {
        return this.var_2668;
    }

    public function set method_5591(param1: Boolean): void {
        this.var_2668 = param1;
    }
}
}
