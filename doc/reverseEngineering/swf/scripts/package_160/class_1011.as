package package_160 {

import mx.binding.BindingManager;
import mx.collections.ArrayList;
import mx.core.ClassFactory;
import mx.core.IFlexModuleFactory;
import mx.events.PropertyChangeEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.mvc.sectorControlWindow.view.class_265;

import package_247.class_1522;
import package_247.class_1523;
import package_247.class_1524;
import package_247.class_1525;

import spark.components.DataGrid;
import spark.components.gridClasses.GridColumn;

public class class_1011 extends DataGrid implements class_1010 {


    private var var_2021: GridColumn;

    private var var_3830: GridColumn;

    private var var_11: GridColumn;

    private var var_4783: GridColumn;

    private var __moduleFactoryInitialized: Boolean = false;

    public function class_1011() {
        super();
        this.columns = this.method_4568();
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

    public function init(): void {
        this.columnMatch.headerText = class_88.getItem("sectorcontrol_lobby_window_grid_headerlabel_match");
        this.columnQueue.headerText = class_88.getItem("sectorcontrol_lobby_window_grid_headerlabel_queue");
        var _loc1_: Array = class_126.getInstance().method_2919;
        var _loc2_: String = _loc1_[class_81.factionID];
        var _loc3_: String = class_88.getItem("sectorcontrol_lobby_window_grid_headerlabel_faction");
        _loc3_ = _loc3_.replace(class_265.var_1723, _loc2_);
        this.columnFaction.headerText = _loc3_;
        var _loc4_: String = (_loc4_ = class_88.getItem("sectorcontrol_lobby_window_grid_headerlabel_tickets")).replace(class_265.var_1723, _loc2_);
        this.columnTickets.headerText = _loc4_;
    }

    private function method_4568(): ArrayList {
        var _loc1_: ArrayList = new ArrayList();
        _loc1_.source = [this.method_3231(), this.method_1338(), this.method_5334(), this.method_4308()];
        return _loc1_;
    }

    private function method_3231(): GridColumn {
        var _loc1_: GridColumn = new GridColumn();
        _loc1_.headerText = "Match";
        _loc1_.itemRenderer = this.method_272();
        this.columnMatch = _loc1_;
        BindingManager.executeBindings(this, "columnMatch", this.columnMatch);
        return _loc1_;
    }

    private function method_272(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_1525;
        return _loc1_;
    }

    private function method_1338(): GridColumn {
        var _loc1_: GridColumn = new GridColumn();
        _loc1_.dataField = "columnFaction";
        _loc1_.headerText = "Players";
        _loc1_.itemRenderer = this.method_4663();
        this.columnFaction = _loc1_;
        BindingManager.executeBindings(this, "columnFaction", this.columnFaction);
        return _loc1_;
    }

    private function method_4663(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_1522;
        return _loc1_;
    }

    private function method_5334(): GridColumn {
        var _loc1_: GridColumn = new GridColumn();
        _loc1_.dataField = "totalTickets";
        _loc1_.headerText = "Tickets left";
        _loc1_.itemRenderer = this.method_2238();
        this.columnTickets = _loc1_;
        BindingManager.executeBindings(this, "columnTickets", this.columnTickets);
        return _loc1_;
    }

    private function method_2238(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_1524;
        return _loc1_;
    }

    private function method_4308(): GridColumn {
        var _loc1_: GridColumn = new GridColumn();
        _loc1_.dataField = "columnQueue";
        _loc1_.headerText = "Players in Queue";
        _loc1_.itemRenderer = this.method_4818();
        this.columnQueue = _loc1_;
        BindingManager.executeBindings(this, "columnQueue", this.columnQueue);
        return _loc1_;
    }

    private function method_4818(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_1523;
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get columnFaction(): GridColumn {
        return this.var_2021;
    }

    public function set columnFaction(param1: GridColumn): void {
        var _loc2_: Object = this.var_2021;
        if (_loc2_ !== param1) {
            this.var_2021 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "columnFaction", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get columnMatch(): GridColumn {
        return this.var_3830;
    }

    public function set columnMatch(param1: GridColumn): void {
        var _loc2_: Object = this.var_3830;
        if (_loc2_ !== param1) {
            this.var_3830 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "columnMatch", _loc2_, param1));
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

    [Bindable(event="propertyChange")]
    public function get columnTickets(): GridColumn {
        return this.var_4783;
    }

    public function set columnTickets(param1: GridColumn): void {
        var _loc2_: Object = this.var_4783;
        if (_loc2_ !== param1) {
            this.var_4783 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "columnTickets", _loc2_, param1));
            }
        }
    }
}
}
