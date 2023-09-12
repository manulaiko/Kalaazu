package package_337 {

import flash.events.Event;
import flash.events.MouseEvent;

import mx.binding.BindingManager;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;
import mx.graphics.SolidColor;
import mx.states.State;

import package_65.class_1103;
import package_65.class_203;

import package_76.class_215;

import spark.components.supportClasses.ItemRenderer;
import spark.core.SpriteVisualElement;
import spark.primitives.Rect;

public class class_1898 extends ItemRenderer implements IStateClient2 {


    private var var_1207: Rect;

    private var var_1224: SpriteVisualElement;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_4577: class_1103;

    public function class_1898() {
        super();
        mx_internal::_document = this;
        this.autoDrawBackground = false;
        this.top = 0;
        this.bottom = 0;
        this.percentWidth = 100;
        this.mxmlContent = [this.method_2895(), this.method_2507()];
        this.currentState = "normal";
        this.addEventListener("dataChange", this.method_1017);
        states = [new State({
            "name": "normal",
            "overrides": []
        }), new State({
            "name": "hovered",
            "overrides": []
        }), new State({
            "name": "selected",
            "overrides": []
        })];
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
            this.contentBackgroundAlpha = 0;
            this.paragraphSpaceAfter = 0;
            this.paragraphEndIndent = 0;
            this.paragraphSpaceBefore = 0;
            this.paragraphStartIndent = 0;
        };
    }

    override public function initialize(): void {
        super.initialize();
    }

    override public function set data(param1: Object): void {
        super.data = param1;
    }

    private function method_2141(): void {
        while (this.treeContainer.numChildren) {
            this.treeContainer.removeChildAt(0);
        }
        if (this.method_6487 != null) {
            this.var_4577 = new class_1103();
            this.var_4577.quest = this.method_6487;
            this.var_4577.x = 5;
            this.var_4577.y = 0;
            this.var_4577.isDefaultVisible = true;
            this.var_4577.setSize(this.width, 300);
            this.var_4577.update(false);
            this.var_4577.method_1707();
            this.var_4577.addEventListener(class_1103.const_2446, this.updateLayout);
            this.treeContainer.addChild(this.var_4577);
            addEventListener(MouseEvent.CLICK, this.listener);
            this.updateLayout();
        } else {
            class_215.removeDisplayObject(this.var_4577);
        }
    }

    private function listener(param1: MouseEvent): void {
        dispatchEvent(new Event(class_1103.const_2446, true));
        this.updateLayout();
    }

    private function updateLayout(param1: Event = null): void {
        this.rectBacground.height = this.var_4577.y + this.var_4577.method_2789 + 10;
    }

    private function get method_6487(): class_203 {
        return data as class_203;
    }

    private function method_2895(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.right = 0;
        _loc1_.left = 0;
        _loc1_.fill = this.method_656();
        _loc1_.initialized(this, "rectBacground");
        this.rectBacground = _loc1_;
        BindingManager.executeBindings(this, "rectBacground", this.rectBacground);
        return _loc1_;
    }

    private function method_656(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 1712165;
        _loc1_.alpha = 1;
        return _loc1_;
    }

    private function method_2507(): SpriteVisualElement {
        var _loc1_: SpriteVisualElement = new SpriteVisualElement();
        _loc1_.horizontalCenter = -130;
        _loc1_.initialized(this, "treeContainer");
        this.treeContainer = _loc1_;
        BindingManager.executeBindings(this, "treeContainer", this.treeContainer);
        return _loc1_;
    }

    public function method_1017(param1: FlexEvent): void {
        this.method_2141();
    }

    [Bindable(event="propertyChange")]
    public function get rectBacground(): Rect {
        return this.var_1207;
    }

    public function set rectBacground(param1: Rect): void {
        var _loc2_: Object = this.var_1207;
        if (_loc2_ !== param1) {
            this.var_1207 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rectBacground", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get treeContainer(): SpriteVisualElement {
        return this.var_1224;
    }

    public function set treeContainer(param1: SpriteVisualElement): void {
        var _loc2_: Object = this.var_1224;
        if (_loc2_ !== param1) {
            this.var_1224 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "treeContainer", _loc2_, param1));
            }
        }
    }
}
}
