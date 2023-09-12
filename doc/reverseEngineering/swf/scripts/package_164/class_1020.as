package package_164 {

import flash.events.MouseEvent;

import mx.binding.BindingManager;
import mx.core.ClassFactory;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.events.DragEvent;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;

import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOButtonBaseSkin;

import package_248.class_1537;

import package_249.class_1538;

import spark.components.BorderContainer;
import spark.components.Group;
import spark.components.HGroup;
import spark.components.Label;
import spark.components.List;
import spark.components.Scroller;
import spark.components.VGroup;
import spark.layouts.HorizontalLayout;

public class class_1020 extends class_1019 {


    private var var_4646: DOButtonBase;

    private var var_632: DOButtonBase;

    private var __moduleFactoryInitialized: Boolean = false;

    public function class_1020() {
        super();
        mx_internal::_document = this;
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_210);
        this.addEventListener("creationComplete", this.method_5082);
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

    private function method_210(): Array {
        return [this.method_3198()];
    }

    private function method_3198(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this.method_4061(), this.method_2759()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_4061(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.verticalAlign = "bottom";
        _loc1_.paddingTop = -3;
        _loc1_.paddingBottom = -2;
        _loc1_.mxmlContent = [this.method_3757(), this.method_3322()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3757(): Label {
        var _loc1_: Label = new Label();
        _loc1_.width = 202;
        _loc1_.setStyle("fontSize", 13);
        _loc1_.setStyle("fontFamily", "EurostileTHea");
        _loc1_.setStyle("color", 16763904);
        _loc1_.setStyle("paddingBottom", -2);
        _loc1_.id = "titleLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        titleLabel = _loc1_;
        BindingManager.executeBindings(this, "titleLabel", titleLabel);
        return _loc1_;
    }

    private function method_3322(): Group {
        var _loc1_: Group = new Group();
        _loc1_.mxmlContent = [this.method_4310(), this.method_2286()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_4310(): DOButtonBase {
        var _loc1_: DOButtonBase = new DOButtonBase();
        _loc1_.width = 15;
        _loc1_.height = 15;
        _loc1_.styleName = "downArrowButtonNormal";
        _loc1_.mouseChildren = false;
        _loc1_.buttonMode = true;
        _loc1_.setStyle("color", 16777215);
        _loc1_.setStyle("skinClass", DOButtonBaseSkin);
        _loc1_.addEventListener("click", this.method_914);
        _loc1_.id = "filterBtnNormal";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.filterBtnNormal = _loc1_;
        BindingManager.executeBindings(this, "filterBtnNormal", this.filterBtnNormal);
        return _loc1_;
    }

    public function method_914(param1: MouseEvent): void {
        method_3932(param1);
    }

    private function method_2286(): DOButtonBase {
        var _loc1_: DOButtonBase = new DOButtonBase();
        _loc1_.width = 15;
        _loc1_.height = 15;
        _loc1_.visible = false;
        _loc1_.styleName = "downArrowButtonActive";
        _loc1_.mouseChildren = false;
        _loc1_.buttonMode = true;
        _loc1_.setStyle("color", 16777215);
        _loc1_.setStyle("skinClass", DOButtonBaseSkin);
        _loc1_.addEventListener("click", this.method_1405);
        _loc1_.id = "filterBtnActive";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.filterBtnActive = _loc1_;
        BindingManager.executeBindings(this, "filterBtnActive", this.filterBtnActive);
        return _loc1_;
    }

    public function method_1405(param1: MouseEvent): void {
        method_3932(param1);
    }

    private function method_2759(): BorderContainer {
        var _loc1_: BorderContainer = new BorderContainer();
        _loc1_.width = 225;
        _loc1_.height = 106;
        _loc1_.layout = this.method_4678();
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_3232);
        _loc1_.setStyle("borderColor", 3884108);
        _loc1_.setStyle("backgroundColor", 1448735);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_4678(): HorizontalLayout {
        var _loc1_: HorizontalLayout = new HorizontalLayout();
        _loc1_.paddingLeft = 2;
        _loc1_.paddingRight = 1;
        _loc1_.paddingTop = 2;
        _loc1_.paddingBottom = 2;
        return _loc1_;
    }

    private function method_3232(): Array {
        return [this.method_4431()];
    }

    private function method_4431(): Scroller {
        var _loc1_: Scroller = new Scroller();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.styleName = "skinnedScroller";
        _loc1_.viewport = this.method_5415();
        _loc1_.setStyle("horizontalScrollPolicy", "off");
        _loc1_.setStyle("verticalScrollPolicy", "on");
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_5415(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentHeight = 100;
        _loc1_.percentWidth = 100;
        _loc1_.top = -1;
        _loc1_.bottom = -1;
        _loc1_.mxmlContent = [this.method_5821()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_5821(): List {
        var _loc1_: List = new List();
        _loc1_.itemRenderer = this.method_1060();
        _loc1_.allowMultipleSelection = false;
        _loc1_.dragEnabled = true;
        _loc1_.setStyle("skinClass", class_1537);
        _loc1_.addEventListener("dragStart", this.method_3397);
        _loc1_.addEventListener("click", this.method_5414);
        _loc1_.id = "moduleItemList";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        moduleItemList = _loc1_;
        BindingManager.executeBindings(this, "moduleItemList", moduleItemList);
        return _loc1_;
    }

    private function method_1060(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_1538;
        return _loc1_;
    }

    public function method_3397(param1: DragEvent): void {
        method_1650(param1);
    }

    public function method_5414(param1: MouseEvent): void {
        method_3896(param1);
    }

    public function method_5082(param1: FlexEvent): void {
        creationCompleteHandler();
    }

    [Bindable(event="propertyChange")]
    public function get filterBtnActive(): DOButtonBase {
        return this.var_4646;
    }

    public function set filterBtnActive(param1: DOButtonBase): void {
        var _loc2_: Object = this.var_4646;
        if (_loc2_ !== param1) {
            this.var_4646 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "filterBtnActive", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get filterBtnNormal(): DOButtonBase {
        return this.var_632;
    }

    public function set filterBtnNormal(param1: DOButtonBase): void {
        var _loc2_: Object = this.var_632;
        if (_loc2_ !== param1) {
            this.var_632 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "filterBtnNormal", _loc2_, param1));
            }
        }
    }
}
}
