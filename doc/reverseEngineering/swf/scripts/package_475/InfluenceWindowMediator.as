package package_475 {

import com.bigpoint.utils.class_122;

import flash.filters.GlowFilter;

import net.bigpoint.darkorbit.fui.components.core.Container;
import net.bigpoint.darkorbit.fui.components.core.data.VectorCollection;
import net.bigpoint.darkorbit.fui.components.list.itemlist.ItemList;
import net.bigpoint.darkorbit.fui.components.scroll.ScrollContainer;
import net.bigpoint.darkorbit.fui.components.scroll.Scrollbar;
import net.bigpoint.darkorbit.fui.components.text.label.Label;
import net.bigpoint.darkorbit.fui.system.utils.BindingsUtils;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_31.class_92;

import package_320.InfluenceWindowNotifications;
import package_320.class_2517;

import package_321.class_2269;

import package_46.class_131;

import package_70.SimpleWindowEvent;

public class InfluenceWindowMediator extends class_92 {

    public static const NAME: String = "InfluenceWindowMediator";

    private static const const_201: Array = [new GlowFilter(4520959, 1, 5, 5, 2)];


    private var var_841: class_131;

    public function InfluenceWindowMediator(param1: Object, param2: class_131) {
        super(NAME, param1);
        this.var_841 = param2;
        this.addListeners();
        method_2176(InfluenceWindowNotifications.UPDATE_PLAYER_INFLUENCE, this.method_4202);
        method_2176(InfluenceWindowNotifications.UPDATE_ALL, this.updateAll);
    }

    private function updateAll(param1: INotification): void {
        var _loc2_: class_2269 = param1.getBody() as class_2269;
        this.method_4920.list = new VectorCollection(_loc2_.list);
        this.method_6295(_loc2_.playerScore);
    }

    private function method_4202(param1: INotification): void {
        this.method_6295(param1.getBody() as Number);
    }

    private function method_6295(param1: Number): void {
        this.method_4005.text = class_122.round(param1);
    }

    private function get method_692(): Container {
        return viewComponent as Container;
    }

    private function get method_4920(): ItemList {
        return this.method_692.getChildByName(class_2517.const_3253) as ItemList;
    }

    private function get method_4005(): Label {
        return this.method_692.getChildByName(class_2517.const_489) as Label;
    }

    private function addListeners(): void {
        this.method_6435();
        this.method_1285();
        this.var_841.addEventListener(SimpleWindowEvent.ON_CLOSE, this.method_2519);
        this.method_6288(class_2517.const_1214, class_2517.const_504, class_2517.const_420);
        this.method_6288(class_2517.const_892, class_2517.const_2301, class_2517.const_2755);
    }

    private function method_2519(param1: SimpleWindowEvent): void {
        facade.removeMediator(this.getMediatorName());
    }

    override public function onRemove(): void {
        this.method_25();
        sendNotification(InfluenceWindowNotifications.CLEANUP);
        super.onRemove();
    }

    private function method_25(): void {
        this.var_841.removeEventListener(SimpleWindowEvent.ON_CLOSE, this.method_2519);
        this.method_2538(class_2517.const_1214, class_2517.const_504, class_2517.const_420);
        this.method_2538(class_2517.const_892, class_2517.const_2301, class_2517.const_2755);
    }

    private function method_6435(): void {
        this.method_4920.itemDataAssigner = class_2714;
    }

    private function method_1285(): void {
        this.method_4005.filters = const_201;
    }

    private function method_6288(param1: String, param2: String, param3: String): void {
        var _loc4_: Container;
        var _loc5_: Scrollbar = (_loc4_ = this.method_692.getChildByName(param1) as Container).getChildByName(param2) as Scrollbar;
        var _loc6_: ScrollContainer = _loc4_.getChildByName(param3) as ScrollContainer;
        BindingsUtils.bindScrollComponents(_loc6_, _loc5_);
    }

    private function method_2538(param1: String, param2: String, param3: String): void {
        var _loc4_: Container;
        var _loc5_: Scrollbar = (_loc4_ = this.method_692.getChildByName(param1) as Container).getChildByName(param2) as Scrollbar;
        var _loc6_: ScrollContainer = _loc4_.getChildByName(param3) as ScrollContainer;
        BindingsUtils.unbindScrollComponents(_loc6_, _loc5_);
    }
}
}
