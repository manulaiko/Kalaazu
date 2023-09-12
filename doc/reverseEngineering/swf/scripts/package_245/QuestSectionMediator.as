package package_245 {

import mx.collections.ArrayList;

import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.questWindow.model.vo.QuestListItemVO;

import org.puremvc.as3.multicore.interfaces.IMediator;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.mediator.Mediator;

import package_145.class_983;

import package_148.class_985;

import package_65.class_203;

import package_80.QuestProxy;

import package_81.class_237;

public class QuestSectionMediator extends Mediator implements IMediator {

    public static const NAME: String = "QuestSectionMediator";


    public function QuestSectionMediator(param1: class_983) {
        super(NAME, param1);
    }

    override public function onRegister(): void {
        super.onRegister();
    }

    override public function listNotificationInterests(): Array {
        return [class_237.const_3210, class_237.const_1934, class_237.const_2784, class_237.const_2228];
    }

    override public function handleNotification(param1: INotification): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: Boolean = false;
        var _loc6_: * = null;
        switch (param1.getName()) {
            case class_237.const_3210:
                _loc3_ = param1.getBody() as Array;
                _loc4_ = _loc3_[0] as class_203;
                _loc2_ = _loc3_[1] as QuestListItemVO;
                _loc5_ = _loc3_[2] as Boolean;
                this.view.method_3436(_loc4_, _loc2_);
                this.view.selectedQuestObjectives.objectiveList.dataProvider = new ArrayList([_loc4_]);
                this.view.selectedQuestObjectives.objectiveListScrollerGroup.verticalScrollPosition = 0;
                this.view.selectedQuestRewards.rewardsList.dataProvider = new ArrayList(_loc4_.rewards);
                if (_loc2_.acceptable && !_loc5_) {
                    this.view.addEventListener(class_985.ACCEPT_QUEST, this.method_117);
                    this.view.acceptButton.enabled = true;
                    this.view.acceptButtonTooltipGroup.toolTip = "";
                } else {
                    this.view.acceptButton.enabled = false;
                    this.view.acceptButtonTooltipGroup.toolTip = _loc2_.notAcceptableReasons;
                }
                this.view.addEventListener(class_985.ABORT_QUEST, this.method_203);
                break;
            case class_237.const_1934:
                _loc2_ = param1.getBody() as QuestListItemVO;
                this.view.method_3758(_loc2_);
                break;
            case class_237.const_2784:
                _loc6_ = param1.getBody() as class_203;
                this.view.selectedQuestObjectives.objectiveList.dataProvider = new ArrayList([_loc6_]);
                break;
            case class_237.const_2228:
                this.view.questDesc.text = "";
                this.view.questTitle.text = "";
                this.view.selectedQuestObjectives.objectiveList.dataProvider = null;
                this.view.selectedQuestRewards.rewardsList.dataProvider = null;
                this.view.var_115 = -1;
                this.view.var_1727 = -1;
                this.view.acceptButton.enabled = false;
        }
    }

    private function method_203(param1: class_985): void {
        sendNotification(GuiNotifications.CLOSE_QUEST_WINDOW);
    }

    private function method_117(param1: class_985): void {
        sendNotification(class_237.ACCEPT_QUEST, [param1.questID, param1.rootCaseID]);
    }

    protected function get view(): class_983 {
        return viewComponent as class_983;
    }

    public function get method_3605(): QuestProxy {
        return facade.retrieveProxy(QuestProxy.NAME) as QuestProxy;
    }
}
}
