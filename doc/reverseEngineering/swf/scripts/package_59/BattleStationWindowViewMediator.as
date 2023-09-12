package package_59 {

import com.greensock.TweenLite;

import mx.collections.ArrayCollection;

import net.bigpoint.darkorbit.gui.windows.class_57;
import net.bigpoint.darkorbit.mvc.battlestationswindow.BattleStationNotification;
import net.bigpoint.darkorbit.mvc.battlestationswindow.class_1023;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.mediator.Mediator;

import package_150.class_988;

import package_163.BattleStationProxy;
import package_163.class_1018;
import package_163.class_1520;
import package_163.class_1536;

import package_457.InventoryFilterMediator;

import package_48.class_137;

public class BattleStationWindowViewMediator extends Mediator implements class_1024 {

    public static const NAME: String = "BattleStationWindowViewMediator";


    public function BattleStationWindowViewMediator(param1: Object = null) {
        super(NAME, param1);
        mediatorName = NAME;
        this.setViewComponent(param1);
    }

    override public function onRegister(): void {
        super.onRegister();
        this.view.moduleInventoryView.addEventListener(class_988.SHOW_INVENTORY_FILTER_POPUP, this.method_3932);
    }

    override public function listNotificationInterests(): Array {
        return [BattleStationNotification.const_2731, BattleStationNotification.const_2225, BattleStationNotification.const_1035, BattleStationNotification.const_2638, BattleStationNotification.const_234, BattleStationNotification.const_2077, BattleStationNotification.const_2732, BattleStationNotification.const_2564, BattleStationNotification.const_37, BattleStationNotification.const_1455];
    }

    override public function handleNotification(param1: INotification): void {
        var _loc2_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc3_: String = param1.getName();
        var _loc4_: Object = param1.getBody();
        switch (_loc3_) {
            case BattleStationNotification.const_2731:
                _loc5_ = param1.getBody() as class_1018;
                this.view.method_5336(_loc5_, this.method_2589.name_156, this.method_2589.method_2339);
                this.method_3811();
                break;
            case BattleStationNotification.const_2225:
                _loc5_ = param1.getBody() as class_1018;
                this.view.method_4436(_loc5_, this.method_2589.name_156, this.method_2589.method_3727);
                this.method_3811();
                break;
            case BattleStationNotification.const_37:
                _loc5_ = param1.getBody() as class_1018;
                this.view.method_4436(_loc5_, this.method_2589.name_156, this.method_2589.method_3727, false);
                break;
            case BattleStationNotification.const_1035:
                _loc2_ = _loc4_ as Array;
                this.view.method_4164(_loc2_[1]);
                break;
            case BattleStationNotification.const_2638:
                _loc2_ = _loc4_ as Array;
                this.view.method_910(_loc2_[1]);
                break;
            case BattleStationNotification.const_2077:
                if (param1.getType() == class_1023.const_2503) {
                    TweenLite.killTweensOf(this.view.moduleInventoryView.moduleItemList);
                    this.view.moduleInventoryView.moduleItemList.alpha = 0;
                    TweenLite.to(this.view.moduleInventoryView.moduleItemList, 0.3, {
                        "delay": 0.3,
                        "alpha": 1
                    });
                }
                _loc6_ = param1.getBody() as ArrayCollection;
                this.view.moduleInventoryView.method_3785(_loc6_);
                break;
            case BattleStationNotification.const_234:
                this.view.method_2348(_loc4_ as int);
                break;
            case BattleStationNotification.const_2732:
                _loc7_ = param1.getBody() as class_1536;
                this.view.ratingsView.method_475(_loc7_.name_65, _loc7_.name_103, _loc7_.name_83, _loc7_.name_142);
                break;
            case BattleStationNotification.const_2564:
                _loc8_ = param1.getBody() as class_1520;
                this.view.moduleInstallationView.method_3455(_loc8_);
                break;
            case BattleStationNotification.const_1455:
                this.method_3811();
        }
    }

    private function method_3811(): void {
        var _loc1_: Boolean = Boolean(this.method_2589.method_1481);
        this.view.moduleInventoryView.filterBtnNormal.visible = !_loc1_;
        this.view.moduleInventoryView.filterBtnActive.visible = _loc1_;
    }

    private function method_3932(param1: class_988): void {
        var _loc2_: class_137 = class_137(class_57.getInstance().createWindow(class_57.const_602, class_57.const_729));
        _loc2_.y = this.view.y;
        _loc2_.x = this.view.x < Number(this.view.stage.width) / 2 ? Number(this.view.x) - Number(this.view.width) - 17 : this.view.x + this.view.width + 17;
        if (!facade.hasMediator(InventoryFilterMediator.NAME)) {
            facade.registerMediator(new InventoryFilterMediator(_loc2_));
        }
    }

    override public function setViewComponent(param1: Object): void {
        this.view.handler = this;
    }

    private function get method_2589(): BattleStationProxy {
        return facade.retrieveProxy(BattleStationProxy.NAME) as BattleStationProxy;
    }

    protected function get view(): class_159 {
        return viewComponent as class_159;
    }

    public function method_469(param1: int, param2: int, param3: int, param4: Boolean = false): void {
        sendNotification(BattleStationNotification.const_444, [param1, param2, param3, param4]);
    }

    public function method_4317(param1: int, param2: int): void {
        sendNotification(BattleStationNotification.const_1935, [param1, param2]);
    }

    public function method_951(param1: int, param2: int): void {
        sendNotification(BattleStationNotification.const_17, [param1, param2]);
    }

    public function method_1367(param1: int, param2: int): void {
        sendNotification(BattleStationNotification.const_1014, [param1, param2]);
    }

    public function method_2717(param1: int, param2: int): void {
        sendNotification(BattleStationNotification.const_1218, [param1, param2]);
    }
}
}
