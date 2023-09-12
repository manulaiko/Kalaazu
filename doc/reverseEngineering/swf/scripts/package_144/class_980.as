package package_144 {

import mx.binding.BindingManager;
import mx.collections.ArrayList;
import mx.core.ClassFactory;
import mx.core.IFlexModuleFactory;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.mvc.sectorControlWindow.view.class_265;

import package_21.class_1500;
import package_21.class_1501;
import package_21.class_1502;
import package_21.class_978;

import spark.components.DataGrid;
import spark.components.gridClasses.GridColumn;

public class class_980 extends DataGrid {


    private var var_4434: GridColumn;

    private var var_4642: GridColumn;

    private var var_493: GridColumn;

    private var var_11: GridColumn;

    private var __moduleFactoryInitialized: Boolean = false;

    public function class_980() {
        super();
        this.columns = this.method_5382();
        this.addEventListener("preinitialize", this.method_3898);
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

    public function method_4111(): void {
        this.columnQueue.headerText = class_88.getItem("sectorcontrol_lobby_window_grid_headerlabel_queue");
        var _loc1_: Array = class_126.getInstance().method_2919;
        var _loc2_: String = _loc1_[class_81.factionID];
        var _loc3_: String = class_88.getItem("sectorcontrol_lobby_window_grid_headerlabel_faction");
        _loc3_ = _loc3_.replace(class_265.var_1723, _loc2_);
        var _loc4_: String = (_loc4_ = class_88.getItem("sectorcontrol_lobby_window_grid_headerlabel_tickets")).replace(class_265.var_1723, _loc2_);
    }

    private function method_5382(): ArrayList {
        var _loc1_: ArrayList = new ArrayList();
        _loc1_.source = [this.method_92(), this.method_5593(), this.method_855(), this.method_3472()];
        return _loc1_;
    }

    private function method_92(): GridColumn {
        var _loc1_: GridColumn = new GridColumn();
        _loc1_.headerText = "Opponent";
        _loc1_.itemRenderer = this.method_5529();
        this.columnOpponent = _loc1_;
        BindingManager.executeBindings(this, "columnOpponent", this.columnOpponent);
        return _loc1_;
    }

    private function method_5529(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_978;
        return _loc1_;
    }

    private function method_5593(): GridColumn {
        var _loc1_: GridColumn = new GridColumn();
        _loc1_.dataField = "columnPlayer";
        _loc1_.headerText = "Players";
        _loc1_.itemRenderer = this.method_163();
        this.columnPlayer = _loc1_;
        BindingManager.executeBindings(this, "columnPlayer", this.columnPlayer);
        return _loc1_;
    }

    private function method_163(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_1500;
        return _loc1_;
    }

    private function method_855(): GridColumn {
        var _loc1_: GridColumn = new GridColumn();
        _loc1_.headerText = "Points";
        _loc1_.itemRenderer = this.method_3752();
        this.columnPoints = _loc1_;
        BindingManager.executeBindings(this, "columnPoints", this.columnPoints);
        return _loc1_;
    }

    private function method_3752(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_1502;
        return _loc1_;
    }

    private function method_3472(): GridColumn {
        var _loc1_: GridColumn = new GridColumn();
        _loc1_.headerText = "Players in Queue";
        _loc1_.itemRenderer = this.method_1476();
        this.columnQueue = _loc1_;
        BindingManager.executeBindings(this, "columnQueue", this.columnQueue);
        return _loc1_;
    }

    private function method_1476(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_1501;
        return _loc1_;
    }

    public function method_3898(param1: FlexEvent): void {
        this.method_4111();
    }

    [Bindable(event="propertyChange")]
    public function get columnOpponent(): GridColumn {
        return this.var_4434;
    }

    public function set columnOpponent(param1: GridColumn): void {
        var _loc2_: Object = this.var_4434;
        if (_loc2_ !== param1) {
            this.var_4434 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "columnOpponent", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get columnPlayer(): GridColumn {
        return this.var_4642;
    }

    public function set columnPlayer(param1: GridColumn): void {
        var _loc2_: Object = this.var_4642;
        if (_loc2_ !== param1) {
            this.var_4642 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "columnPlayer", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get columnPoints(): GridColumn {
        return this.var_493;
    }

    public function set columnPoints(param1: GridColumn): void {
        var _loc2_: Object = this.var_493;
        if (_loc2_ !== param1) {
            this.var_493 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "columnPoints", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get columnQueue(): GridColumn {
        return this.var_11;
    }

    public function set columnQueue(param1: GridColumn): void {
        var _loc2_: Object = this.var_11;
        if (_loc2_ !== param1) {
            this.var_11 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "columnQueue", _loc2_, param1));
            }
        }
    }
}
}
