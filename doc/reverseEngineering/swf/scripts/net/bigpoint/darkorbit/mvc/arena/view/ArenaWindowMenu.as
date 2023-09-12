package net.bigpoint.darkorbit.mvc.arena.view {

import mx.collections.ArrayCollection;
import mx.core.ClassFactory;
import mx.core.IFlexModuleFactory;

import spark.components.List;
import spark.events.IndexChangeEvent;

public class ArenaWindowMenu extends List {


    private var __moduleFactoryInitialized: Boolean = false;

    private var menuChangeCallback: Function;

    public function ArenaWindowMenu() {
        super();
        this.percentWidth = 100;
        this.percentHeight = 100;
        this.itemRenderer = this._ArenaWindowMenu_ClassFactory1_c();
        this.addEventListener("change", this.___ArenaWindowMenu_List1_change);
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

    private function handleMenuChangeEvent(param1: IndexChangeEvent): void {
        this.menuChangeCallback(param1);
    }

    public function setMenuListData(param1: ArrayCollection): void {
        dataProvider = param1;
    }

    public function setMenuChangeHandler(param1: Function): void {
        this.menuChangeCallback = param1;
    }

    private function _ArenaWindowMenu_ClassFactory1_c(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = ArenaWindowMenuInnerClass0;
        _loc1_.properties = {"outerDocument": this};
        return _loc1_;
    }

    public function ___ArenaWindowMenu_List1_change(param1: IndexChangeEvent): void {
        this.handleMenuChangeEvent(param1);
    }
}
}
