package package_455 {

import com.greensock.TweenLite;

import flash.events.MouseEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.fui.components.buttons.button.Button;
import net.bigpoint.darkorbit.fui.components.core.Coreponent;
import net.bigpoint.darkorbit.fui.components.list.itemlist.DefaultItemDataAssigner;

import package_260.class_1659;

public class class_2530 extends DefaultItemDataAssigner {

    public static const const_1425: RegExp = /%LEVEL%/;

    public static const const_889: RegExp = /%CLANPLACEHOLDER%/;

    public static const const_2584: RegExp = /%CLANTAG%/;


    protected var var_539: Coreponent;

    protected var var_4856: Coreponent;

    protected var var_151: Coreponent;

    protected var var_3811: Coreponent;

    protected var var_3389: Coreponent;

    protected var var_3700: Coreponent;

    protected var var_3395: Coreponent;

    protected var var_770: Coreponent;

    protected var var_1969: Coreponent;

    protected var var_3240: Button;

    protected var var_4732: Button;

    protected var var_3535: Button;

    protected var var_3963: Button;

    protected var var_4758: Button;

    protected var var_1270: Coreponent;

    public function class_2530() {
        super();
        _mouseEnabled = true;
        _mouseChildrenEnabled = true;
        initialize();
    }

    override public function assignChildren(): void {
        super.assignChildren();
        this.var_539 = getChildByName("statusIcon_buddy_offline") as Coreponent;
        this.var_4856 = getChildByName("statusIcon_buddy_online") as Coreponent;
        this.var_151 = getChildByName("statusIcon_buddy_on_map") as Coreponent;
        this.var_3811 = getChildByName("statusIcon_buddy_pending") as Coreponent;
        this.var_3389 = getChildByName("statusIcon_buddy_blocked") as Coreponent;
        this.var_3700 = getChildByName("statusIcon_buddy_myrequest_pending") as Coreponent;
        this.var_3395 = getChildByName("statusIcon_buddy_myrequest_declined") as Coreponent;
        this.var_770 = getChildByName("statusIcon_clan_green") as Coreponent;
        this.var_1969 = getChildByName("statusIcon_clan_red") as Coreponent;
        this.var_1270 = this.hitLayer as Coreponent;
        this.method_2445();
        this.method_4245();
        this.method_4254();
        this.method_2769();
        this.method_957();
        this.method_3429();
        this.addEventListener(MouseEvent.ROLL_OVER, this.method_1058);
        this.addEventListener(MouseEvent.ROLL_OUT, this.method_3409);
        this.useHandCursor = true;
        this.buttonMode = true;
    }

    protected function method_2445(): void {
        this.var_3240 = getChildByName("button_add_contact") as Button;
        this.var_3240.addEventListener(MouseEvent.CLICK, this.method_3511);
    }

    protected function method_4245(): void {
        this.var_4732 = getChildByName("button_remove_contact") as Button;
        this.var_4732.addEventListener(MouseEvent.CLICK, this.method_4975);
    }

    protected function method_4254(): void {
        this.var_3535 = getChildByName("button_accept_contact") as Button;
        this.var_3535.addEventListener(MouseEvent.CLICK, this.method_2263);
    }

    protected function method_2769(): void {
        this.var_3963 = getChildByName("button_decline_contact") as Button;
        this.var_3963.addEventListener(MouseEvent.CLICK, this.method_4282);
    }

    protected function method_957(): void {
        this.var_4758 = getChildByName("button_unblock_contact") as Button;
        this.var_4758.addEventListener(MouseEvent.CLICK, this.method_5993);
    }

    private function method_3511(param1: MouseEvent): void {
        var _loc2_: class_1659 = data as class_1659;
        dispatchEvent(new ContactListItemDataAssignerEvent(ContactListItemDataAssignerEvent.var_995, _loc2_));
    }

    private function method_4975(param1: MouseEvent): void {
        var _loc2_: class_1659 = data as class_1659;
        dispatchEvent(new ContactListItemDataAssignerEvent(ContactListItemDataAssignerEvent.var_2264, _loc2_));
    }

    private function method_2263(param1: MouseEvent): void {
        var _loc2_: class_1659 = data as class_1659;
        dispatchEvent(new ContactListItemDataAssignerEvent(ContactListItemDataAssignerEvent.var_4016, _loc2_));
    }

    private function method_4282(param1: MouseEvent): void {
        var _loc2_: class_1659 = data as class_1659;
        dispatchEvent(new ContactListItemDataAssignerEvent(ContactListItemDataAssignerEvent.var_1525, _loc2_));
    }

    private function method_5993(param1: MouseEvent): void {
        var _loc2_: class_1659 = data as class_1659;
        dispatchEvent(new ContactListItemDataAssignerEvent(ContactListItemDataAssignerEvent.var_3958, _loc2_));
    }

    protected function method_4846(): void {
        this.var_3240.removeEventListener(MouseEvent.CLICK, this.method_3511);
        this.var_3240.dispose();
        this.var_3240 = null;
    }

    protected function method_1136(): void {
        this.var_4732.removeEventListener(MouseEvent.CLICK, this.method_4975);
        this.var_4732.dispose();
        this.var_4732 = null;
    }

    protected function method_6262(): void {
        this.var_3535.removeEventListener(MouseEvent.CLICK, this.method_2263);
        this.var_3535.dispose();
        this.var_3535 = null;
    }

    protected function method_3262(): void {
        this.var_3963.removeEventListener(MouseEvent.CLICK, this.method_4282);
        this.var_3963.dispose();
        this.var_3963 = null;
    }

    protected function method_361(): void {
        this.var_4758.removeEventListener(MouseEvent.CLICK, this.method_5993);
        this.var_4758.dispose();
        this.var_4758 = null;
    }

    override public function set data(param1: Object): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        super.data = param1;
        this.method_3429();
        this.method_2567();
        _loc2_ = param1 as class_1659;
        if (_loc2_ == null) {
            this.visible = false;
            return;
        }
        this.visible = true;
        this.var_1270.tooltipData = class_88.getItem("ttip_contactname_without_chat");
        switch (_loc2_.method_398) {
            case class_1659.const_1624:
                this.var_539.visible = true;
                this.var_539.tooltipData = this.method_4885("ttip_offline_icon", _loc2_);
                this.var_3240.visible = false;
                break;
            case class_1659.const_2358:
                this.var_4856.visible = true;
                this.var_4856.tooltipData = this.method_4885("ttip_online_icon", _loc2_);
                this.var_3240.visible = true;
                break;
            case class_1659.const_2453:
                this.var_151.visible = true;
                this.var_151.tooltipData = this.method_4885("ttip_same_map_icon", _loc2_);
                this.var_3240.visible = true;
                break;
            case class_1659.const_1891:
                this.var_3811.visible = true;
                this.var_3535.visible = true;
                this.var_3963.visible = true;
                _loc4_ = this.method_4885("ttip_pending_request_icon", _loc2_);
                this.var_1270.tooltipData = _loc4_;
                this.var_3811.tooltipData = _loc4_;
                break;
            case class_1659.const_1517:
                this.var_3389.visible = true;
                this.var_3389.tooltipData = this.method_4885("ttip_blocked_icon", _loc2_);
                this.var_4758.visible = true;
                this.var_1270.tooltipData = class_88.getItem("userInfo_action_blacklistUserListed");
                break;
            case class_1659.const_650:
                this.var_3700.visible = true;
                this.var_3700.tooltipData = this.method_4885("ttip_sent_request_pending_icon", _loc2_);
                this.var_4732.visible = true;
                break;
            case class_1659.const_698:
                this.var_3395.visible = true;
                this.var_3395.tooltipData = this.method_4885("ttip_sent_request_declined_icon", _loc2_);
                this.var_4732.visible = true;
                this.var_1270.tooltipData = this.method_4885("ttip_sent_request_icon", _loc2_);
        }
        switch (_loc2_.name_98) {
            case class_1659.const_3261:
                this.var_1969.visible = true;
                this.var_1969.tooltipData = _loc3_ = this.method_4885("ttip_clan_enemy_icon", _loc2_);
                break;
            case class_1659.const_3196:
                this.var_770.visible = true;
                this.var_770.tooltipData = this.method_4885("ttip_clan_friendly_icon", _loc2_);
                break;
            case class_1659.const_1772:
                _loc3_ = this.method_4885("ttip_clan_neutral_icon", _loc2_);
        }
        if (_loc2_.method_4171()) {
            this.var_770.visible = true;
            this.var_770.tooltipData = this.method_4885("ttip_clan_neutral_icon", _loc2_);
        }
        this.drawSelection();
        label.text = _loc2_.name_148;
    }

    protected function method_4885(param1: String, param2: class_1659): String {
        var _loc4_: * = null;
        var _loc3_: String = class_88.getItem(param1);
        _loc3_ = _loc3_.replace(const_1425, param2.level);
        if (param2.name_145 != null) {
            _loc4_ = class_88.getItem("ttip_clanplaceholder");
            _loc4_ = "- " + _loc4_ + ": ";
            _loc3_ = _loc3_.replace(const_889, _loc4_);
            _loc3_ = _loc3_.replace(const_2584, param2.name_145);
        } else {
            _loc3_ = _loc3_.replace(const_889, "");
            _loc3_ = _loc3_.replace(const_2584, "");
        }
        return _loc3_;
    }

    protected function method_3429(): void {
        this.var_539.visible = false;
        this.var_4856.visible = false;
        this.var_151.visible = false;
        this.var_3811.visible = false;
        this.var_3389.visible = false;
        this.var_3700.visible = false;
        this.var_3395.visible = false;
        this.var_770.visible = false;
        this.var_1969.visible = false;
    }

    protected function method_2567(): void {
        this.var_3240.visible = false;
        this.var_4732.visible = false;
        this.var_3535.visible = false;
        this.var_3963.visible = false;
        this.var_4758.visible = false;
    }

    override public function dispose(): void {
        TweenLite.killTweensOf(label);
        TweenLite.killTweensOf(this);
        super.dispose();
        this.var_539 = null;
        this.var_4856 = null;
        this.var_151 = null;
        this.var_3811 = null;
        this.method_4846();
        this.method_1136();
        this.method_6262();
        this.method_3262();
        this.method_361();
    }

    private function method_3409(param1: MouseEvent): void {
        if (label) {
            TweenLite.to(label, 0.3, {"x": 40});
        }
        hitLayer.alpha = 0;
    }

    private function method_1058(param1: MouseEvent): void {
        if (label) {
            TweenLite.to(label, 0.3, {"x": 60});
        }
        hitLayer.alpha = 0.5;
    }

    protected function handleMouseClick(param1: MouseEvent): void {
        var _loc2_: class_1659 = data as class_1659;
        dispatchEvent(new ContactListItemDataAssignerEvent(ContactListItemDataAssignerEvent.ICON_CLICKED, _loc2_));
    }

    override protected function drawSelection(): void {
        if (_selected) {
            label.alpha = 0.5;
        } else {
            label.alpha = 1;
        }
    }
}
}
