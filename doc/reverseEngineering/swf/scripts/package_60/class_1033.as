package package_60 {

import flash.events.MouseEvent;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.collections.ArrayList;
import mx.collections.IList;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;

import spark.components.Button;
import spark.components.DropDownList;
import spark.components.HGroup;
import spark.components.HSlider;
import spark.components.Label;
import spark.components.SkinnableContainer;
import spark.components.VGroup;

public class class_1033 extends SkinnableContainer implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var var_2460: Button;

    private var var_1396: VGroup;

    private var var_1917: Label;

    private var var_1276: Label;

    private var var_1140: DropDownList;

    private var var_1176: HGroup;

    private var var_3977: VGroup;

    private var var_83: VGroup;

    private var var_4788: Label;

    private var var_4799: DropDownList;

    private var var_3404: Label;

    private var var_1590: HSlider;

    private var var_3628: DropDownList;

    private var var_435: Label;

    private var var_2178: Label;

    private var var_2521: DropDownList;

    private var var_3776: Label;

    private var var_1506: DropDownList;

    private var var_4962: Label;

    private var var_1481: DropDownList;

    private var var_2942: Label;

    private var var_578: DropDownList;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_2876: ArrayList;

    private var var_2984: ArrayList;

    private var var_319: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_1033() {
        var bindings: Array;
        var watchers: Array;
        var var_1: uint;
        var target: Object = null;
        var watcherSetupUtilClass: Object = null;
        this.var_2876 = new ArrayList([{"label": "200x300"}, {"label": "1280x900"}]);
        this.var_2984 = new ArrayList([{"label": "High"}, {"label": "Medium"}, {"label": "Low"}]);
        this.mx_internal::_bindings = [];
        this.mx_internal::_watchers = [];
        this.mx_internal::_bindingsByDestination = {};
        this.mx_internal::_bindingsBeginWithWord = {};
        super();
        mx_internal::_document = this;
        bindings = this.method_278();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_settings_view_components_DisplaySettingsTabContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_1033[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.percentWidth = 100;
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_6409);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_1033._watcherSetupUtil = param1;
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

    private function method_2168(param1: MouseEvent): void {
        if (this.var_319) {
            this.var_319 = false;
            this.advancedSettings.visible = this.var_319;
            this.advancedModeBtn.label = "Advanced mode";
        } else {
            this.var_319 = true;
            this.advancedSettings.visible = this.var_319;
            this.advancedModeBtn.label = "Standard mode";
        }
    }

    private function method_6409(): Array {
        return [this.method_3590()];
    }

    private function method_3590(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this.method_305(), this.method_2248()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_305(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this.method_1729(), this.method_731(), this.method_3942(), this.method_1129(), this.method_6158()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_1729(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "Resolution";
        _loc1_.setStyle("color", 16777215);
        _loc1_.id = "resolutionLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.resolutionLabel = _loc1_;
        BindingManager.executeBindings(this, "resolutionLabel", this.resolutionLabel);
        return _loc1_;
    }

    private function method_731(): DropDownList {
        var _loc1_: DropDownList = new DropDownList();
        _loc1_.id = "resolutionDropDown";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.resolutionDropDown = _loc1_;
        BindingManager.executeBindings(this, "resolutionDropDown", this.resolutionDropDown);
        return _loc1_;
    }

    private function method_3942(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "Graphic Quality: ";
        _loc1_.setStyle("color", 16777215);
        _loc1_.id = "graphicQualityLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.graphicQualityLabel = _loc1_;
        BindingManager.executeBindings(this, "graphicQualityLabel", this.graphicQualityLabel);
        return _loc1_;
    }

    private function method_1129(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.horizontalAlign = "center";
        _loc1_.mxmlContent = [this.method_4054()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_4054(): HSlider {
        var _loc1_: HSlider = new HSlider();
        _loc1_.dataTipPrecision = 0;
        _loc1_.minimum = 0;
        _loc1_.maximum = 4;
        _loc1_.percentWidth = 80;
        _loc1_.setStyle("liveDragging", true);
        _loc1_.id = "graphicQualitySlider";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.graphicQualitySlider = _loc1_;
        BindingManager.executeBindings(this, "graphicQualitySlider", this.graphicQualitySlider);
        return _loc1_;
    }

    private function method_6158(): Button {
        var _loc1_: Button = new Button();
        _loc1_.label = "Advanced Mode";
        _loc1_.addEventListener("click", this.method_689);
        _loc1_.id = "advancedModeBtn";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.advancedModeBtn = _loc1_;
        BindingManager.executeBindings(this, "advancedModeBtn", this.advancedModeBtn);
        return _loc1_;
    }

    public function method_689(param1: MouseEvent): void {
        this.method_2168(param1);
    }

    private function method_2248(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.visible = false;
        _loc1_.mxmlContent = [this.method_5134(), this.method_4665()];
        _loc1_.id = "advancedSettings";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.advancedSettings = _loc1_;
        BindingManager.executeBindings(this, "advancedSettings", this.advancedSettings);
        return _loc1_;
    }

    private function method_5134(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 100;
        _loc1_.text = "The standard mode simplifies the setting options and uses predefined parameters.";
        _loc1_.setStyle("color", 16777215);
        _loc1_.id = "advancedSettingsLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.advancedSettingsLabel = _loc1_;
        BindingManager.executeBindings(this, "advancedSettingsLabel", this.advancedSettingsLabel);
        return _loc1_;
    }

    private function method_4665(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this.method_899(), this.method_3127()];
        _loc1_.id = "dropDownQualitySettings";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.dropDownQualitySettings = _loc1_;
        BindingManager.executeBindings(this, "dropDownQualitySettings", this.dropDownQualitySettings);
        return _loc1_;
    }

    private function method_899(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.mxmlContent = [this.method_5642(), this.method_6208(), this.method_4145(), this.method_2566(), this.method_3036(), this.method_1813()];
        _loc1_.id = "dropDownsOne";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.dropDownsOne = _loc1_;
        BindingManager.executeBindings(this, "dropDownsOne", this.dropDownsOne);
        return _loc1_;
    }

    private function method_5642(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "Backgrounds";
        _loc1_.setStyle("color", 16777215);
        _loc1_.id = "backgrounds";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.backgrounds = _loc1_;
        BindingManager.executeBindings(this, "backgrounds", this.backgrounds);
        return _loc1_;
    }

    private function method_6208(): DropDownList {
        var _loc1_: DropDownList = new DropDownList();
        _loc1_.id = "backgroundsDropDown";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.backgroundsDropDown = _loc1_;
        BindingManager.executeBindings(this, "backgroundsDropDown", this.backgroundsDropDown);
        return _loc1_;
    }

    private function method_4145(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "Ships";
        _loc1_.setStyle("color", 16777215);
        _loc1_.id = "ships";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.ships = _loc1_;
        BindingManager.executeBindings(this, "ships", this.ships);
        return _loc1_;
    }

    private function method_2566(): DropDownList {
        var _loc1_: DropDownList = new DropDownList();
        _loc1_.id = "shipsDropDown";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.shipsDropDown = _loc1_;
        BindingManager.executeBindings(this, "shipsDropDown", this.shipsDropDown);
        return _loc1_;
    }

    private function method_3036(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "Explosions";
        _loc1_.setStyle("color", 16777215);
        _loc1_.id = "explosions";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.explosions = _loc1_;
        BindingManager.executeBindings(this, "explosions", this.explosions);
        return _loc1_;
    }

    private function method_1813(): DropDownList {
        var _loc1_: DropDownList = new DropDownList();
        _loc1_.id = "explosionsDropDown";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.explosionsDropDown = _loc1_;
        BindingManager.executeBindings(this, "explosionsDropDown", this.explosionsDropDown);
        return _loc1_;
    }

    private function method_3127(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.paddingLeft = 50;
        _loc1_.mxmlContent = [this.method_1808(), this.method_1652(), this.method_1163(), this.method_195(), this.method_427(), this.method_3488()];
        _loc1_.id = "dropDownsTwo";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.dropDownsTwo = _loc1_;
        BindingManager.executeBindings(this, "dropDownsTwo", this.dropDownsTwo);
        return _loc1_;
    }

    private function method_1808(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "Zones";
        _loc1_.setStyle("color", 16777215);
        _loc1_.id = "zones";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.zones = _loc1_;
        BindingManager.executeBindings(this, "zones", this.zones);
        return _loc1_;
    }

    private function method_1652(): DropDownList {
        var _loc1_: DropDownList = new DropDownList();
        _loc1_.id = "zonesDropDown";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.zonesDropDown = _loc1_;
        BindingManager.executeBindings(this, "zonesDropDown", this.zonesDropDown);
        return _loc1_;
    }

    private function method_1163(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "Something";
        _loc1_.setStyle("color", 16777215);
        _loc1_.id = "something";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.something = _loc1_;
        BindingManager.executeBindings(this, "something", this.something);
        return _loc1_;
    }

    private function method_195(): DropDownList {
        var _loc1_: DropDownList = new DropDownList();
        _loc1_.id = "somethingDropDown";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.somethingDropDown = _loc1_;
        BindingManager.executeBindings(this, "somethingDropDown", this.somethingDropDown);
        return _loc1_;
    }

    private function method_427(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "Resources and Boxes";
        _loc1_.setStyle("color", 16777215);
        _loc1_.id = "resourcesAndBoxes";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.resourcesAndBoxes = _loc1_;
        BindingManager.executeBindings(this, "resourcesAndBoxes", this.resourcesAndBoxes);
        return _loc1_;
    }

    private function method_3488(): DropDownList {
        var _loc1_: DropDownList = new DropDownList();
        _loc1_.id = "resourcesAndBoxesDropDown";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.resourcesAndBoxesDropDown = _loc1_;
        BindingManager.executeBindings(this, "resourcesAndBoxesDropDown", this.resourcesAndBoxesDropDown);
        return _loc1_;
    }

    private function method_278(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): IList {
            return resolutionList;
        }, null, "resolutionDropDown.dataProvider");
        var_5[1] = new Binding(this, function (): IList {
            return qualitySettingList;
        }, null, "backgroundsDropDown.dataProvider");
        var_5[2] = new Binding(this, function (): IList {
            return qualitySettingList;
        }, null, "shipsDropDown.dataProvider");
        var_5[3] = new Binding(this, function (): IList {
            return qualitySettingList;
        }, null, "explosionsDropDown.dataProvider");
        var_5[4] = new Binding(this, function (): IList {
            return qualitySettingList;
        }, null, "zonesDropDown.dataProvider");
        var_5[5] = new Binding(this, function (): IList {
            return qualitySettingList;
        }, null, "somethingDropDown.dataProvider");
        var_5[6] = new Binding(this, function (): IList {
            return qualitySettingList;
        }, null, "resourcesAndBoxesDropDown.dataProvider");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get advancedModeBtn(): Button {
        return this.var_2460;
    }

    public function set advancedModeBtn(param1: Button): void {
        var _loc2_: Object = this.var_2460;
        if (_loc2_ !== param1) {
            this.var_2460 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "advancedModeBtn", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get advancedSettings(): VGroup {
        return this.var_1396;
    }

    public function set advancedSettings(param1: VGroup): void {
        var _loc2_: Object = this.var_1396;
        if (_loc2_ !== param1) {
            this.var_1396 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "advancedSettings", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get advancedSettingsLabel(): Label {
        return this.var_1917;
    }

    public function set advancedSettingsLabel(param1: Label): void {
        var _loc2_: Object = this.var_1917;
        if (_loc2_ !== param1) {
            this.var_1917 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "advancedSettingsLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get backgrounds(): Label {
        return this.var_1276;
    }

    public function set backgrounds(param1: Label): void {
        var _loc2_: Object = this.var_1276;
        if (_loc2_ !== param1) {
            this.var_1276 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgrounds", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get backgroundsDropDown(): DropDownList {
        return this.var_1140;
    }

    public function set backgroundsDropDown(param1: DropDownList): void {
        var _loc2_: Object = this.var_1140;
        if (_loc2_ !== param1) {
            this.var_1140 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundsDropDown", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get dropDownQualitySettings(): HGroup {
        return this.var_1176;
    }

    public function set dropDownQualitySettings(param1: HGroup): void {
        var _loc2_: Object = this.var_1176;
        if (_loc2_ !== param1) {
            this.var_1176 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dropDownQualitySettings", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get dropDownsOne(): VGroup {
        return this.var_3977;
    }

    public function set dropDownsOne(param1: VGroup): void {
        var _loc2_: Object = this.var_3977;
        if (_loc2_ !== param1) {
            this.var_3977 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dropDownsOne", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get dropDownsTwo(): VGroup {
        return this.var_83;
    }

    public function set dropDownsTwo(param1: VGroup): void {
        var _loc2_: Object = this.var_83;
        if (_loc2_ !== param1) {
            this.var_83 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dropDownsTwo", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get explosions(): Label {
        return this.var_4788;
    }

    public function set explosions(param1: Label): void {
        var _loc2_: Object = this.var_4788;
        if (_loc2_ !== param1) {
            this.var_4788 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "explosions", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get explosionsDropDown(): DropDownList {
        return this.var_4799;
    }

    public function set explosionsDropDown(param1: DropDownList): void {
        var _loc2_: Object = this.var_4799;
        if (_loc2_ !== param1) {
            this.var_4799 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "explosionsDropDown", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get graphicQualityLabel(): Label {
        return this.var_3404;
    }

    public function set graphicQualityLabel(param1: Label): void {
        var _loc2_: Object = this.var_3404;
        if (_loc2_ !== param1) {
            this.var_3404 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "graphicQualityLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get graphicQualitySlider(): HSlider {
        return this.var_1590;
    }

    public function set graphicQualitySlider(param1: HSlider): void {
        var _loc2_: Object = this.var_1590;
        if (_loc2_ !== param1) {
            this.var_1590 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "graphicQualitySlider", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get resolutionDropDown(): DropDownList {
        return this.var_3628;
    }

    public function set resolutionDropDown(param1: DropDownList): void {
        var _loc2_: Object = this.var_3628;
        if (_loc2_ !== param1) {
            this.var_3628 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resolutionDropDown", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get resolutionLabel(): Label {
        return this.var_435;
    }

    public function set resolutionLabel(param1: Label): void {
        var _loc2_: Object = this.var_435;
        if (_loc2_ !== param1) {
            this.var_435 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resolutionLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get resourcesAndBoxes(): Label {
        return this.var_2178;
    }

    public function set resourcesAndBoxes(param1: Label): void {
        var _loc2_: Object = this.var_2178;
        if (_loc2_ !== param1) {
            this.var_2178 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resourcesAndBoxes", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get resourcesAndBoxesDropDown(): DropDownList {
        return this.var_2521;
    }

    public function set resourcesAndBoxesDropDown(param1: DropDownList): void {
        var _loc2_: Object = this.var_2521;
        if (_loc2_ !== param1) {
            this.var_2521 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resourcesAndBoxesDropDown", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get ships(): Label {
        return this.var_3776;
    }

    public function set ships(param1: Label): void {
        var _loc2_: Object = this.var_3776;
        if (_loc2_ !== param1) {
            this.var_3776 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ships", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get shipsDropDown(): DropDownList {
        return this.var_1506;
    }

    public function set shipsDropDown(param1: DropDownList): void {
        var _loc2_: Object = this.var_1506;
        if (_loc2_ !== param1) {
            this.var_1506 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shipsDropDown", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get something(): Label {
        return this.var_4962;
    }

    public function set something(param1: Label): void {
        var _loc2_: Object = this.var_4962;
        if (_loc2_ !== param1) {
            this.var_4962 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "something", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get somethingDropDown(): DropDownList {
        return this.var_1481;
    }

    public function set somethingDropDown(param1: DropDownList): void {
        var _loc2_: Object = this.var_1481;
        if (_loc2_ !== param1) {
            this.var_1481 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "somethingDropDown", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get zones(): Label {
        return this.var_2942;
    }

    public function set zones(param1: Label): void {
        var _loc2_: Object = this.var_2942;
        if (_loc2_ !== param1) {
            this.var_2942 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zones", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get zonesDropDown(): DropDownList {
        return this.var_578;
    }

    public function set zonesDropDown(param1: DropDownList): void {
        var _loc2_: Object = this.var_578;
        if (_loc2_ !== param1) {
            this.var_578 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zonesDropDown", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get resolutionList(): ArrayList {
        return this.var_2876;
    }

    private function set resolutionList(param1: ArrayList): void {
        var _loc2_: Object = this.var_2876;
        if (_loc2_ !== param1) {
            this.var_2876 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resolutionList", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get qualitySettingList(): ArrayList {
        return this.var_2984;
    }

    private function set qualitySettingList(param1: ArrayList): void {
        var _loc2_: Object = this.var_2984;
        if (_loc2_ !== param1) {
            this.var_2984 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "qualitySettingList", _loc2_, param1));
            }
        }
    }
}
}
