package package_55 {

import mx.collections.ArrayCollection;
import mx.collections.ArrayList;
import mx.events.PropertyChangeEvent;

import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
import net.bigpoint.darkorbit.mvc.companyhierarchy.model.vo.class_1001;

import spark.components.Label;
import spark.components.List;

public class class_150 extends DOWindow {


    private var var_2274: ArrayCollection;

    private var var_743: class_1000;

    private var var_3016: class_1000;

    private var var_1473: Label;

    private var var_3878: List;

    public function class_150() {
        this.var_2274 = new ArrayCollection([{
            "label": "MMO",
            "factionID": 1
        }, {
            "label": "EIC",
            "factionID": 2
        }, {
            "label": "VRU",
            "factionID": 3
        }]);
        super();
    }

    public function method_4857(param1: ArrayList): void {
        if (param1 == null || param1.length == 0) {
            this.leader.visible = false;
            this.rankedClanItemList.dataProvider = new ArrayList();
            this.bottomClan.visible = false;
            this.itsYourClan.visible = false;
            return;
        }
        var _loc2_: ArrayList = new ArrayList(param1.toArray());
        if ((_loc2_.getItemAt(_loc2_.length - 1) as class_1001).name_45 == class_81.name_32) {
            this.bottomClan.rankedClanVO = _loc2_.removeItemAt(_loc2_.length - 1) as class_1001;
            this.bottomClan.visible = true;
        } else {
            this.bottomClan.visible = false;
        }
        this.itsYourClan.visible = this.bottomClan.visible;
        if (_loc2_.length >= 1) {
            this.leader.rankedClanVO = _loc2_.removeItemAt(0) as class_1001;
            this.leader.visible = true;
        }
        this.rankedClanItemList.dataProvider = _loc2_;
    }

    public function method_2437(param1: int): void {
    }

    [Bindable(event="propertyChange")]
    public function get tabList(): ArrayCollection {
        return this.var_2274;
    }

    public function set tabList(param1: ArrayCollection): void {
        var _loc2_: Object = this.var_2274;
        if (_loc2_ !== param1) {
            this.var_2274 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabList", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get leader(): class_1000 {
        return this.var_743;
    }

    public function set leader(param1: class_1000): void {
        var _loc2_: Object = this.var_743;
        if (_loc2_ !== param1) {
            this.var_743 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leader", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bottomClan(): class_1000 {
        return this.var_3016;
    }

    public function set bottomClan(param1: class_1000): void {
        var _loc2_: Object = this.var_3016;
        if (_loc2_ !== param1) {
            this.var_3016 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bottomClan", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get itsYourClan(): Label {
        return this.var_1473;
    }

    public function set itsYourClan(param1: Label): void {
        var _loc2_: Object = this.var_1473;
        if (_loc2_ !== param1) {
            this.var_1473 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itsYourClan", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get rankedClanItemList(): List {
        return this.var_3878;
    }

    public function set rankedClanItemList(param1: List): void {
        var _loc2_: Object = this.var_3878;
        if (_loc2_ !== param1) {
            this.var_3878 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankedClanItemList", _loc2_, param1));
            }
        }
    }
}
}
