package package_162 {

import flash.events.MouseEvent;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.DragEvent;
import mx.events.FlexEvent;

import spark.components.Group;
import spark.components.Label;
import spark.components.SkinnableContainer;
import spark.components.VGroup;

public class class_1016 extends class_1015 implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var __moduleFactoryInitialized: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_1016() {
        var bindings: Array;
        var watchers: Array;
        var var_1: uint;
        var target: Object = null;
        var watcherSetupUtilClass: Object = null;
        this.mx_internal::_bindings = [];
        this.mx_internal::_watchers = [];
        this.mx_internal::_bindingsByDestination = {};
        this.mx_internal::_bindingsBeginWithWord = {};
        super();
        mx_internal::_document = this;
        bindings = this.method_340();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_battlestationswindow_view_moduleInstallation_components_ModuleInstallationViewWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_1016[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_2180);
        this.addEventListener("creationComplete", this.method_6242);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_1016._watcherSetupUtil = param1;
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

    private function method_2180(): Array {
        return [this.method_5514(), this.method_5627()];
    }

    private function method_5514(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.styleName = "instalationBackground";
        _loc1_.y = 15;
        _loc1_.width = 225;
        _loc1_.height = 189;
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_5627(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.gap = 10;
        _loc1_.mxmlContent = [this.method_2438(), this.method_4756()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_2438(): Label {
        var _loc1_: Label = new Label();
        _loc1_.setStyle("fontSize", 13);
        _loc1_.setStyle("fontFamily", "EurostileTHea");
        _loc1_.setStyle("color", 16763904);
        _loc1_.setStyle("paddingBottom", -3);
        _loc1_.id = "titleLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        titleLabel = _loc1_;
        BindingManager.executeBindings(this, "titleLabel", titleLabel);
        return _loc1_;
    }

    private function method_4756(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.width = 224;
        _loc1_.gap = -24;
        _loc1_.horizontalCenter = 0;
        _loc1_.mxmlContent = [this.method_3440(), this.method_4548(), this.method_5268(), this.method_2361(), this.method_1630()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3440(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this.method_750(), this.method_1923()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_750(): class_1535 {
        var _loc1_: class_1535 = new class_1535();
        _loc1_.slotId = 9;
        _loc1_.addEventListener("dragEnter", this.method_1964);
        _loc1_.addEventListener("dragExit", this.method_5309);
        _loc1_.addEventListener("dragDrop", this.method_4137);
        _loc1_.addEventListener("click", this.method_3929);
        _loc1_.addEventListener("rollOver", this.method_1537);
        _loc1_.addEventListener("rollOut", this.method_2520);
        _loc1_.id = "leftInner1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        leftInner1 = _loc1_;
        BindingManager.executeBindings(this, "leftInner1", leftInner1);
        return _loc1_;
    }

    public function method_1964(param1: DragEvent): void {
        method_1806(param1);
    }

    public function method_5309(param1: DragEvent): void {
        method_3492(param1);
    }

    public function method_4137(param1: DragEvent): void {
        method_6440(param1);
    }

    public function method_3929(param1: MouseEvent): void {
        method_3739(param1);
    }

    public function method_1537(param1: MouseEvent): void {
        method_6007(param1);
    }

    public function method_2520(param1: MouseEvent): void {
        method_6007(param1);
    }

    private function method_1923(): class_1535 {
        var _loc1_: class_1535 = new class_1535();
        _loc1_.slotId = 2;
        _loc1_.addEventListener("dragEnter", this.method_530);
        _loc1_.addEventListener("dragExit", this.method_2889);
        _loc1_.addEventListener("dragDrop", this.method_5934);
        _loc1_.addEventListener("click", this.method_507);
        _loc1_.addEventListener("rollOver", this.method_2809);
        _loc1_.addEventListener("rollOut", this.method_5668);
        _loc1_.id = "rightInner1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        rightInner1 = _loc1_;
        BindingManager.executeBindings(this, "rightInner1", rightInner1);
        return _loc1_;
    }

    public function method_530(param1: DragEvent): void {
        method_1806(param1);
    }

    public function method_2889(param1: DragEvent): void {
        method_3492(param1);
    }

    public function method_5934(param1: DragEvent): void {
        method_6440(param1);
    }

    public function method_507(param1: MouseEvent): void {
        method_3739(param1);
    }

    public function method_2809(param1: MouseEvent): void {
        method_6007(param1);
    }

    public function method_5668(param1: MouseEvent): void {
        method_6007(param1);
    }

    private function method_4548(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this.method_2977(), this.method_4298()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_2977(): class_1535 {
        var _loc1_: class_1535 = new class_1535();
        _loc1_.slotId = 8;
        _loc1_.addEventListener("dragEnter", this.method_5385);
        _loc1_.addEventListener("dragExit", this.method_5587);
        _loc1_.addEventListener("dragDrop", this.method_386);
        _loc1_.addEventListener("click", this.method_1277);
        _loc1_.addEventListener("rollOver", this.method_2244);
        _loc1_.addEventListener("rollOut", this.method_454);
        _loc1_.id = "leftOuter1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        leftOuter1 = _loc1_;
        BindingManager.executeBindings(this, "leftOuter1", leftOuter1);
        return _loc1_;
    }

    public function method_5385(param1: DragEvent): void {
        method_1806(param1);
    }

    public function method_5587(param1: DragEvent): void {
        method_3492(param1);
    }

    public function method_386(param1: DragEvent): void {
        method_6440(param1);
    }

    public function method_1277(param1: MouseEvent): void {
        method_3739(param1);
    }

    public function method_2244(param1: MouseEvent): void {
        method_6007(param1);
    }

    public function method_454(param1: MouseEvent): void {
        method_6007(param1);
    }

    private function method_4298(): class_1535 {
        var _loc1_: class_1535 = new class_1535();
        _loc1_.slotId = 3;
        _loc1_.addEventListener("dragEnter", this.method_6104);
        _loc1_.addEventListener("dragExit", this.method_1641);
        _loc1_.addEventListener("dragDrop", this.method_3493);
        _loc1_.addEventListener("click", this.method_5303);
        _loc1_.addEventListener("rollOver", this.method_4346);
        _loc1_.addEventListener("rollOut", this.method_954);
        _loc1_.id = "rightOuter1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        rightOuter1 = _loc1_;
        BindingManager.executeBindings(this, "rightOuter1", rightOuter1);
        return _loc1_;
    }

    public function method_6104(param1: DragEvent): void {
        method_1806(param1);
    }

    public function method_1641(param1: DragEvent): void {
        method_3492(param1);
    }

    public function method_3493(param1: DragEvent): void {
        method_6440(param1);
    }

    public function method_5303(param1: MouseEvent): void {
        method_3739(param1);
    }

    public function method_4346(param1: MouseEvent): void {
        method_6007(param1);
    }

    public function method_954(param1: MouseEvent): void {
        method_6007(param1);
    }

    private function method_5268(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this.method_3487()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3487(): class_1535 {
        var _loc1_: class_1535 = new class_1535();
        _loc1_.slotId = 0;
        _loc1_.method_5422 = 1;
        _loc1_.horizontalCenter = 0;
        _loc1_.addEventListener("dragEnter", this.method_1402);
        _loc1_.addEventListener("dragExit", this.method_4817);
        _loc1_.id = "hub";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        hub = _loc1_;
        BindingManager.executeBindings(this, "hub", hub);
        return _loc1_;
    }

    public function method_1402(param1: DragEvent): void {
        method_1806(param1);
    }

    public function method_4817(param1: DragEvent): void {
        method_3492(param1);
    }

    private function method_2361(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this.method_1114(), this.method_214()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_1114(): class_1535 {
        var _loc1_: class_1535 = new class_1535();
        _loc1_.slotId = 7;
        _loc1_.addEventListener("dragEnter", this.method_3514);
        _loc1_.addEventListener("dragExit", this.method_6116);
        _loc1_.addEventListener("dragDrop", this.method_4624);
        _loc1_.addEventListener("click", this.method_3081);
        _loc1_.addEventListener("rollOver", this.method_1009);
        _loc1_.addEventListener("rollOut", this.method_6166);
        _loc1_.id = "leftOuter2";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        leftOuter2 = _loc1_;
        BindingManager.executeBindings(this, "leftOuter2", leftOuter2);
        return _loc1_;
    }

    public function method_3514(param1: DragEvent): void {
        method_1806(param1);
    }

    public function method_6116(param1: DragEvent): void {
        method_3492(param1);
    }

    public function method_4624(param1: DragEvent): void {
        method_6440(param1);
    }

    public function method_3081(param1: MouseEvent): void {
        method_3739(param1);
    }

    public function method_1009(param1: MouseEvent): void {
        method_6007(param1);
    }

    public function method_6166(param1: MouseEvent): void {
        method_6007(param1);
    }

    private function method_214(): class_1535 {
        var _loc1_: class_1535 = new class_1535();
        _loc1_.slotId = 4;
        _loc1_.addEventListener("dragEnter", this.method_4653);
        _loc1_.addEventListener("dragExit", this.method_3442);
        _loc1_.addEventListener("dragDrop", this.method_2915);
        _loc1_.addEventListener("click", this.method_1224);
        _loc1_.addEventListener("rollOver", this.method_1564);
        _loc1_.addEventListener("rollOut", this.method_4011);
        _loc1_.id = "rightOuter2";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        rightOuter2 = _loc1_;
        BindingManager.executeBindings(this, "rightOuter2", rightOuter2);
        return _loc1_;
    }

    public function method_4653(param1: DragEvent): void {
        method_1806(param1);
    }

    public function method_3442(param1: DragEvent): void {
        method_3492(param1);
    }

    public function method_2915(param1: DragEvent): void {
        method_6440(param1);
    }

    public function method_1224(param1: MouseEvent): void {
        method_3739(param1);
    }

    public function method_1564(param1: MouseEvent): void {
        method_6007(param1);
    }

    public function method_4011(param1: MouseEvent): void {
        method_6007(param1);
    }

    private function method_1630(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this.method_2525(), this.method_1668()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_2525(): class_1535 {
        var _loc1_: class_1535 = new class_1535();
        _loc1_.slotId = 6;
        _loc1_.addEventListener("dragEnter", this.method_4919);
        _loc1_.addEventListener("dragExit", this.method_6503);
        _loc1_.addEventListener("dragDrop", this.method_1872);
        _loc1_.addEventListener("click", this.method_3792);
        _loc1_.addEventListener("rollOver", this.method_4630);
        _loc1_.addEventListener("rollOut", this.method_6052);
        _loc1_.id = "leftInner2";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        leftInner2 = _loc1_;
        BindingManager.executeBindings(this, "leftInner2", leftInner2);
        return _loc1_;
    }

    public function method_4919(param1: DragEvent): void {
        method_1806(param1);
    }

    public function method_6503(param1: DragEvent): void {
        method_3492(param1);
    }

    public function method_1872(param1: DragEvent): void {
        method_6440(param1);
    }

    public function method_3792(param1: MouseEvent): void {
        method_3739(param1);
    }

    public function method_4630(param1: MouseEvent): void {
        method_6007(param1);
    }

    public function method_6052(param1: MouseEvent): void {
        method_6007(param1);
    }

    private function method_1668(): class_1535 {
        var _loc1_: class_1535 = new class_1535();
        _loc1_.slotId = 5;
        _loc1_.addEventListener("dragEnter", this.method_2125);
        _loc1_.addEventListener("dragExit", this.method_1727);
        _loc1_.addEventListener("dragDrop", this.method_2984);
        _loc1_.addEventListener("click", this.method_3969);
        _loc1_.addEventListener("rollOver", this.method_6132);
        _loc1_.addEventListener("rollOut", this.method_5638);
        _loc1_.id = "rightInner2";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        rightInner2 = _loc1_;
        BindingManager.executeBindings(this, "rightInner2", rightInner2);
        return _loc1_;
    }

    public function method_2125(param1: DragEvent): void {
        method_1806(param1);
    }

    public function method_1727(param1: DragEvent): void {
        method_3492(param1);
    }

    public function method_2984(param1: DragEvent): void {
        method_6440(param1);
    }

    public function method_3969(param1: MouseEvent): void {
        method_3739(param1);
    }

    public function method_6132(param1: MouseEvent): void {
        method_6007(param1);
    }

    public function method_5638(param1: MouseEvent): void {
        method_6007(param1);
    }

    public function method_6242(param1: FlexEvent): void {
        creationCompleteHandler();
    }

    private function method_340(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): Object {
            return -Number(xOffsetInnerModules);
        }, null, "leftInner1.horizontalCenter");
        var_5[1] = new Binding(this, function (): Object {
            return xOffsetInnerModules;
        }, null, "rightInner1.horizontalCenter");
        var_5[2] = new Binding(this, function (): Object {
            return -Number(xOffsetOuterModules);
        }, null, "leftOuter1.horizontalCenter");
        var_5[3] = new Binding(this, function (): Object {
            return xOffsetOuterModules;
        }, null, "rightOuter1.horizontalCenter");
        var_5[4] = new Binding(this, function (): String {
            var _loc1_: * = class_1534.const_1980;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "hub.holsterMode");
        var_5[5] = new Binding(this, function (): Function {
            return method_6440;
        }, null, "hub.droppingCallback");
        var_5[6] = new Binding(this, function (): Function {
            return method_3739;
        }, null, "hub.clickCallback");
        var_5[7] = new Binding(this, function (): Function {
            return method_6007;
        }, null, "hub.rollCallback");
        var_5[8] = new Binding(this, function (): Object {
            return -Number(xOffsetOuterModules);
        }, null, "leftOuter2.horizontalCenter");
        var_5[9] = new Binding(this, function (): Object {
            return xOffsetOuterModules;
        }, null, "rightOuter2.horizontalCenter");
        var_5[10] = new Binding(this, function (): Object {
            return -Number(xOffsetInnerModules);
        }, null, "leftInner2.horizontalCenter");
        var_5[11] = new Binding(this, function (): Object {
            return xOffsetInnerModules;
        }, null, "rightInner2.horizontalCenter");
        return var_5;
    }
}
}
