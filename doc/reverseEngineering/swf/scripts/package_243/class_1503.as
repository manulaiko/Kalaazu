package package_243 {

import flash.events.Event;

import mx.binding.BindingManager;
import mx.core.ClassFactory;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;

import package_336.class_1897;

import spark.components.List;
import spark.components.SkinnableContainer;

public class class_1503 extends SkinnableContainer {


    private var var_3913: List;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_4916: Number = 0;

    public function class_1503() {
        super();
        mx_internal::_document = this;
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_5910);
        this.addEventListener("initialize", this.method_4863);
        this.addEventListener("creationComplete", this.method_4612);
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

    private function method_218(): void {
        addEventListener(class_1897.const_1746, this.method_2929);
    }

    private function method_2929(param1: Event): void {
        var _loc3_: Number = NaN;
        var _loc2_: class_1897 = param1.target as class_1897;
        if (_loc2_) {
            _loc3_ = Number(_loc2_.rendererContent.rewardNameLabel.width);
            if (_loc3_ != this.var_4916) {
                this.var_4916 = Math.max(this.var_4916, _loc3_);
                this.updateLayout();
            }
        }
    }

    private function updateLayout(): void {
        var _loc1_: int = 0;
        var _loc2_: * = null;
        if (Boolean(this.rewardsList) && Boolean(this.rewardsList.dataGroup)) {
            _loc1_ = 0;
            while (_loc1_ != this.rewardsList.dataGroup.numElements) {
                _loc2_ = this.rewardsList.dataGroup.getElementAt(_loc1_) as class_1897;
                if (_loc2_) {
                    _loc2_.rendererContent.rewardNameLabel.minWidth = this.var_4916;
                    _loc2_.rendererContent.rewardNameLabel.invalidateSize();
                    _loc2_.rendererContent.rewardNameLabel.invalidateDisplayList();
                    _loc2_.rendererContent.rewardNameLabel.invalidateLayoutDirection();
                    _loc2_.rendererContent.invalidateDisplayList();
                    _loc2_.rendererContent.invalidateSize();
                    _loc2_.rendererContent.invalidateLayoutDirection();
                }
                _loc1_++;
            }
        }
    }

    private function creationCompleteHandler(): void {
        this.rewardsList.scroller.verticalScrollBar.addEventListener(Event.CHANGE, this.method_5909);
    }

    private function method_5909(param1: Event): void {
        this.updateLayout();
    }

    private function method_5910(): Array {
        return [this.method_1937()];
    }

    private function method_1937(): List {
        var _loc1_: List = new List();
        _loc1_.top = -2;
        _loc1_.bottom = -1;
        _loc1_.styleName = "skinnedList";
        _loc1_.itemRenderer = this.method_5488();
        _loc1_.left = 11;
        _loc1_.percentWidth = 100;
        _loc1_.setStyle("verticalScrollPolicy", "auto");
        _loc1_.id = "rewardsList";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.rewardsList = _loc1_;
        BindingManager.executeBindings(this, "rewardsList", this.rewardsList);
        return _loc1_;
    }

    private function method_5488(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_1897;
        return _loc1_;
    }

    public function method_4863(param1: FlexEvent): void {
        this.method_218();
    }

    public function method_4612(param1: FlexEvent): void {
        this.creationCompleteHandler();
    }

    [Bindable(event="propertyChange")]
    public function get rewardsList(): List {
        return this.var_3913;
    }

    public function set rewardsList(param1: List): void {
        var _loc2_: Object = this.var_3913;
        if (_loc2_ !== param1) {
            this.var_3913 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rewardsList", _loc2_, param1));
            }
        }
    }
}
}
