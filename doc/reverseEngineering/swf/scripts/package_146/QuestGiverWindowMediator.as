package package_146 {

import flash.events.Event;

import mx.collections.ArrayList;
import mx.events.FlexEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.gui.windows.class_57;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.settings.Settings;

import org.puremvc.as3.multicore.interfaces.IMediator;
import org.puremvc.as3.multicore.interfaces.INotification;

import package_148.class_985;

import package_245.QuestSectionMediator;

import package_246.class_1506;

import package_31.class_92;

import package_38.class_457;
import package_38.class_591;

import package_49.class_139;

import package_80.QuestProxy;

import package_81.class_237;

import spark.components.Label;

public class QuestGiverWindowMediator extends class_92 implements IMediator {

    public static const NAME: String = "QuestGiverWindowMediator";

    public static const const_982: int = -1;

    public static const const_2824: int = 0;

    public static const const_1079: int = 1;

    public static const const_1734: int = 2;

    public static const const_2978: int = 3;


    private var var_550: int = 0;

    public function QuestGiverWindowMediator(param1: class_139) {
        super(NAME, param1);
        method_2176(class_237.const_3210, this.method_614);
        method_2176(class_237.const_2228, this.method_614);
        method_2176(class_237.const_2967, this.method_614);
    }

    override public function listNotificationInterests(): Array {
        return super.listNotificationInterests().concat([class_237.const_3148, NaN, class_237.const_1010, class_237.const_2537]);
    }

    override public function handleNotification(param1: INotification): void {
        var _loc2_: Boolean = false;
        var _loc3_: int = 0;
        var _loc4_: Boolean = false;
        var _loc5_: * = null;
        super.handleNotification(param1);
        switch (param1.getName()) {
            case class_237.const_3148:
                _loc2_ = param1.getBody()[2] as Boolean;
                this.view.questList.dataProvider = param1.getBody()[0] as ArrayList;
                _loc3_ = param1.getBody()[1] as int;
                for each(_loc5_ in this.view.method_4482()) {
                    _loc5_.visible = !_loc2_;
                    if (_loc3_ == 1) {
                        _loc5_.text = class_88.getItem("label_questslots_free_s").replace("%AMOUNT%", _loc3_);
                    } else {
                        _loc5_.text = class_88.getItem("label_questslots_free_p").replace("%AMOUNT%", _loc3_);
                    }
                }
                if (_loc2_) {
                    this.view.tabList = this.view.var_3267;
                    break;
                }
                this.view.tabList = this.view.var_3957;
                break;
            case NaN:
                break;
            case class_237.const_1010:
                _loc4_ = param1.getBody() as Boolean;
                this.view.method_5248(_loc4_);
                break;
            case class_237.const_2537:
                this.view.available.selected = Settings.questsAvailableFilter;
                this.view.unavailable.selected = Settings.questsUnavailableFilter;
                this.view.completed.selected = Settings.questsCompletedFilter;
                this.view.levelorder.selected = Settings.questsLevelOrderDescending;
                this.view.notYetDone.selected = Settings.challengesUnattemptedFilter;
                this.view.done.selected = Settings.challengesAttemptedFilter;
        }
    }

    private function method_6448(param1: class_985): void {
        sendNotification(class_237.const_1272, [param1.questID, param1.rootCaseID]);
    }

    override public function onRegister(): void {
        super.onRegister();
        facade.registerMediator(new QuestSectionMediator(this.view.questWindowQuestSection));
        facade.registerMediator(new class_1506(this.view.questWindowChallengesSection));
        this.view.addEventListener(FlexEvent.CREATION_COMPLETE, this.handleCreationComplete);
        this.view.addEventListener(FlexEvent.REMOVE, this.method_733);
        this.view.addEventListener(class_985.GET_DETAILED_QUEST_INFO, this.method_6448);
        this.view.addEventListener(class_985.TAB_CHANGED, this.method_1005);
        this.view.addEventListener(class_985.FILTERS_CHANGED, this.method_715);
        class_126.instance.const_1548.add(this.method_614);
    }

    private function method_614(param1: INotification = null): void {
        this.view.method_614();
    }

    private function handleCreationComplete(param1: FlexEvent): void {
        sendNotification(class_237.const_2967);
    }

    private function method_715(param1: class_985): void {
        facade.sendNotification(class_237.const_1919);
        facade.sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_457(Settings.questsAvailableFilter, Settings.questsUnavailableFilter, Settings.questsCompletedFilter, Settings.challengesAttemptedFilter, Settings.challengesUnattemptedFilter, Settings.questsLevelOrderDescending));
        facade.sendNotification(class_237.const_854);
    }

    private function method_733(param1: Event): void {
        var _loc2_: * = null;
        if (this.var_550 > 0) {
            _loc2_ = new class_591(this.var_550);
            facade.sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, _loc2_);
        }
    }

    override public function onRemove(): void {
        super.onRemove();
        if (this.view) {
            this.view.removeEventListener(FlexEvent.CREATION_COMPLETE, this.handleCreationComplete);
            this.view.removeEventListener(FlexEvent.REMOVE, this.method_733);
            this.view.removeEventListener(class_985.GET_DETAILED_QUEST_INFO, this.method_6448);
            this.view.removeEventListener(class_985.TAB_CHANGED, this.method_1005);
            this.view.removeEventListener(class_985.FILTERS_CHANGED, this.method_715);
        }
        facade.removeMediator(QuestSectionMediator.NAME);
        facade.removeMediator(class_1506.NAME);
        class_126.instance.const_1548.remove(this.method_614);
    }

    public function get method_3605(): QuestProxy {
        return facade.retrieveProxy(QuestProxy.NAME) as QuestProxy;
    }

    protected function get view(): class_139 {
        return viewComponent as class_139;
    }

    public function method_1005(param1: class_985): void {
        var _loc2_: int = param1.data as int;
        var _loc3_: * = _loc2_ == const_1079;
        this.view.questWindowQuestSection.visible = !_loc3_;
        this.view.questWindowChallengesSection.visible = _loc3_;
        facade.sendNotification(class_237.const_2117, _loc2_);
    }

    public function set method_3123(param1: int): void {
        this.var_550 = param1;
    }
}
}
