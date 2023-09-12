package package_48 {

import mx.binding.BindingManager;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;

import spark.components.BorderContainer;
import spark.components.Group;
import spark.components.Label;
import spark.components.VGroup;

public class class_137 extends class_136 {


    private var var_3036: Group;

    private var __moduleFactoryInitialized: Boolean = false;

    public function class_137() {
        super();
        mx_internal::_document = this;
        this.styleName = "battleStationPopup";
        this.width = 250;
        this.height = 220;
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_3787);
        this.addEventListener("creationComplete", this.method_3877);
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

    private function method_3787(): Array {
        return [this.method_3517()];
    }

    private function method_3517(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this.method_5701()];
        _loc1_.id = "popUpWithInventoryFilter";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.popUpWithInventoryFilter = _loc1_;
        BindingManager.executeBindings(this, "popUpWithInventoryFilter", this.popUpWithInventoryFilter);
        return _loc1_;
    }

    private function method_5701(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.horizontalCenter = 0;
        _loc1_.mxmlContent = [this.method_1733(), this.method_3833()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_1733(): Label {
        var _loc1_: Label = new Label();
        _loc1_.setStyle("fontSize", 13);
        _loc1_.setStyle("fontFamily", "EurostileTHea");
        _loc1_.setStyle("color", 16763904);
        _loc1_.setStyle("paddingBottom", -3);
        _loc1_.id = "toogleLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        toogleLabel = _loc1_;
        BindingManager.executeBindings(this, "toogleLabel", toogleLabel);
        return _loc1_;
    }

    private function method_3833(): BorderContainer {
        var _loc1_: BorderContainer = new BorderContainer();
        _loc1_.width = 225;
        _loc1_.height = 144;
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_3427);
        _loc1_.setStyle("borderColor", 3884108);
        _loc1_.setStyle("backgroundColor", 1448735);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3427(): Array {
        return [this.method_199()];
    }

    private function method_199(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.gap = 0;
        _loc1_.top = 1;
        _loc1_.id = "optionsContainer";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        optionsContainer = _loc1_;
        BindingManager.executeBindings(this, "optionsContainer", optionsContainer);
        return _loc1_;
    }

    public function method_3877(param1: FlexEvent): void {
        creationCompleteHandler();
    }

    [Bindable(event="propertyChange")]
    public function get popUpWithInventoryFilter(): Group {
        return this.var_3036;
    }

    public function set popUpWithInventoryFilter(param1: Group): void {
        var _loc2_: Object = this.var_3036;
        if (_loc2_ !== param1) {
            this.var_3036 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "popUpWithInventoryFilter", _loc2_, param1));
            }
        }
    }
}
}
