package net.bigpoint.darkorbit.mvc.arena.view {

import mx.binding.BindingManager;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.events.PropertyChangeEvent;

import spark.components.HGroup;
import spark.components.Label;
import spark.components.SkinnableContainer;
import spark.components.TextArea;
import spark.components.VGroup;

public class CreateBattleGroupView extends SkinnableContainer {


    private var _349888520CreateGroupView: HGroup;

    private var _614230539battleGroupInfo: TextArea;

    private var _1291890920battleGroupNameInput: TextArea;

    private var __moduleFactoryInitialized: Boolean = false;

    public function CreateBattleGroupView() {
        super();
        mx_internal::_document = this;
        this.verticalCenter = 0;
        this.horizontalCenter = 0;
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this._CreateBattleGroupView_Array1_c);
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

    private function _CreateBattleGroupView_Array1_c(): Array {
        return [this._CreateBattleGroupView_HGroup1_i()];
    }

    private function _CreateBattleGroupView_HGroup1_i(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.mxmlContent = [this._CreateBattleGroupView_VGroup1_c(), this._CreateBattleGroupView_VGroup2_c()];
        _loc1_.id = "CreateGroupView";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.CreateGroupView = _loc1_;
        BindingManager.executeBindings(this, "CreateGroupView", this.CreateGroupView);
        return _loc1_;
    }

    private function _CreateBattleGroupView_VGroup1_c(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.mxmlContent = [this._CreateBattleGroupView_Label1_c(), this._CreateBattleGroupView_TextArea1_i()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function _CreateBattleGroupView_Label1_c(): Label {
        var _loc1_: Label = new Label();
        _loc1_.bottom = 15;
        _loc1_.horizontalCenter = 0;
        _loc1_.percentWidth = 95;
        _loc1_.text = "Battle Group Name";
        _loc1_.setStyle("verticalAlign", "justify");
        _loc1_.setStyle("color", 3289650);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function _CreateBattleGroupView_TextArea1_i(): TextArea {
        var _loc1_: TextArea = new TextArea();
        _loc1_.width = 150;
        _loc1_.height = 60;
        _loc1_.setStyle("color", 11405834);
        _loc1_.setStyle("fontWeight", "bold");
        _loc1_.id = "battleGroupNameInput";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.battleGroupNameInput = _loc1_;
        BindingManager.executeBindings(this, "battleGroupNameInput", this.battleGroupNameInput);
        return _loc1_;
    }

    private function _CreateBattleGroupView_VGroup2_c(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.mxmlContent = [this._CreateBattleGroupView_Label2_c(), this._CreateBattleGroupView_TextArea2_i()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function _CreateBattleGroupView_Label2_c(): Label {
        var _loc1_: Label = new Label();
        _loc1_.bottom = 15;
        _loc1_.horizontalCenter = 0;
        _loc1_.percentWidth = 95;
        _loc1_.text = "Group Info";
        _loc1_.setStyle("verticalAlign", "justify");
        _loc1_.setStyle("color", 3289650);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function _CreateBattleGroupView_TextArea2_i(): TextArea {
        var _loc1_: TextArea = new TextArea();
        _loc1_.width = 150;
        _loc1_.height = 60;
        _loc1_.setStyle("color", 11405834);
        _loc1_.setStyle("fontWeight", "bold");
        _loc1_.id = "battleGroupInfo";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.battleGroupInfo = _loc1_;
        BindingManager.executeBindings(this, "battleGroupInfo", this.battleGroupInfo);
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get CreateGroupView(): HGroup {
        return this._349888520CreateGroupView;
    }

    public function set CreateGroupView(param1: HGroup): void {
        var _loc2_: Object = this._349888520CreateGroupView;
        if (_loc2_ !== param1) {
            this._349888520CreateGroupView = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "CreateGroupView", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get battleGroupInfo(): TextArea {
        return this._614230539battleGroupInfo;
    }

    public function set battleGroupInfo(param1: TextArea): void {
        var _loc2_: Object = this._614230539battleGroupInfo;
        if (_loc2_ !== param1) {
            this._614230539battleGroupInfo = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battleGroupInfo", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get battleGroupNameInput(): TextArea {
        return this._1291890920battleGroupNameInput;
    }

    public function set battleGroupNameInput(param1: TextArea): void {
        var _loc2_: Object = this._1291890920battleGroupNameInput;
        if (_loc2_ !== param1) {
            this._1291890920battleGroupNameInput = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battleGroupNameInput", _loc2_, param1));
            }
        }
    }
}
}
