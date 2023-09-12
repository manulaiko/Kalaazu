package net.bigpoint.darkorbit.mvc.arena.view {

import mx.binding.BindingManager;
import mx.collections.ArrayList;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.events.PropertyChangeEvent;

import spark.components.Button;
import spark.components.HGroup;
import spark.components.Label;
import spark.components.SkinnableContainer;
import spark.components.TextArea;
import spark.components.VGroup;

public class JoinGroupView extends SkinnableContainer {


    private var _614230539battleGroupInfo: TextArea;

    private var _340620780joinBattleGroupTableColumns: ArrayList;

    private var __moduleFactoryInitialized: Boolean = false;

    public function JoinGroupView() {
        super();
        mx_internal::_document = this;
        this.verticalCenter = 0;
        this.horizontalCenter = 0;
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this._JoinGroupView_Array1_c);
        this._JoinGroupView_ArrayList1_i();
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

    public function setTableData(param1: ArrayList): void {
        this.joinBattleGroupTableColumns = param1;
    }

    private function _JoinGroupView_ArrayList1_i(): ArrayList {
        var _loc1_: ArrayList = new ArrayList();
        this.joinBattleGroupTableColumns = _loc1_;
        BindingManager.executeBindings(this, "joinBattleGroupTableColumns", this.joinBattleGroupTableColumns);
        return _loc1_;
    }

    private function _JoinGroupView_Array1_c(): Array {
        return [this._JoinGroupView_VGroup1_c()];
    }

    private function _JoinGroupView_VGroup1_c(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.horizontalCenter = 0;
        _loc1_.verticalCenter = 0;
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this._JoinGroupView_Label1_c(), this._JoinGroupView_HGroup1_c(), this._JoinGroupView_HGroup2_c()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function _JoinGroupView_Label1_c(): Label {
        var _loc1_: Label = new Label();
        _loc1_.bottom = 15;
        _loc1_.horizontalCenter = 0;
        _loc1_.percentWidth = 95;
        _loc1_.text = "3 vs 3 Open Battle Groups";
        _loc1_.setStyle("verticalAlign", "justify");
        _loc1_.setStyle("color", 3289650);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function _JoinGroupView_HGroup1_c(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.mxmlContent = [this._JoinGroupView_TextArea1_i()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function _JoinGroupView_TextArea1_i(): TextArea {
        var _loc1_: TextArea = new TextArea();
        _loc1_.width = 150;
        _loc1_.height = 60;
        _loc1_.text = "Some info on the group you just selected blaah blaaaaah blaaaaaaaaaaaah.";
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

    private function _JoinGroupView_HGroup2_c(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.horizontalAlign = "center";
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this._JoinGroupView_Button1_c(), this._JoinGroupView_Button2_c()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function _JoinGroupView_Button1_c(): Button {
        var _loc1_: Button = new Button();
        _loc1_.label = "Cancel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function _JoinGroupView_Button2_c(): Button {
        var _loc1_: Button = new Button();
        _loc1_.label = "Submit Application";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
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
    public function get joinBattleGroupTableColumns(): ArrayList {
        return this._340620780joinBattleGroupTableColumns;
    }

    public function set joinBattleGroupTableColumns(param1: ArrayList): void {
        var _loc2_: Object = this._340620780joinBattleGroupTableColumns;
        if (_loc2_ !== param1) {
            this._340620780joinBattleGroupTableColumns = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinBattleGroupTableColumns", _loc2_, param1));
            }
        }
    }
}
}
