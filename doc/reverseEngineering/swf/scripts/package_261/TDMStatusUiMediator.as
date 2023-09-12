package package_261 {

import com.bigpoint.utils.class_129;

import flash.text.TextField;
import flash.utils.Dictionary;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.mediator.Mediator;

import package_262.class_1665;

import package_344.class_1927;

import package_38.class_439;
import package_38.class_529;

import package_70.SimpleWindowEvent;

import package_83.TDMStatusNotification;
import package_83.class_1926;

import package_98.MapNotification;

public class TDMStatusUiMediator extends Mediator {

    public static const NAME: String = "TDMStatusUiMediator";


    private var var_3717: Dictionary;

    public function TDMStatusUiMediator(param1: Object) {
        this.var_3717 = new Dictionary();
        super(NAME, param1);
        this.method_2196();
        this.method_5072();
    }

    private function method_5072(): void {
        this.decorator.method_1434.method_1666.text = class_88.getItem(class_1926.const_1179);
    }

    private function method_2196(): void {
        this.var_3717[class_439.MMO] = this.decorator.method_1434.name_107;
        this.var_3717[class_439.EIC] = this.decorator.method_1434.name_139;
        this.var_3717[class_439.VRU] = this.decorator.method_1434.name_27;
    }

    private function get decorator(): class_1665 {
        return viewComponent as class_1665;
    }

    override public function listNotificationInterests(): Array {
        return [TDMStatusNotification.UPDATE_CURRENT_FACTION_SCORES_OPPONENT, TDMStatusNotification.UPDATE_CURRENT_FACTION_SCORES_PLAYER, TDMStatusNotification.UPDATE_OVERALL_SCORE, TDMStatusNotification.UPDATE_REMAINIG_SECONDS, TDMStatusNotification.UPDATE_REMAINING_LIVES, MapNotification.CLEANUP];
    }

    override public function handleNotification(param1: INotification): void {
        super.handleNotification(param1);
        switch (param1.getName()) {
            case TDMStatusNotification.UPDATE_CURRENT_FACTION_SCORES_PLAYER:
                this.method_6475(param1.getBody() as class_1927);
                break;
            case TDMStatusNotification.UPDATE_CURRENT_FACTION_SCORES_OPPONENT:
                this.method_4523(param1.getBody() as class_1927);
                break;
            case TDMStatusNotification.UPDATE_OVERALL_SCORE:
                this.method_639(param1.getBody() as Vector.<class_529>);
                break;
            case TDMStatusNotification.UPDATE_REMAINIG_SECONDS:
                this.method_6090(param1.getBody() as int);
                break;
            case TDMStatusNotification.UPDATE_REMAINING_LIVES:
                this.method_4842(param1.getBody() as int);
                break;
            case MapNotification.CLEANUP:
                this.method_5967();
        }
    }

    private function method_639(param1: Vector.<class_529>): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc2_: int = param1.length;
        var _loc5_: int = 0;
        while (_loc5_ < _loc2_) {
            _loc3_ = param1[_loc5_];
            _loc4_ = this.var_3717[_loc3_.faction.faction] as TextField;
            this.method_4952(_loc3_, _loc4_);
            _loc5_++;
        }
    }

    private function method_4842(param1: int): void {
        this.decorator.method_1371.method_264.text = class_88.getItem(class_1926.const_1849);
        this.decorator.method_1371.method_3880.text = param1.toString();
    }

    private function method_6090(param1: int): void {
        if (param1 >= 0) {
            this.decorator.method_1371.method_3721.text = class_88.getItem(class_1926.const_2020);
            this.decorator.method_1371.name_11.text = class_129.method_1101(param1, true);
        }
    }

    private function method_6475(param1: class_1927): void {
        this.decorator.method_5081.method_6076(param1.faction);
        this.decorator.method_5081.method_651.update(param1.score, param1.method_1546);
    }

    private function method_4523(param1: class_1927): void {
        this.decorator.method_606.method_6076(param1.faction);
        this.decorator.method_606.method_651.update(param1.score, param1.method_1546);
    }

    override public function onRegister(): void {
        this.decorator.window.addEventListener(SimpleWindowEvent.ON_CLOSE, this.method_5967);
        super.onRegister();
    }

    private function method_5967(param1: SimpleWindowEvent = null): void {
        facade.removeMediator(getMediatorName());
    }

    override public function onRemove(): void {
        this.decorator.window.removeEventListener(SimpleWindowEvent.ON_CLOSE, this.method_5967);
        sendNotification(GuiNotifications.CLOSE_WINDOW_BY_ID, this.decorator.window.id);
        sendNotification(TDMStatusNotification.CLEANUP);
        super.onRemove();
    }

    private function method_4952(param1: class_529, param2: TextField): void {
        var _loc3_: String = class_126.instance.method_2276[param1.faction.faction] + ": " + param1.score;
        param2.text = _loc3_;
    }
}
}
