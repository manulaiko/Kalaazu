package package_50 {

import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.utils.Timer;

import mx.binding.BindingManager;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;

import net.bigpoint.darkorbit.mvc.common.view.components.DOPopUp;

import spark.components.Group;
import spark.components.Label;
import spark.components.SkinnableContainer;

public class class_154 extends DOPopUp {


    private var var_4739: Label;

    private var var_1268: SkinnableContainer;

    private var var_2405: Label;

    private var var_25: Label;

    private var var_359: Label;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_485: Number;

    private var var_875: Number = 1000;

    private var name_11: int;

    private var totalTime: int;

    private var var_2938: Timer;

    public function class_154() {
        super();
        mx_internal::_document = this;
        this.styleName = "battleStationPopup";
        this.title = "Some progress related title";
        this.minHeight = 225;
        this.minWidth = 146;
        this.width = 245;
        this.height = 215;
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_4893);
        this.addEventListener("creationComplete", this.method_1558);
    }

    override public function set moduleFactory(param1: IFlexModuleFactory): void {
        super.moduleFactory = param1;
        if (this.__moduleFactoryInitialized) {
            return;
        }
        this.__moduleFactoryInitialized = true;
    }

    override public function initialize(): void {
        super.initialize();
    }

    public function method_4130(param1: String, param2: String, param3: String): void {
        this.popupTextLabel.text = param1;
        this.titleLabel.text = param2;
        this.owningClanName.text = param3;
    }

    private function handleCancelButtonClicked(param1: MouseEvent): void {
        handleCloseButtonClick(null);
    }

    public function method_4592(param1: int, param2: int): void {
        this.var_485 = Number(this.var_875) / 1000;
        this.name_11 = param1;
        this.totalTime = param2;
        var _loc3_: String = this.method_1877(param1);
        this.countdownTimerLabel.text = _loc3_;
        if (this.var_2938 != null) {
            this.var_2938.stop();
            this.var_2938.removeEventListener(TimerEvent.TIMER, this.method_2827);
        }
        this.var_2938 = new Timer(this.var_875);
        this.var_2938.addEventListener(TimerEvent.TIMER, this.method_2827);
        this.var_2938.start();
    }

    private function method_135(): void {
        this.var_2938.stop();
        this.var_2938.removeEventListener(TimerEvent.TIMER, this.method_2827);
        handleCloseButtonClick(null);
    }

    private function method_2827(param1: TimerEvent): void {
        this.name_11 -= this.var_485;
        var _loc2_: String = this.method_1877(this.name_11);
        this.countdownTimerLabel.text = _loc2_;
        if (this.name_11 <= 0) {
            this.method_135();
        }
    }

    private function method_1877(param1: Number): String {
        var _loc2_: Number = param1 % 60;
        var _loc3_: Number = Math.floor(param1 % 3600 / 60);
        var _loc4_: Number;
        var _loc5_: String = (_loc4_ = Math.floor(param1 / 3600)) == 0 ? "" : this.method_6462(_loc4_) + ":";
        var _loc6_: * = this.method_6462(_loc3_) + ":";
        var _loc7_: String = this.method_6462(_loc2_);
        return _loc5_ + _loc6_ + _loc7_;
    }

    private function method_6462(param1: uint): String {
        if (param1 < 10) {
            return "0" + param1;
        }
        return String(param1);
    }

    private function method_453(): void {
    }

    public function method_2317(param1: String): void {
        this.factionLogo.styleName = param1;
    }

    private function method_4893(): Array {
        return [this.method_5912(), this.method_2450()];
    }

    private function method_5912(): Group {
        var _loc1_: Group = new Group();
        _loc1_.horizontalCenter = 0;
        _loc1_.width = 225;
        _loc1_.top = -5;
        _loc1_.mxmlContent = [this.method_5703()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_5703(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "";
        _loc1_.setStyle("fontSize", 13);
        _loc1_.setStyle("fontFamily", "EurostileTHea");
        _loc1_.setStyle("color", 16763904);
        _loc1_.id = "titleLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.titleLabel = _loc1_;
        BindingManager.executeBindings(this, "titleLabel", this.titleLabel);
        return _loc1_;
    }

    private function method_2450(): Group {
        var _loc1_: Group = new Group();
        _loc1_.horizontalCenter = 0;
        _loc1_.verticalCenter = 0;
        _loc1_.width = 225;
        _loc1_.height = 150;
        _loc1_.mxmlContent = [this.method_3312(), this.method_2658(), this.method_168(), this.method_4986(), this.method_1880()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3312(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.styleName = "constructionProgressBackground";
        _loc1_.width = 225;
        _loc1_.height = 150;
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_2658(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "";
        _loc1_.horizontalCenter = 0;
        _loc1_.percentHeight = 100;
        _loc1_.top = 12;
        _loc1_.setStyle("fontSize", 11);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.setStyle("color", 14208634);
        _loc1_.id = "popupTextLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.popupTextLabel = _loc1_;
        BindingManager.executeBindings(this, "popupTextLabel", this.popupTextLabel);
        return _loc1_;
    }

    private function method_168(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "ClanName";
        _loc1_.horizontalCenter = 0;
        _loc1_.top = 28;
        _loc1_.setStyle("fontSize", 18);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.setStyle("color", 14931639);
        _loc1_.id = "owningClanName";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.owningClanName = _loc1_;
        BindingManager.executeBindings(this, "owningClanName", this.owningClanName);
        return _loc1_;
    }

    private function method_4986(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.styleName = "";
        _loc1_.horizontalCenter = 0;
        _loc1_.bottom = 45;
        _loc1_.id = "factionLogo";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.factionLogo = _loc1_;
        BindingManager.executeBindings(this, "factionLogo", this.factionLogo);
        return _loc1_;
    }

    private function method_1880(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "";
        _loc1_.bottom = 20;
        _loc1_.horizontalCenter = 0;
        _loc1_.setStyle("fontSize", 18);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.setStyle("color", 14931639);
        _loc1_.id = "countdownTimerLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.countdownTimerLabel = _loc1_;
        BindingManager.executeBindings(this, "countdownTimerLabel", this.countdownTimerLabel);
        return _loc1_;
    }

    public function method_1558(param1: FlexEvent): void {
        this.method_453();
    }

    [Bindable(event="propertyChange")]
    public function get countdownTimerLabel(): Label {
        return this.var_4739;
    }

    public function set countdownTimerLabel(param1: Label): void {
        var _loc2_: Object = this.var_4739;
        if (_loc2_ !== param1) {
            this.var_4739 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "countdownTimerLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get factionLogo(): SkinnableContainer {
        return this.var_1268;
    }

    public function set factionLogo(param1: SkinnableContainer): void {
        var _loc2_: Object = this.var_1268;
        if (_loc2_ !== param1) {
            this.var_1268 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "factionLogo", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get owningClanName(): Label {
        return this.var_2405;
    }

    public function set owningClanName(param1: Label): void {
        var _loc2_: Object = this.var_2405;
        if (_loc2_ !== param1) {
            this.var_2405 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "owningClanName", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get popupTextLabel(): Label {
        return this.var_25;
    }

    public function set popupTextLabel(param1: Label): void {
        var _loc2_: Object = this.var_25;
        if (_loc2_ !== param1) {
            this.var_25 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "popupTextLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get titleLabel(): Label {
        return this.var_359;
    }

    public function set titleLabel(param1: Label): void {
        var _loc2_: Object = this.var_359;
        if (_loc2_ !== param1) {
            this.var_359 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleLabel", _loc2_, param1));
            }
        }
    }
}
}
