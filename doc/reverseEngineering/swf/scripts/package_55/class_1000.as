package package_55 {

import flash.display.Bitmap;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;
import mx.events.ToolTipEvent;
import mx.managers.ToolTipManager;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.mvc.companyhierarchy.model.vo.IRankedClanViewData;

import package_11.class_39;

import package_9.ResourceManager;

import spark.components.BorderContainer;
import spark.components.HGroup;
import spark.components.Label;
import spark.components.SkinnableContainer;
import spark.components.VGroup;
import spark.primitives.BitmapImage;

public class class_1000 extends SkinnableContainer implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var var_3142: BorderContainer;

    private var var_3993: Label;

    private var var_2126: Label;

    private var var_4935: Label;

    private var var_62: Label;

    private var var_4566: Label;

    private var var_1577: Label;

    private var var_3502: Label;

    private var var_4130: Label;

    private var var_521: Label;

    private var var_940: HGroup;

    private var var_4085: BorderContainer;

    private var var_4853: BitmapImage;

    private var var_4988: BorderContainer;

    private var var_617: Label;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_2528: IRankedClanViewData;

    private var var_1016: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_1000() {
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
        bindings = this.method_1294();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_companyhierarchy_view_components_RankedClanItemWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_1000[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_240);
        this.addEventListener("creationComplete", this.method_1947);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_1000._watcherSetupUtil = param1;
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

    public function set rankedClanVO(param1: IRankedClanViewData): void {
        this.var_2528 = param1;
        this.method_3691();
    }

    private function onComplete(): void {
        var _loc1_: * = null;
        if (ResourceManager.name_15.getFinisher("clanHierarchyWin") != null && Boolean((ResourceManager.name_15.getFinisher("clanHierarchyWin") as class_39).method_2545("rankedItemBg"))) {
            _loc1_ = ResourceManager.getBitmap("clanHierarchyWin", "rankedItemBg");
            this.backgroundImageHolder.setStyle("backgroundImage", _loc1_);
        }
        this.var_1016 = true;
        this.posDesc.text = class_88.getItem("company_hierarchy_desc_position");
        this.clanDesc.text = class_88.getItem("company_hierarchy_desc_clan");
        this.leaderDesc.text = class_88.getItem("company_hierarchy_desc_leader");
        this.ptsDesc.text = class_88.getItem("company_hierarchy_desc_points");
        this.method_3691();
    }

    private function method_3117(param1: Event): void {
        var _loc2_: URLLoader = URLLoader(param1.target);
        var _loc3_: Loader = new Loader();
        _loc3_.contentLoaderInfo.addEventListener(Event.COMPLETE, this.method_4184);
        _loc3_.loadBytes(_loc2_.data as ByteArray);
    }

    private function method_4184(param1: Event): void {
        var _loc2_: Bitmap = LoaderInfo(param1.currentTarget).content as Bitmap;
        var _loc3_: Number = (Number(this.rankedClanImageContainer.width) - 2) / _loc2_.width;
        var _loc4_: Number = (Number(this.rankedClanImageContainer.height) - 2) / _loc2_.height;
        this.rankedClanImage.source = _loc2_;
        this.rankedClanImage.scaleX = _loc3_;
        this.rankedClanImage.scaleY = _loc4_;
    }

    private function method_4735(param1: Event): void {
    }

    private function method_3691(): void {
        var var_1885: Bitmap = null;
        var var_3: URLRequest = null;
        var var_338: URLLoader = null;
        var var_4624: UIComponent = null;
        if (this.var_1016 == true && this.var_2528 != null) {
            if (this.var_2528.method_2285 == null || this.rankedClanImage.source == null) {
                try {
                    var_1885 = ResourceManager.getBitmap("clanHierarchyWin", "clanBg");
                    this.rankedClanImage.source = var_1885;
                } catch (err: Error) {
                }
            }
            if (this.var_2528.method_2285 != null) {
                var_3 = new URLRequest(this.var_2528.method_2285);
                var_338 = new URLLoader();
                var_338.dataFormat = URLLoaderDataFormat.BINARY;
                var_338.addEventListener(Event.COMPLETE, this.method_3117);
                var_338.addEventListener(IOErrorEvent.IO_ERROR, this.method_4735);
                var_338.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.method_4735);
                var_338.load(var_3);
            }
            this.rank.text = "" + this.var_2528.rank;
            this.rank.toolTip = this.rank.text;
            if (this.var_2528.rank == 1 && this.backgroundImageHolder.numElements <= 2) {
                var_4624 = new UIComponent();
                var_4624.addChild(ResourceManager.getMovieClip("clanHierarchyWin", "leadingClanFrameHighlight"));
                this.backgroundImageHolder.addElementAt(var_4624, 1);
            }
            this.position.text = this.var_2528.position;
            this.position.toolTip = this.position.text;
            this.clanName.text = this.var_2528.name_123;
            this.clanName.toolTip = this.clanName.text;
            this.rankedClanImageContainer.toolTip = this.var_2528.name_123;
            this.leaderName.text = this.var_2528.leader;
            this.leaderName.toolTip = this.leaderName.text;
            this.companyPoints.text = "" + this.var_2528.points;
            this.companyPoints.toolTip = this.companyPoints.text;
            if (this.var_2528.rank > 9) {
                this.rank.width = 40 + (this.rank.text.length - 1) * 15;
                this.rankedClan.paddingLeft = -0.5 * Number(this.rank.width);
            }
            this.backgroundImageHolder.toolTip = this.var_2528.name_49;
        }
    }

    private function method_1216(param1: ToolTipEvent): void {
        ToolTipManager.showDelay = 500;
    }

    private function method_2990(param1: ToolTipEvent): void {
        ToolTipManager.showDelay = 100;
    }

    private function method_240(): Array {
        return [this.method_5526()];
    }

    private function method_5526(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.verticalAlign = "middle";
        _loc1_.top = 5;
        _loc1_.bottom = 5;
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.mxmlContent = [this.method_3560(), this.method_537()];
        _loc1_.id = "rankedClan";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.rankedClan = _loc1_;
        BindingManager.executeBindings(this, "rankedClan", this.rankedClan);
        return _loc1_;
    }

    private function method_3560(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "1";
        _loc1_.width = 40;
        _loc1_.setStyle("fontSize", 24);
        _loc1_.setStyle("lineBreak", "explicit");
        _loc1_.setStyle("textAlign", "right");
        _loc1_.setStyle("paddingRight", 5);
        _loc1_.id = "rank";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.rank = _loc1_;
        BindingManager.executeBindings(this, "rank", this.rank);
        return _loc1_;
    }

    private function method_537(): BorderContainer {
        var _loc1_: BorderContainer = new BorderContainer();
        _loc1_.width = 225;
        _loc1_.height = 60;
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_3774);
        _loc1_.setStyle("borderAlpha", 0);
        _loc1_.addEventListener("toolTipCreate", this.method_4547);
        _loc1_.addEventListener("toolTipStart", this.method_3377);
        _loc1_.id = "backgroundImageHolder";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.backgroundImageHolder = _loc1_;
        BindingManager.executeBindings(this, "backgroundImageHolder", this.backgroundImageHolder);
        return _loc1_;
    }

    private function method_3774(): Array {
        return [this.method_1816(), this.method_1183()];
    }

    private function method_1816(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.percentHeight = 100;
        _loc1_.left = 0;
        _loc1_.paddingLeft = 3;
        _loc1_.paddingTop = 3;
        _loc1_.mxmlContent = [this.method_2681()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_2681(): BorderContainer {
        var _loc1_: BorderContainer = new BorderContainer();
        _loc1_.width = 52;
        _loc1_.height = 52;
        _loc1_.minHeight = 10;
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_6340);
        _loc1_.setStyle("backgroundAlpha", 0);
        _loc1_.setStyle("borderAlpha", 0);
        _loc1_.setStyle("borderColor", 16777215);
        _loc1_.id = "rankedClanImageContainer";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.rankedClanImageContainer = _loc1_;
        BindingManager.executeBindings(this, "rankedClanImageContainer", this.rankedClanImageContainer);
        return _loc1_;
    }

    private function method_6340(): Array {
        return [this.method_1048(), this.method_1202()];
    }

    private function method_1048(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.x = 0;
        _loc1_.y = 0;
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.horizontalAlign = "center";
        _loc1_.verticalAlign = "middle";
        _loc1_.mxmlContent = [this.method_6263()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_6263(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.initialized(this, "rankedClanImage");
        this.rankedClanImage = _loc1_;
        BindingManager.executeBindings(this, "rankedClanImage", this.rankedClanImage);
        return _loc1_;
    }

    private function method_1202(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.x = 0;
        _loc1_.y = 0;
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.horizontalAlign = "center";
        _loc1_.verticalAlign = "middle";
        _loc1_.mxmlContent = [this.method_4554()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_4554(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "";
        _loc1_.setStyle("color", 16777215);
        _loc1_.id = "rankedClanLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.rankedClanLabel = _loc1_;
        BindingManager.executeBindings(this, "rankedClanLabel", this.rankedClanLabel);
        return _loc1_;
    }

    private function method_1183(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this.method_73()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_73(): BorderContainer {
        var _loc1_: BorderContainer = new BorderContainer();
        _loc1_.percentWidth = 100;
        _loc1_.minWidth = 10;
        _loc1_.minHeight = 10;
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_1859);
        _loc1_.setStyle("backgroundAlpha", 0);
        _loc1_.setStyle("borderAlpha", 0);
        _loc1_.setStyle("borderColor", 16777215);
        _loc1_.id = "rankedClanDesc";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.rankedClanDesc = _loc1_;
        BindingManager.executeBindings(this, "rankedClanDesc", this.rankedClanDesc);
        return _loc1_;
    }

    private function method_1859(): Array {
        return [this.method_732()];
    }

    private function method_732(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.bottom = 8;
        _loc1_.left = 8;
        _loc1_.top = 8;
        _loc1_.right = 8;
        _loc1_.paddingLeft = 60;
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this.method_5787(), this.method_4579()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_5787(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.mxmlContent = [this.method_5918(), this.method_3672(), this.method_5667(), this.method_2301()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_5918(): Label {
        var _loc1_: Label = new Label();
        _loc1_.setStyle("paddingTop", -5);
        _loc1_.setStyle("textAlign", "left");
        _loc1_.id = "posDesc";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.posDesc = _loc1_;
        BindingManager.executeBindings(this, "posDesc", this.posDesc);
        return _loc1_;
    }

    private function method_3672(): Label {
        var _loc1_: Label = new Label();
        _loc1_.setStyle("paddingTop", -4);
        _loc1_.setStyle("textAlign", "left");
        _loc1_.id = "clanDesc";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.clanDesc = _loc1_;
        BindingManager.executeBindings(this, "clanDesc", this.clanDesc);
        return _loc1_;
    }

    private function method_5667(): Label {
        var _loc1_: Label = new Label();
        _loc1_.setStyle("paddingTop", -4);
        _loc1_.setStyle("textAlign", "left");
        _loc1_.id = "leaderDesc";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.leaderDesc = _loc1_;
        BindingManager.executeBindings(this, "leaderDesc", this.leaderDesc);
        return _loc1_;
    }

    private function method_2301(): Label {
        var _loc1_: Label = new Label();
        _loc1_.setStyle("paddingTop", -4);
        _loc1_.setStyle("textAlign", "left");
        _loc1_.id = "ptsDesc";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.ptsDesc = _loc1_;
        BindingManager.executeBindings(this, "ptsDesc", this.ptsDesc);
        return _loc1_;
    }

    private function method_4579(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this.method_1848(), this.method_886(), this.method_3889(), this.method_2297()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_1848(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 100;
        _loc1_.text = "title";
        _loc1_.maxDisplayedLines = 1;
        _loc1_.setStyle("paddingTop", -5);
        _loc1_.setStyle("textAlign", "right");
        _loc1_.setStyle("lineBreak", "toFit");
        _loc1_.id = "position";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.position = _loc1_;
        BindingManager.executeBindings(this, "position", this.position);
        return _loc1_;
    }

    private function method_886(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 100;
        _loc1_.text = "clanName";
        _loc1_.maxDisplayedLines = 1;
        _loc1_.setStyle("paddingTop", -4);
        _loc1_.setStyle("textAlign", "right");
        _loc1_.setStyle("lineBreak", "toFit");
        _loc1_.id = "clanName";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.clanName = _loc1_;
        BindingManager.executeBindings(this, "clanName", this.clanName);
        return _loc1_;
    }

    private function method_3889(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 100;
        _loc1_.text = "leaderName";
        _loc1_.maxDisplayedLines = 1;
        _loc1_.setStyle("paddingTop", -4);
        _loc1_.setStyle("textAlign", "right");
        _loc1_.setStyle("lineBreak", "toFit");
        _loc1_.id = "leaderName";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.leaderName = _loc1_;
        BindingManager.executeBindings(this, "leaderName", this.leaderName);
        return _loc1_;
    }

    private function method_2297(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 100;
        _loc1_.text = "companyPoints";
        _loc1_.maxDisplayedLines = 1;
        _loc1_.setStyle("paddingTop", -4);
        _loc1_.setStyle("textAlign", "right");
        _loc1_.setStyle("lineBreak", "toFit");
        _loc1_.id = "companyPoints";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.companyPoints = _loc1_;
        BindingManager.executeBindings(this, "companyPoints", this.companyPoints);
        return _loc1_;
    }

    public function method_4547(param1: ToolTipEvent): void {
        this.method_1216(param1);
    }

    public function method_3377(param1: ToolTipEvent): void {
        this.method_2990(param1);
    }

    public function method_1947(param1: FlexEvent): void {
        this.onComplete();
    }

    private function method_1294(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): String {
            var _loc1_: * = class_18.const_183;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            rank.setStyle("fontFamily", param1);
        }, "rank.fontFamily");
        var_5[1] = new Binding(this, function (): uint {
            return class_18.const_2794;
        }, function (param1: uint): void {
            rank.setStyle("color", param1);
        }, "rank.color");
        var_5[2] = new Binding(this, function (): uint {
            return class_18.const_417;
        }, function (param1: uint): void {
            posDesc.setStyle("color", param1);
        }, "posDesc.color");
        var_5[3] = new Binding(this, function (): Number {
            return class_18.const_571;
        }, function (param1: Number): void {
            posDesc.setStyle("fontSize", param1);
        }, "posDesc.fontSize");
        var_5[4] = new Binding(this, function (): String {
            var _loc1_: * = class_18.const_3086;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            posDesc.setStyle("fontFamily", param1);
        }, "posDesc.fontFamily");
        var_5[5] = new Binding(this, function (): uint {
            return class_18.const_417;
        }, function (param1: uint): void {
            clanDesc.setStyle("color", param1);
        }, "clanDesc.color");
        var_5[6] = new Binding(this, function (): Number {
            return class_18.const_571;
        }, function (param1: Number): void {
            clanDesc.setStyle("fontSize", param1);
        }, "clanDesc.fontSize");
        var_5[7] = new Binding(this, function (): String {
            var _loc1_: * = class_18.const_3086;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            clanDesc.setStyle("fontFamily", param1);
        }, "clanDesc.fontFamily");
        var_5[8] = new Binding(this, function (): uint {
            return class_18.const_417;
        }, function (param1: uint): void {
            leaderDesc.setStyle("color", param1);
        }, "leaderDesc.color");
        var_5[9] = new Binding(this, function (): Number {
            return class_18.const_571;
        }, function (param1: Number): void {
            leaderDesc.setStyle("fontSize", param1);
        }, "leaderDesc.fontSize");
        var_5[10] = new Binding(this, function (): String {
            var _loc1_: * = class_18.const_3086;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            leaderDesc.setStyle("fontFamily", param1);
        }, "leaderDesc.fontFamily");
        var_5[11] = new Binding(this, function (): uint {
            return class_18.const_417;
        }, function (param1: uint): void {
            ptsDesc.setStyle("color", param1);
        }, "ptsDesc.color");
        var_5[12] = new Binding(this, function (): Number {
            return class_18.const_571;
        }, function (param1: Number): void {
            ptsDesc.setStyle("fontSize", param1);
        }, "ptsDesc.fontSize");
        var_5[13] = new Binding(this, function (): String {
            var _loc1_: * = class_18.const_3086;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            ptsDesc.setStyle("fontFamily", param1);
        }, "ptsDesc.fontFamily");
        var_5[14] = new Binding(this, function (): uint {
            return class_18.const_2794;
        }, function (param1: uint): void {
            position.setStyle("color", param1);
        }, "position.color");
        var_5[15] = new Binding(this, function (): Number {
            return class_18.const_571;
        }, function (param1: Number): void {
            position.setStyle("fontSize", param1);
        }, "position.fontSize");
        var_5[16] = new Binding(this, function (): String {
            var _loc1_: * = class_18.const_3086;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            position.setStyle("fontFamily", param1);
        }, "position.fontFamily");
        var_5[17] = new Binding(this, function (): uint {
            return class_18.const_2794;
        }, function (param1: uint): void {
            clanName.setStyle("color", param1);
        }, "clanName.color");
        var_5[18] = new Binding(this, function (): Number {
            return class_18.const_571;
        }, function (param1: Number): void {
            clanName.setStyle("fontSize", param1);
        }, "clanName.fontSize");
        var_5[19] = new Binding(this, function (): String {
            var _loc1_: * = class_18.const_3086;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            clanName.setStyle("fontFamily", param1);
        }, "clanName.fontFamily");
        var_5[20] = new Binding(this, function (): uint {
            return class_18.const_417;
        }, function (param1: uint): void {
            leaderName.setStyle("color", param1);
        }, "leaderName.color");
        var_5[21] = new Binding(this, function (): Number {
            return class_18.const_571;
        }, function (param1: Number): void {
            leaderName.setStyle("fontSize", param1);
        }, "leaderName.fontSize");
        var_5[22] = new Binding(this, function (): String {
            var _loc1_: * = class_18.const_3086;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            leaderName.setStyle("fontFamily", param1);
        }, "leaderName.fontFamily");
        var_5[23] = new Binding(this, function (): uint {
            return class_18.const_2794;
        }, function (param1: uint): void {
            companyPoints.setStyle("color", param1);
        }, "companyPoints.color");
        var_5[24] = new Binding(this, function (): Number {
            return class_18.const_571;
        }, function (param1: Number): void {
            companyPoints.setStyle("fontSize", param1);
        }, "companyPoints.fontSize");
        var_5[25] = new Binding(this, function (): String {
            var _loc1_: * = class_18.const_3086;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            companyPoints.setStyle("fontFamily", param1);
        }, "companyPoints.fontFamily");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get backgroundImageHolder(): BorderContainer {
        return this.var_3142;
    }

    public function set backgroundImageHolder(param1: BorderContainer): void {
        var _loc2_: Object = this.var_3142;
        if (_loc2_ !== param1) {
            this.var_3142 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundImageHolder", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get clanDesc(): Label {
        return this.var_3993;
    }

    public function set clanDesc(param1: Label): void {
        var _loc2_: Object = this.var_3993;
        if (_loc2_ !== param1) {
            this.var_3993 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clanDesc", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get clanName(): Label {
        return this.var_2126;
    }

    public function set clanName(param1: Label): void {
        var _loc2_: Object = this.var_2126;
        if (_loc2_ !== param1) {
            this.var_2126 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clanName", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get companyPoints(): Label {
        return this.var_4935;
    }

    public function set companyPoints(param1: Label): void {
        var _loc2_: Object = this.var_4935;
        if (_loc2_ !== param1) {
            this.var_4935 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "companyPoints", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get leaderDesc(): Label {
        return this.var_62;
    }

    public function set leaderDesc(param1: Label): void {
        var _loc2_: Object = this.var_62;
        if (_loc2_ !== param1) {
            this.var_62 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leaderDesc", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get leaderName(): Label {
        return this.var_4566;
    }

    public function set leaderName(param1: Label): void {
        var _loc2_: Object = this.var_4566;
        if (_loc2_ !== param1) {
            this.var_4566 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leaderName", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get posDesc(): Label {
        return this.var_1577;
    }

    public function set posDesc(param1: Label): void {
        var _loc2_: Object = this.var_1577;
        if (_loc2_ !== param1) {
            this.var_1577 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "posDesc", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get position(): Label {
        return this.var_3502;
    }

    public function set position(param1: Label): void {
        var _loc2_: Object = this.var_3502;
        if (_loc2_ !== param1) {
            this.var_3502 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "position", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get ptsDesc(): Label {
        return this.var_4130;
    }

    public function set ptsDesc(param1: Label): void {
        var _loc2_: Object = this.var_4130;
        if (_loc2_ !== param1) {
            this.var_4130 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ptsDesc", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get rank(): Label {
        return this.var_521;
    }

    public function set rank(param1: Label): void {
        var _loc2_: Object = this.var_521;
        if (_loc2_ !== param1) {
            this.var_521 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get rankedClan(): HGroup {
        return this.var_940;
    }

    public function set rankedClan(param1: HGroup): void {
        var _loc2_: Object = this.var_940;
        if (_loc2_ !== param1) {
            this.var_940 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankedClan", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get rankedClanDesc(): BorderContainer {
        return this.var_4085;
    }

    public function set rankedClanDesc(param1: BorderContainer): void {
        var _loc2_: Object = this.var_4085;
        if (_loc2_ !== param1) {
            this.var_4085 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankedClanDesc", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get rankedClanImage(): BitmapImage {
        return this.var_4853;
    }

    public function set rankedClanImage(param1: BitmapImage): void {
        var _loc2_: Object = this.var_4853;
        if (_loc2_ !== param1) {
            this.var_4853 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankedClanImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get rankedClanImageContainer(): BorderContainer {
        return this.var_4988;
    }

    public function set rankedClanImageContainer(param1: BorderContainer): void {
        var _loc2_: Object = this.var_4988;
        if (_loc2_ !== param1) {
            this.var_4988 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankedClanImageContainer", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get rankedClanLabel(): Label {
        return this.var_617;
    }

    public function set rankedClanLabel(param1: Label): void {
        var _loc2_: Object = this.var_617;
        if (_loc2_ !== param1) {
            this.var_617 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankedClanLabel", _loc2_, param1));
            }
        }
    }
}
}
