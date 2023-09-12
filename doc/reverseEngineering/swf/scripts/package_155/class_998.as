package package_155 {

import com.bigpoint.utils.class_129;
import com.greensock.TweenLite;
import com.greensock.TweenMax;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.utils.Timer;

import mx.core.UIComponent;
import mx.events.PropertyChangeEvent;
import mx.events.ToolTipEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.mvc.battlestationswindow.class_1023;
import net.bigpoint.darkorbit.mvc.common.view.components.DOHtmlTooltip;

import package_127.class_356;

import package_163.class_1520;

import package_9.ResourceManager;

import spark.components.Group;
import spark.components.Image;
import spark.components.Label;
import spark.primitives.BitmapImage;
import spark.primitives.Rect;

public class class_998 extends Group {

    protected static const const_3282: int = 30;

    protected static const const_706: int = 30;

    public static const INSTALLING_STATE: String = "INSTALLING_STATE";

    public static const INSTALLED_STATE: String = "INSTALLED_STATE";


    private var var_540: BitmapImage;

    private var var_4571: Group;

    private var var_2384: Rect;

    private var var_3612: BitmapImage;

    private var var_4727: BitmapImage;

    private var var_809: Label;

    private var var_1145: Image;

    private var var_4195: Group;

    private var var_4532: BitmapImage;

    public var state: String;

    private var var_3453: MovieClip;

    private var _selected: Boolean;

    private var var_1233: int;

    private var _slotId: int;

    private var _itemId: int;

    private var var_4825: class_1520;

    private var _mask: Sprite;

    private var var_4138: Boolean = false;

    private var var_4493: Boolean;

    private var var_2214: String;

    private var var_3214: Boolean = false;

    private var var_18: Boolean = true;

    private var var_1515: Boolean = true;

    private var var_883: Timer;

    public function class_998() {
        super();
    }

    protected function handleCreationComplete(): void {
        callLater(this.initIcon);
        callLater(this.method_5734);
        this.repairIcon.buttonMode = true;
        addEventListener(Event.REMOVED_FROM_STAGE, this.removeFromStageListener);
    }

    public function method_5734(): void {
        if (!this.var_4493) {
            this.backgroundImage.source = class_1023.getBitmapData("itemslot_empty");
            this.backgroundImage.visible = true;
        }
    }

    public function initIcon(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (this.initialized) {
            this.hovered = false;
            this.selected = false;
            if (this.iconContainer.numChildren) {
                this.iconContainer.removeAllElements();
            }
            if (!this.isEmpty) {
                this.var_2214 = this.method_4217;
                _loc1_ = ResourceManager.getMovieClip("battleStationsUI", this.var_2214);
                _loc1_.width = const_3282;
                _loc1_.height = const_706;
                this.repairAnimContainer.x = this.repairIcon.x = _loc1_.x = 1;
                this.repairAnimContainer.y = this.repairIcon.y = _loc1_.y = 1;
                _loc2_ = this.method_2428(_loc1_);
                this.iconContainer.addElement(_loc2_);
                this.iconContainer.visible = true;
                this.method_5378();
                toolTip = this.method_3247 + " (" + this.method_550.name + ") ";
                this.method_2064();
            } else {
                toolTip = null;
                this.repairIcon.visible = false;
                this.repairAnimContainer.visible = false;
                if (this.var_4493) {
                    this.backgroundImage.visible = false;
                }
                this.method_5881();
                this.method_215();
            }
            this.method_2446();
        }
    }

    private function method_2446(): void {
        if (this.var_4493 == false) {
            if (!this.destroyedIcon.source) {
                this.destroyedIcon.source = class_1023.getBitmapData("inventory_slot_destroyed");
                this.destroyedIcon.visible = true;
            }
            if (this.isEmpty) {
                this.destroyedIcon.visible = false;
                this.destroyedIcon.alpha = 0;
            } else {
                this.destroyedIcon.visible = this.var_4825.method_1366;
                this.destroyedIcon.alpha = !!this.var_4825.method_1366 ? 0.7 : 0;
            }
        }
    }

    private function method_2064(): void {
        if (this.var_4825.emergencyRepairSecondsLeft == 0) {
            this.method_5881();
        } else {
            this.method_3286();
        }
    }

    public function method_5378(): void {
        var _loc1_: String = class_1023.const_1822[this.var_4825.type];
        var _loc2_: MovieClip = ResourceManager.getMovieClip("battleStationsUI", _loc1_);
        TweenLite.to(_loc2_, 0, {
            "colorMatrixFilter": {
                "brightness": 0,
                "saturation": 0
            }
        });
        this._mask = new Sprite();
        this._mask.graphics.beginFill(16777215);
        this._mask.graphics.drawRect(0, 0, _loc2_.width, _loc2_.height);
        this._mask.graphics.endFill();
        this._mask.scaleY = 0;
        _loc2_.addChild(this._mask);
        _loc2_.width = const_3282;
        _loc2_.height = const_706;
        _loc2_.x = this._mask.x = 1;
        _loc2_.y = this._mask.y = 1;
        _loc2_.mask = this._mask;
        var _loc3_: UIComponent = this.method_2428(_loc2_);
        this.iconContainer.addElement(_loc3_);
        this.iconContainer.visible = true;
    }

    public function method_4592(param1: int, param2: int): void {
        this.var_4825.installationSecondsLeft = param1;
        this.var_4825.installationSecondsTotal = param2;
        if (this.initialized) {
            this.method_4404(null);
        } else {
            addEventListener("creationComplete", this.method_4404);
        }
    }

    private function method_4404(param1: Event): void {
        this.method_215();
        if (this.installationProgressTimer.filters.length == 0) {
            TweenMax.to(this.installationProgressTimer, 0, {
                "dropShadowFilter": {
                    "blurX": 2,
                    "blurY": 2,
                    "distance": 0,
                    "alpha": 1
                }
            });
            TweenMax.to(this.installationProgressTimer, 0, {
                "glowFilter": {
                    "color": 0,
                    "blurX": 2,
                    "blurY": 2,
                    "strength": 5,
                    "alpha": 1
                }
            });
        }
        if (this.var_4825.installationSecondsLeft > 0) {
            this.method_6464();
            if (this.var_883) {
                this.method_215();
            }
            if (this.var_4825.buildStartTime == 0) {
                this.var_4825.buildStartTime = new Date().getTime();
            }
            this.var_883 = new Timer(200);
            this.var_883.addEventListener(TimerEvent.TIMER, this.method_719);
            this.var_883.start();
        }
    }

    private function method_719(param1: TimerEvent): void {
        var _loc3_: int = 0;
        this.var_4825.instalationDuration = new Date().getTime() - Number(this.var_4825.buildStartTime);
        var _loc2_: int = Number(this.var_4825.installationSecondsLeft) * 1000 - Number(this.var_4825.instalationDuration);
        if (_loc2_ > 0 && this.var_4825.buildStartTime > 0) {
            _loc3_ = Math.ceil(_loc2_ / 1000);
            this.method_6464(_loc3_);
        } else {
            this.var_4825.buildStartTime = 0;
            this.method_135();
        }
    }

    private function method_135(): void {
        this.method_743 = false;
        this.backgroundFlash.alpha = 1;
        this.backgroundFlash.visible = true;
        TweenLite.to(this.backgroundFlash, 0.3, {"autoAlpha": 0});
        this.iconContainer.alpha = 0;
        TweenLite.to(this.iconContainer, 0.8, {
            "alpha": 1,
            "onComplete": this.method_4320
        });
        this.method_215();
    }

    private function method_4320(): void {
        this.backgroundFlash.alpha = 0;
    }

    private function method_6464(param1: int = 0): void {
        var _loc2_: Number = param1 / Number(this.var_4825.installationSecondsTotal);
        if (Boolean(this._mask) && Boolean(this.var_4138)) {
            this._mask.scaleY = _loc2_;
            this._mask.y = 1;
        }
        this.installationProgressTimer.visible = param1 > 0;
        this.installationProgressTimer.text = !!param1 ? class_129.method_1101(param1) : "";
    }

    public function set method_883(param1: Boolean): void {
        this.var_3214 = param1;
    }

    public function method_3286(): void {
        this.var_3214 = true;
        this.method_3152();
    }

    private function method_3152(param1: Boolean = true): void {
        if (param1) {
            this.method_3477();
        }
        if (this.var_3214) {
            this.repairAnimContainer.visible = true;
            this.var_3453.play();
        } else {
            this.method_5881();
        }
    }

    public function method_3477(): void {
        var _loc1_: * = null;
        if (Boolean(this.var_4493) && !this.repairIcon.source) {
            this.repairIcon.source = class_1023.getBitmapData("repair_hover");
            this.var_3453 = ResourceManager.getMovieClip("battleStationsUI", "repair_progress_anim");
            this.var_3453.gotoAndStop(0);
            _loc1_ = this.method_2428(this.var_3453);
            this.repairAnimContainer.addElement(_loc1_);
        }
    }

    public function method_5881(): void {
        this.var_3214 = false;
        TweenLite.killTweensOf(this.repairAnimContainer);
        TweenLite.killDelayedCallsTo(this.repairAnimContainer);
        this.repairAnimContainer.visible = false;
    }

    override protected function commitProperties(): void {
        super.commitProperties();
        if (this.var_18) {
            this.var_18 = false;
            callLater(this.initIcon);
        }
    }

    protected function method_1216(param1: ToolTipEvent): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc2_: DOHtmlTooltip = new DOHtmlTooltip();
        var _loc3_: * = "";
        if (this.method_4799) {
            if (this.method_550) {
                _loc3_ += this.method_3247 + " (" + this.method_550.name + ")";
                _loc3_ += "<br>";
                _loc4_ = class_1023.const_1384[this.var_4825.type];
                _loc5_ = class_88.getItem("popup_bswin_module_filter_" + _loc4_);
                _loc3_ += class_88.getItem("ttip_module_type").replace("%TYPE%", _loc5_);
                _loc3_ += "<br>";
                _loc3_ += class_88.getItem("ttip_upgrade_level").replace("%COUNT%", this.var_4825.upgradeLevel);
                _loc3_ += "<br>";
                if (this.var_4493) {
                    _loc3_ += class_88.getItem("ttip_module_owner").replace("%NAME%", this.var_4825.ownerName);
                }
                _loc2_.htmlText = _loc3_;
                param1.toolTip = _loc2_;
            }
        }
    }

    public function set selected(param1: Boolean): void {
        this._selected = param1;
        if (Boolean(this._selected) && this.isEmpty == false) {
            if (!this.selectedIcon.source) {
                this.selectedIcon.source = class_1023.getBitmapData("inventory_slot_selected");
                this.selectedIcon.visible = true;
            }
            this.selectedIcon.visible = true;
        } else {
            this.selectedIcon.visible = false;
        }
    }

    public function set method_743(param1: Boolean): void {
        if (!param1) {
            if (this._mask) {
                this._mask.scaleY = 0;
            }
        }
        this.var_4138 = param1;
    }

    public function set moduleVO(param1: class_1520): void {
        if (param1 != this.var_4825) {
            this.var_18 = true;
            this.var_4825 = param1;
            this.var_1233 = this.var_4825.type;
            invalidateProperties();
        }
    }

    private function method_2428(param1: DisplayObject): UIComponent {
        var _loc2_: UIComponent = new UIComponent();
        _loc2_.addChild(param1);
        return _loc2_;
    }

    private function get method_4217(): String {
        if (this.var_4825) {
            return class_1023.const_1822[this.var_4825.type];
        }
        return class_1023.const_1822[this.var_1233];
    }

    public function get method_883(): Boolean {
        if (this.var_3214) {
            return true;
        }
        if (Boolean(this.var_4825) && this.var_4825.emergencyRepairSecondsLeft > 0) {
            return true;
        }
        return false;
    }

    private function method_215(): void {
        if (this.var_883) {
            this.var_883.removeEventListener(TimerEvent.TIMER, this.method_719);
            this.var_883.stop();
            this.var_883 = null;
        }
        if (this.var_4825) {
            this.var_4825.instalationDuration = 0;
        }
        this.installationProgressTimer.text = "";
    }

    public function set method_3040(param1: Boolean): void {
        this.var_4493 = param1;
    }

    public function get method_3247(): String {
        if (this.method_4799) {
            return class_88.method_734("items", "items_" + this.method_4799 + "_fullname");
        }
        return null;
    }

    private function get method_550(): class_356 {
        if (this.method_4799) {
            return class_126.instance.var_2033[this.method_4799];
        }
        return null;
    }

    private function get method_4799(): String {
        return class_1023.const_528[this.var_4825.type];
    }

    protected function method_2654(param1: MouseEvent): void {
        if (!this.isEmpty) {
            this.hovered = param1.type == MouseEvent.ROLL_OVER;
        }
    }

    public function set hovered(param1: Boolean): void {
        if (param1 && this.state == INSTALLED_STATE) {
            return;
        }
        if (!this.hoverIcon.source && param1) {
            this.hoverIcon.source = class_1023.getBitmapData("inventory_slot_hover");
            this.hoverIcon.visible = true;
        }
        TweenLite.to(this.hoverIcon, 0.3, {"autoAlpha": int(param1)});
    }

    private function removeFromStageListener(param1: Event): void {
        this.method_215();
        this.method_5881();
    }

    public function get method_1366(): Boolean {
        return this.var_1515;
    }

    public function set method_1366(param1: Boolean): void {
        this.var_1515 = param1;
        this.repairIcon.visible = true;
        this.repairIcon.alpha = 1;
    }

    public function get isEmpty(): Boolean {
        if (this.var_4825) {
            return this.var_4825.type == class_1520.NONE;
        }
        return this.var_1233 == class_1520.NONE;
    }

    public function get moduleType(): int {
        return this.var_1233;
    }

    public function set moduleType(param1: int): void {
        if (param1 != this.var_1233) {
            callLater(this.initIcon);
        }
        this.var_1233 = param1;
    }

    public function get slotId(): int {
        return this._slotId;
    }

    public function set slotId(param1: int): void {
        this._slotId = param1;
    }

    public function get itemId(): int {
        return this._itemId;
    }

    public function set itemId(param1: int): void {
        this._itemId = param1;
    }

    public function get moduleVO(): class_1520 {
        return this.var_4825;
    }

    public function get method_1771(): MovieClip {
        return this.var_3453;
    }

    [Bindable(event="propertyChange")]
    public function get backgroundImage(): BitmapImage {
        return this.var_540;
    }

    public function set backgroundImage(param1: BitmapImage): void {
        var _loc2_: Object = this.var_540;
        if (_loc2_ !== param1) {
            this.var_540 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get iconContainer(): Group {
        return this.var_4571;
    }

    public function set iconContainer(param1: Group): void {
        var _loc2_: Object = this.var_4571;
        if (_loc2_ !== param1) {
            this.var_4571 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconContainer", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get backgroundFlash(): Rect {
        return this.var_2384;
    }

    public function set backgroundFlash(param1: Rect): void {
        var _loc2_: Object = this.var_2384;
        if (_loc2_ !== param1) {
            this.var_2384 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundFlash", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hoverIcon(): BitmapImage {
        return this.var_3612;
    }

    public function set hoverIcon(param1: BitmapImage): void {
        var _loc2_: Object = this.var_3612;
        if (_loc2_ !== param1) {
            this.var_3612 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hoverIcon", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get selectedIcon(): BitmapImage {
        return this.var_4727;
    }

    public function set selectedIcon(param1: BitmapImage): void {
        var _loc2_: Object = this.var_4727;
        if (_loc2_ !== param1) {
            this.var_4727 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedIcon", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get installationProgressTimer(): Label {
        return this.var_809;
    }

    public function set installationProgressTimer(param1: Label): void {
        var _loc2_: Object = this.var_809;
        if (_loc2_ !== param1) {
            this.var_809 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "installationProgressTimer", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get repairIcon(): Image {
        return this.var_1145;
    }

    public function set repairIcon(param1: Image): void {
        var _loc2_: Object = this.var_1145;
        if (_loc2_ !== param1) {
            this.var_1145 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "repairIcon", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get repairAnimContainer(): Group {
        return this.var_4195;
    }

    public function set repairAnimContainer(param1: Group): void {
        var _loc2_: Object = this.var_4195;
        if (_loc2_ !== param1) {
            this.var_4195 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "repairAnimContainer", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get destroyedIcon(): BitmapImage {
        return this.var_4532;
    }

    public function set destroyedIcon(param1: BitmapImage): void {
        var _loc2_: Object = this.var_4532;
        if (_loc2_ !== param1) {
            this.var_4532 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "destroyedIcon", _loc2_, param1));
            }
        }
    }
}
}
