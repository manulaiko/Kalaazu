package package_57 {

import flash.events.Event;
import flash.events.MouseEvent;
import flash.net.FileReference;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.collections.ArrayCollection;
import mx.collections.IList;
import mx.core.ClassFactory;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;

import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;

import package_22.class_198;

import package_27.class_1007;
import package_27.class_82;

import spark.components.Button;
import spark.components.HGroup;
import spark.components.Label;
import spark.components.List;
import spark.components.TextArea;
import spark.components.VGroup;

public class class_153 extends DOWindow implements IBindingClient {

    public static const LOAD_ALL_SOUNDS: String = "LOAD_ALL_SOUNDS";

    public static const TEST_ALL_SOUNDS: String = "TEST_ALL_SOUNDS";

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    public var _SoundConfigWindow_List1: List;

    public var _SoundConfigWindow_List2: List;

    private var var_4800: TextArea;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_3192: ArrayCollection;

    private var var_4288: ArrayCollection;

    private var var_4635: FileReference;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_153() {
        var bindings: Array;
        var watchers: Array;
        var var_1: uint;
        var target: Object = null;
        var watcherSetupUtilClass: Object = null;
        this.var_3192 = new ArrayCollection();
        this.var_4288 = new ArrayCollection();
        this.var_4635 = new FileReference();
        this.mx_internal::_bindings = [];
        this.mx_internal::_watchers = [];
        this.mx_internal::_bindingsByDestination = {};
        this.mx_internal::_bindingsBeginWithWord = {};
        super();
        mx_internal::_document = this;
        bindings = this.method_5210();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_soundTool_view_SoundConfigWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_153[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.width = 600;
        this.height = 800;
        this.title = "DEBUG SOUND CONFIG";
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_5114);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_153._watcherSetupUtil = param1;
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

    public function setData(param1: Array): void {
        this.patternList.source = param1;
    }

    private function save(): void {
        var _loc1_: XML = this.method_1761();
        this.var_4635.save(_loc1_);
    }

    private function method_1761(): XML {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc1_: XML = <sounds></sounds>;
        for each(_loc2_ in this.patternList.source) {
            if (_loc2_) {
                (_loc6_ = <sound></sound>).@id = _loc2_.getPatternID();
                _loc6_.@volume = _loc2_.method_1088();
                _loc6_.@soundbank = _loc2_.soundbank;
                _loc7_ = <reskeys></reskeys>;
                for each(_loc8_ in _loc2_.resKeyList) {
                    (_loc9_ = <reskey></reskey>).@resKey = _loc8_;
                    _loc7_.appendChild(_loc9_);
                }
                _loc6_.appendChild(_loc7_);
                _loc1_.appendChild(_loc6_);
            }
        }
        _loc3_ = <music></music>;
        for each(_loc4_ in this.musicPatternList.source) {
            if (_loc4_) {
                (_loc10_ = <track></track>).@id = _loc4_.getPatternID();
                _loc10_.@resKey = _loc4_.getResKey();
                _loc10_.@volume = _loc4_.method_1088();
                _loc3_.appendChild(_loc10_);
            }
        }
        (_loc5_ = <patterns></patterns>).appendChild(_loc3_);
        _loc5_.appendChild(_loc1_);
        return _loc5_;
    }

    private function load(): void {
        this.var_4635.addEventListener(Event.SELECT, this.method_6131);
        this.var_4635.browse();
    }

    private function method_6131(param1: Event): void {
        this.var_4635.removeEventListener(Event.SELECT, this.method_6131);
        this.var_4635.addEventListener(Event.COMPLETE, this.fileLoaded);
        this.var_4635.load();
    }

    private function fileLoaded(param1: Event): void {
        this.var_4635.removeEventListener(Event.COMPLETE, this.fileLoaded);
        var _loc2_: XML = new XML(this.var_4635.data.readUTFBytes(this.var_4635.data.length));
        var _loc3_: XML = <game></game>;
        _loc3_.appendChild(_loc2_);
        class_198.method_5383(_loc3_);
        class_198.method_4608(_loc3_);
        this.update();
    }

    public function method_6174(param1: Array): void {
        this.musicPatternList.source = param1;
    }

    private function reset(): void {
        class_198.method_5383(class_9.var_2751);
        class_198.method_4608(class_9.var_2751);
        this.update();
    }

    private function update(): void {
        var _loc1_: Array = class_198.var_3286;
        this.setData(_loc1_);
        var _loc2_: Array = class_198.var_4756;
        this.method_6174(_loc2_);
        class_82.method_5398();
        class_82.method_6148(0);
    }

    private function method_2470(): void {
        dispatchEvent(new Event(LOAD_ALL_SOUNDS));
    }

    private function method_1767(): void {
        dispatchEvent(new Event(TEST_ALL_SOUNDS));
    }

    private function method_5114(): Array {
        return [this.method_5271()];
    }

    private function method_5271(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.percentHeight = 100;
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this.method_3187(), this.method_4499()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3187(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.mxmlContent = [this.method_6278(), this.method_2234(), this.method_4913(), this.method_3838(), this.method_3003()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_6278(): Button {
        var _loc1_: Button = new Button();
        _loc1_.label = "SAVE";
        _loc1_.addEventListener("click", this.method_23);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    public function method_23(param1: MouseEvent): void {
        this.save();
    }

    private function method_2234(): Button {
        var _loc1_: Button = new Button();
        _loc1_.label = "LOAD";
        _loc1_.addEventListener("click", this.method_4600);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    public function method_4600(param1: MouseEvent): void {
        this.load();
    }

    private function method_4913(): Button {
        var _loc1_: Button = new Button();
        _loc1_.label = "RESET";
        _loc1_.addEventListener("click", this.method_1244);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    public function method_1244(param1: MouseEvent): void {
        this.reset();
    }

    private function method_3838(): Button {
        var _loc1_: Button = new Button();
        _loc1_.label = "LOAD ALL SOUNDS";
        _loc1_.addEventListener("click", this.method_6255);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    public function method_6255(param1: MouseEvent): void {
        this.method_2470();
    }

    private function method_3003(): Button {
        var _loc1_: Button = new Button();
        _loc1_.label = "CHECK ALL SOUNDS";
        _loc1_.addEventListener("click", this.method_2539);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    public function method_2539(param1: MouseEvent): void {
        this.method_1767();
    }

    private function method_4499(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentHeight = 100;
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this.method_2157(), this.method_4333(), this.method_4270(), this.method_1115(), this.method_139()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_2157(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "EFFECTS";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_4333(): List {
        var _loc1_: List = new List();
        _loc1_.percentHeight = 100;
        _loc1_.percentWidth = 100;
        _loc1_.itemRenderer = this.method_5879();
        _loc1_.id = "_SoundConfigWindow_List1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._SoundConfigWindow_List1 = _loc1_;
        BindingManager.executeBindings(this, "_SoundConfigWindow_List1", this._SoundConfigWindow_List1);
        return _loc1_;
    }

    private function method_5879(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_1005;
        return _loc1_;
    }

    private function method_4270(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "MUSIC";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_1115(): List {
        var _loc1_: List = new List();
        _loc1_.percentHeight = 15;
        _loc1_.percentWidth = 100;
        _loc1_.itemRenderer = this.method_2756();
        _loc1_.id = "_SoundConfigWindow_List2";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._SoundConfigWindow_List2 = _loc1_;
        BindingManager.executeBindings(this, "_SoundConfigWindow_List2", this._SoundConfigWindow_List2);
        return _loc1_;
    }

    private function method_2756(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_1006;
        return _loc1_;
    }

    private function method_139(): TextArea {
        var _loc1_: TextArea = new TextArea();
        _loc1_.percentWidth = 100;
        _loc1_.id = "output";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.output = _loc1_;
        BindingManager.executeBindings(this, "output", this.output);
        return _loc1_;
    }

    private function method_5210(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): IList {
            return patternList;
        }, null, "_SoundConfigWindow_List1.dataProvider");
        var_5[1] = new Binding(this, function (): IList {
            return musicPatternList;
        }, null, "_SoundConfigWindow_List2.dataProvider");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get output(): TextArea {
        return this.var_4800;
    }

    public function set output(param1: TextArea): void {
        var _loc2_: Object = this.var_4800;
        if (_loc2_ !== param1) {
            this.var_4800 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "output", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get patternList(): ArrayCollection {
        return this.var_3192;
    }

    private function set patternList(param1: ArrayCollection): void {
        var _loc2_: Object = this.var_3192;
        if (_loc2_ !== param1) {
            this.var_3192 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "patternList", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get musicPatternList(): ArrayCollection {
        return this.var_4288;
    }

    private function set musicPatternList(param1: ArrayCollection): void {
        var _loc2_: Object = this.var_4288;
        if (_loc2_ !== param1) {
            this.var_4288 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "musicPatternList", _loc2_, param1));
            }
        }
    }
}
}
