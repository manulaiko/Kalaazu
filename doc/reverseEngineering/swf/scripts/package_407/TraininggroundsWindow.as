package package_407 {

import com.bigpoint.utils.class_122;
import com.bigpoint.utils.class_129;
import com.bigpoint.utils.class_73;
import com.greensock.TweenNano;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.filters.GlowFilter;
import flash.utils.Dictionary;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.fui.components.buttons.button.Button;
import net.bigpoint.darkorbit.fui.components.buttons.checkbox.CheckBox;
import net.bigpoint.darkorbit.fui.components.core.Coreponent;
import net.bigpoint.darkorbit.fui.components.core.InvalidationType;
import net.bigpoint.darkorbit.fui.components.core.data.VectorCollection;
import net.bigpoint.darkorbit.fui.components.list.itemlist.ItemList;
import net.bigpoint.darkorbit.fui.components.scroll.ScrollContainer;
import net.bigpoint.darkorbit.fui.components.scroll.Scrollbar;
import net.bigpoint.darkorbit.fui.components.text.label.Label;
import net.bigpoint.darkorbit.fui.system.utils.BindingsUtils;
import net.bigpoint.darkorbit.fui.system.utils.FuiComponentSelectorUtil;
import net.bigpoint.darkorbit.mvc.gui.interfaces.IWindow;

import package_184.class_1648;
import package_184.class_1650;
import package_184.class_1652;

import package_27.class_82;

import package_46.class_131;

import package_76.class_215;

public class TraininggroundsWindow extends Sprite {


    private const const_1057: int = 136;

    private var var_1435: Array;

    private var var_3047: IWindow;

    private var var_2805: DisplayObjectContainer;

    private var var_1407: Label;

    private var var_1521: Button;

    private var var_305: Button;

    private var var_2177: Button;

    private var var_3498: Button;

    private var var_383: Label;

    private var var_1545: Label;

    private var var_4613: Label;

    private var var_1225: Label;

    private var var_4168: Label;

    private var var_4970: Label;

    private var var_1649: Label;

    private var var_1747: MovieClip;

    private var var_1548: Label;

    private var var_2530: MovieClip;

    private var var_859: Label;

    private var var_3989: Label;

    private var var_4802: Coreponent;

    private var var_3923: Coreponent;

    private var var_2817: Coreponent;

    private var var_2979: Coreponent;

    private var var_606: CheckBox;

    private var var_1812: CheckBox;

    private var var_4914: CheckBox;

    private var var_2090: CheckBox;

    private var var_3805: Label;

    private var var_1358: Label;

    private var var_2314: DisplayObjectContainer;

    private var var_3956: DisplayObjectContainer;

    private var currentState: int = 0;

    private var var_2673: Dictionary;

    private const const_2724: String = "tab_";

    private var var_1608: VectorCollection;

    private var var_3631: VectorCollection;

    private var var_2256: Coreponent;

    private var var_3820: Label;

    public function TraininggroundsWindow(param1: IWindow) {
        this.var_1435 = ["tab_match", "tab_stats", "tab_rewards"];
        this.var_2673 = new Dictionary();
        this.var_1608 = new VectorCollection(null);
        this.var_3631 = new VectorCollection(null);
        super();
        this.var_3047 = param1;
    }

    public function method_866(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (this.numChildren > 0) {
            this.var_2805 = this.getChildByName("windowContentContainer") as DisplayObjectContainer;
            if (this.var_2805) {
                this.var_2673[class_1650.DISABLED] = this.var_2805.getChildByName("tgDisabledStageContainer") as DisplayObjectContainer;
                this.var_2673[class_1650.const_2084] = this.var_2805.getChildByName("initialStageContainer") as DisplayObjectContainer;
                this.var_2673[class_1650.const_1187] = this.var_2805.getChildByName("searchingStageContainer") as DisplayObjectContainer;
                this.var_2673[class_1650.const_1568] = this.var_2805.getChildByName("opponentFoundStageContainer") as DisplayObjectContainer;
                this.var_2673[class_1650.const_242] = this.var_2805.getChildByName("waitingForOpponentStageContainer") as DisplayObjectContainer;
                this.var_2673[class_1650.const_1469] = this.var_2805.getChildByName("fightingStageContainer") as DisplayObjectContainer;
                this.var_1407 = (this.var_2673[class_1650.DISABLED] as DisplayObjectContainer).getChildByName("disabledReasonLabel") as Label;
                this.var_305 = this.method_3914.getChildByName("confirmationButton") as Button;
                this.var_305.addEventListener(MouseEvent.CLICK, this.method_1155);
                this.var_2177 = (this.var_2673[class_1650.const_1187] as DisplayObjectContainer).getChildByName("cancelButton") as Button;
                this.var_2177.addEventListener(MouseEvent.CLICK, this.handleCancelButtonClicked);
                this.var_1521 = (this.var_2673[class_1650.const_1568] as DisplayObjectContainer).getChildByName("fightButton") as Button;
                this.var_1521.addEventListener(MouseEvent.CLICK, this.method_5187);
                this.var_3498 = (this.var_2673[class_1650.const_1568] as DisplayObjectContainer).getChildByName("cancelButton") as Button;
                this.var_3498.addEventListener(MouseEvent.CLICK, this.handleCancelButtonClicked);
                this.var_383 = this.method_3914.getChildByName("yourVictoriesLabel") as Label;
                this.var_1545 = this.method_3914.getChildByName("battlesPlayedLabel") as Label;
                this.var_4613 = FuiComponentSelectorUtil.selectComponent("rankContainer.rankLabel", this.method_3914) as Label;
                this.var_3820 = FuiComponentSelectorUtil.selectComponent("rankContainer.rankScore", this.method_3914) as Label;
                this.var_2256 = FuiComponentSelectorUtil.selectComponent("rankContainer.rankIcon", this.method_3914) as Coreponent;
                this.var_1225 = this.method_3914.getChildByName("scoreLabel") as Label;
                this.var_4168 = this.method_6416.getChildByName("seasonLabel") as Label;
                this.var_4970 = (this.var_2673[class_1650.const_1568] as DisplayObjectContainer).getChildByName("countdownLabel") as Label;
                this.var_1649 = (this.var_2673[class_1650.const_1568] as DisplayObjectContainer).getChildByName("ownStatusLabel") as Label;
                this.var_1747 = (this.var_2673[class_1650.const_1568] as DisplayObjectContainer).getChildByName("hourglas") as MovieClip;
                this.var_1548 = (this.var_2673[class_1650.const_242] as DisplayObjectContainer).getChildByName("countdownLabel") as Label;
                this.var_2530 = (this.var_2673[class_1650.const_242] as DisplayObjectContainer).getChildByName("hourglas") as MovieClip;
                this.var_4802 = (this.var_2673[class_1650.const_1469] as DisplayObjectContainer).getChildByName("ownHPBar") as Coreponent;
                this.var_2817 = (this.var_2673[class_1650.const_1469] as DisplayObjectContainer).getChildByName("ownShieldBar") as Coreponent;
                this.var_859 = (this.var_2673[class_1650.const_1469] as DisplayObjectContainer).getChildByName("ownNameLabel") as Label;
                this.var_3923 = (this.var_2673[class_1650.const_1469] as DisplayObjectContainer).getChildByName("opponentHPBar") as Coreponent;
                this.var_2979 = (this.var_2673[class_1650.const_1469] as DisplayObjectContainer).getChildByName("opponentShieldBar") as Coreponent;
                this.var_3989 = (this.var_2673[class_1650.const_1469] as DisplayObjectContainer).getChildByName("opponentNameLabel") as Label;
                this.var_606 = (this.var_2673[class_1650.const_1469] as DisplayObjectContainer).getChildByName("round1WonOwn") as CheckBox;
                this.var_1812 = (this.var_2673[class_1650.const_1469] as DisplayObjectContainer).getChildByName("round2WonOwn") as CheckBox;
                this.var_4914 = (this.var_2673[class_1650.const_1469] as DisplayObjectContainer).getChildByName("round1WonOpponent") as CheckBox;
                this.var_2090 = (this.var_2673[class_1650.const_1469] as DisplayObjectContainer).getChildByName("round2WonOpponent") as CheckBox;
                this.var_3805 = (this.var_2673[class_1650.const_1469] as DisplayObjectContainer).getChildByName("roundNumberLabel") as Label;
                this.var_3805.filters = [new GlowFilter(65535)];
                this.var_2314 = (this.var_2673[class_1650.const_1469] as DisplayObjectContainer).getChildByName("heroPic") as DisplayObjectContainer;
                this.var_3956 = (this.var_2673[class_1650.const_1469] as DisplayObjectContainer).getChildByName("oppoPic") as DisplayObjectContainer;
                this.var_1358 = (this.var_2673[class_1650.const_1469] as DisplayObjectContainer).getChildByName("countdownLabel") as Label;
                this.currentState = class_1650.const_2084;
                _loc1_ = FuiComponentSelectorUtil.selectComponent("initialStageContainer.tabbar.match", this.var_2805) as Button;
                _loc2_ = FuiComponentSelectorUtil.selectComponent("initialStageContainer.tabbar.stats", this.var_2805) as Button;
                _loc3_ = FuiComponentSelectorUtil.selectComponent("initialStageContainer.tabbar.rewards", this.var_2805) as Button;
                (_loc4_ = new TabController(_loc1_, _loc2_, _loc3_)).stateChanged.add(this.method_5771);
                this.method_5771("match");
                this.method_5848.itemDataAssigner = StatsAssigner;
                this.rewardsList.itemDataAssigner = RewardsAssigner;
                BindingsUtils.bindScrollComponentsBySelection(this.method_6416, "tab_stats.scrollbar", "tab_stats.container");
                BindingsUtils.bindScrollComponentsBySelection(this.method_6416, "tab_rewards.content.scrollbar", "tab_rewards.content.container");
            }
        }
    }

    private function method_5771(param1: String): void {
        var _loc3_: * = null;
        var _loc2_: DisplayObjectContainer = this.method_6416;
        for each(_loc3_ in this.var_1435) {
            _loc2_.getChildByName(_loc3_).visible = false;
        }
        _loc2_.getChildByName("tab_" + param1).visible = true;
    }

    private function get method_3914(): DisplayObjectContainer {
        return this.method_6416.getChildByName("tab_match") as DisplayObjectContainer;
    }

    private function get method_5848(): ItemList {
        return FuiComponentSelectorUtil.selectComponent("tab_stats.container.content", this.method_6416) as ItemList;
    }

    private function get rewardsList(): ItemList {
        return FuiComponentSelectorUtil.selectComponent("tab_rewards.content.container.content", this.method_6416) as ItemList;
    }

    private function get method_4528(): Coreponent {
        return FuiComponentSelectorUtil.selectComponent("tab_rewards.content", this.method_6416) as Coreponent;
    }

    private function get method_2906(): Label {
        return FuiComponentSelectorUtil.selectComponent("tab_rewards.info", this.method_6416) as Label;
    }

    private function get method_6416(): DisplayObjectContainer {
        return this.var_2673[class_1650.const_2084] as DisplayObjectContainer;
    }

    private function method_5187(param1: MouseEvent): void {
        dispatchEvent(new class_2540(class_2540.FIGHT_CLICKED));
    }

    private function method_1155(param1: MouseEvent): void {
        dispatchEvent(new class_2540(class_2540.MATCH_CLICKED));
    }

    private function handleCancelButtonClicked(param1: MouseEvent): void {
        dispatchEvent(new class_2540(class_2540.CANCEL_CLICKED));
    }

    private function method_5229(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (this.var_3047) {
            _loc1_ = this.var_2673[this.currentState] as DisplayObject;
            if (Boolean(_loc1_) && _loc1_.visible) {
                _loc2_ = this.var_3047 as class_131;
                _loc2_.setSize(_loc1_.width, _loc1_.height);
                _loc2_.featureWindowVO.size = new class_73(_loc1_.width, _loc1_.height);
                _loc2_.method_5635();
            }
        }
    }

    public function method_2712(param1: int): void {
        var _loc2_: * = null;
        if (param1 != this.currentState) {
            for each(_loc2_ in this.var_2673) {
                _loc2_.visible = false;
            }
            (this.var_2673[param1] as DisplayObject).visible = true;
            this.currentState = param1;
            if (param1 == class_1650.const_1568 && !this.var_3047.maximized) {
                this.var_3047.maximize();
                class_82.playSoundEffect(class_126.const_2808);
            }
        }
        this.method_5229();
    }

    public function method_2439(): Boolean {
        return this.currentState == class_1650.const_1469;
    }

    public function method_3890(param1: class_1648): void {
        this.var_383.text = class_88.getItem("label_traininggrounds_victories").replace("%AMOUNT%", param1.name_121);
        this.var_1545.text = class_88.getItem("label_traininggrounds_battles").replace("%AMOUNT%", param1.name_143);
        this.var_4613.text = class_88.getItem("label_traininggrounds_rank").replace("%AMOUNT%", "");
        this.var_3820.text = param1.rank == -1 ? "-" : param1.rank.toString();
        var _loc2_: String = "none";
        if (param1.method_5052 > 0) {
            _loc2_ = "up";
        } else if (param1.method_5052 < 0) {
            _loc2_ = "down";
        }
        this.var_2256.setSkinState(_loc2_);
        this.var_1225.text = class_88.getItem("label_traininggrounds_score").replace("%AMOUNT%", class_122.round(param1.method_5956));
        this.name_134(param1);
        this.var_1608.collection = param1.name_60;
        this.var_3631.collection = param1.rewards;
        this.method_5848.list = this.var_1608;
        this.rewardsList.list = this.var_3631;
        this.method_4528.visible = this.var_3631.length > 0;
        this.method_2906.visible = !this.method_4528.visible;
        this.rewardsList.forceRedraw();
        this.method_5848.forceRedraw();
        var _loc3_: Scrollbar = FuiComponentSelectorUtil.selectComponent("tab_stats.scrollbar", this.method_6416) as Scrollbar;
        var _loc4_: ScrollContainer = FuiComponentSelectorUtil.selectComponent("tab_stats.container", this.method_6416) as ScrollContainer;
        _loc3_.updateBySizes(_loc4_.height, _loc4_.contentHeight());
        var _loc5_: Scrollbar = FuiComponentSelectorUtil.selectComponent("tab_rewards.content.scrollbar", this.method_6416) as Scrollbar;
        var _loc6_: ScrollContainer = FuiComponentSelectorUtil.selectComponent("tab_rewards.content.container", this.method_6416) as ScrollContainer;
        _loc5_.updateBySizes(_loc6_.height, _loc6_.contentHeight());
    }

    public function name_134(param1: class_1648): void {
        var _loc2_: * = null;
        if (param1.method_1545.value > 0) {
            _loc2_ = param1.method_1545.value > 60000 ? class_129.method_3157(Number(param1.method_1545.value) / 60000, true) : class_129.method_1101(Number(param1.method_1545.value) / 1000, true);
            this.var_4168.text = class_88.getItem("label_traininggrounds_season").replace("%DATE%", _loc2_).replace("%NAME%", param1.name_124);
        } else {
            this.var_4168.text = class_88.getItem("label_traininggrounds_no_season");
        }
    }

    public function method_1257(param1: int, param2: Boolean): void {
        if (param2) {
            this.var_1649.text = class_88.getItem("label_traininggrounds_opponent_found_not_ready_desc");
        } else {
            this.var_1649.text = class_88.getItem("label_traininggrounds_opponent_found_ready_desc");
        }
        this.var_1521.enabled = !param2;
        if (param1 != -1) {
            this.var_1747.gotoAndPlay(1);
            this.method_4365(param1);
        }
    }

    public function method_4803(param1: int): void {
        TweenNano.killTweensOf(this.method_4803);
        if (param1 > 0) {
            TweenNano.delayedCall(1, this.method_4803, [param1 - 1000]);
        }
        this.var_1358.text = class_129.method_1101(param1 / 1000);
    }

    private function method_4365(param1: int): void {
        TweenNano.killTweensOf(this.method_4365);
        if (param1 > 0) {
            TweenNano.delayedCall(1, this.method_4365, [param1 - 1000]);
        } else {
            this.var_1747.gotoAndStop(this.var_1747.framesLoaded);
        }
        this.var_4970.text = class_129.method_1101(param1 / 1000);
    }

    public function method_4117(param1: int, param2: Boolean): void {
        if (param1 != -1) {
            this.var_2530.gotoAndPlay(1);
            this.method_4736(param1);
        }
    }

    private function method_4736(param1: int): void {
        TweenNano.killTweensOf(this.method_4736);
        if (param1 > 0) {
            TweenNano.delayedCall(1, this.method_4736, [param1 - 1000]);
        } else {
            this.var_2530.gotoAndStop(this.var_2530.framesLoaded);
        }
        this.var_1548.text = class_129.method_1101(param1 / 1000);
    }

    public function method_2777(param1: class_1652): void {
        this.var_4802.setSize(136 * Number(param1.name_68) / Number(param1.name_57), this.var_4802.height);
        this.var_2817.setSize(136 * Number(param1.name_125) / Number(param1.name_138), this.var_2817.height);
        this.var_859.text = class_81.name_148;
        this.var_3923.setSize(136 * Number(param1.name_6) / Number(param1.name_46), this.var_3923.height);
        this.var_3923.invalidate(InvalidationType.POSITION);
        this.var_2979.setSize(136 * Number(param1.name_80) / Number(param1.name_66), this.var_2979.height);
        this.var_2979.invalidate(InvalidationType.POSITION);
        if (Boolean(param1.name_158) && param1.name_158 != "") {
            this.var_3989.text = param1.name_158;
            this.var_3989.forceRedraw(InvalidationType.TEXT);
            this.var_3989.forceRedraw(InvalidationType.POSITION);
            this.method_4803(300000);
        }
        this.var_606.mouseEnabled = false;
        this.var_606.mouseChildren = false;
        this.var_1812.mouseEnabled = false;
        this.var_1812.mouseChildren = false;
        this.var_4914.mouseEnabled = false;
        this.var_4914.mouseChildren = false;
        this.var_2090.mouseEnabled = false;
        this.var_2090.mouseChildren = false;
        this.var_606.selection = param1.name_86 >= 1;
        this.var_1812.selection = param1.name_86 >= 2;
        this.var_4914.selection = param1.name_165 >= 1;
        this.var_2090.selection = param1.name_165 >= 2;
    }

    public function method_439(param1: int): void {
        this.var_3805.text = param1.toString();
    }

    public function method_544(param1: Boolean): void {
        this.method_1257(-1, param1);
    }

    public function method_6246(param1: DisplayObject): void {
        class_215.method_5129(this.var_2314);
        var _loc2_: Number = 60 / Math.max(param1.width, param1.height);
        param1.scaleX = _loc2_;
        param1.scaleY = _loc2_;
        this.var_2314.addChild(param1);
    }

    public function method_2975(param1: DisplayObject): void {
        class_215.method_5129(this.var_3956);
        var _loc2_: Number = 60 / Math.max(param1.width, param1.height);
        param1.scaleX = _loc2_;
        param1.scaleY = _loc2_;
        this.var_3956.addChild(param1);
    }

    public function method_323(param1: String): void {
        this.var_1407.text = param1;
    }
}
}

import flash.events.MouseEvent;
import flash.utils.setTimeout;

import net.bigpoint.darkorbit.fui.components.buttons.button.Button;

import package_19.class_68;
import package_19.class_70;

class TabController {


    public const stateChanged: class_68 = new class_70(String);

    private var _selected: Button;

    function TabController(param1: Button, param2: Button, param3: Button) {
        super();
        this.addListeners(param1);
        this.addListeners(param2);
        this.addListeners(param3);
        setTimeout(this.setSelected, 1, param1);
    }

    private function setSelected(param1: Button): void {
        if (this._selected) {
            this._selected.setSkinState("normal");
            this._selected.mouseEnabled = true;
        }
        this._selected = param1;
        this._selected.setSkinState("clicked");
        this._selected.mouseEnabled = false;
    }

    private function addListeners(param1: Button): void {
        param1.addEventListener(MouseEvent.CLICK, this.handleMouseClicked);
    }

    private function handleMouseClicked(param1: MouseEvent): void {
        var _loc2_: Button = param1.target as Button;
        this.setSelected(_loc2_);
        this.stateChanged.dispatch(_loc2_.name);
    }
}

import net.bigpoint.darkorbit.fui.components.core.Coreponent;
import net.bigpoint.darkorbit.fui.components.list.itemlist.DefaultItemDataAssigner;
import net.bigpoint.darkorbit.fui.components.text.label.Label;

import package_38.class_637;

class StatsAssigner extends DefaultItemDataAssigner {


    private var _left: Label;

    private var _right: Label;

    private var _bg: Coreponent;

    function StatsAssigner() {
        super();
    }

    override public function set data(param1: Object): void {
        var _loc2_: class_637 = param1 as class_637;
        if (_loc2_) {
            this._left.text = _loc2_.name_168;
            this._right.text = _loc2_.rank.toString();
        }
        super.data = param1;
    }

    override public function set index(param1: int): void {
        super.index = param1;
        this._bg.alpha = param1 % 2 == 0 ? 1 : 0.3;
    }

    override public function assignChildren(): void {
        this._left = getChildByName("left") as Label;
        this._right = getChildByName("right") as Label;
        this._bg = getChildByName("bg") as Coreponent;
        super.assignChildren();
    }
}

import net.bigpoint.darkorbit.fui.components.core.Coreponent;
import net.bigpoint.darkorbit.fui.components.list.itemlist.DefaultItemDataAssigner;
import net.bigpoint.darkorbit.fui.components.text.label.Label;

import package_38.class_718;

class RewardsAssigner extends DefaultItemDataAssigner {


    private var _left: Label;

    private var _icon: Coreponent;

    private var _bg: Coreponent;

    function RewardsAssigner() {
        super();
    }

    override public function set data(param1: Object): void {
        var _loc2_: class_718 = param1 as class_718;
        if (_loc2_) {
            tooltipTemplateID = "rewardToolTip";
            tooltipDataAssigner = new RewardsToolTipAssigner();
            tooltipData = _loc2_.items;
            this._left.text = _loc2_.range;
        }
        super.data = param1;
    }

    override public function set index(param1: int): void {
        super.index = param1;
        this._bg.alpha = param1 % 2 == 0 ? 1 : 0.3;
    }

    override public function assignChildren(): void {
        this._left = getChildByName("left") as Label;
        this._icon = getChildByName("infoIcon") as Coreponent;
        this._bg = getChildByName("bg") as Coreponent;
        super.assignChildren();
    }
}

import net.bigpoint.darkorbit.fui.components.core.data.VectorCollection;
import net.bigpoint.darkorbit.fui.components.list.itemlist.ItemList;
import net.bigpoint.darkorbit.fui.components.tooltip.DefaultTooltipDataAssigner;
import net.bigpoint.darkorbit.fui.system.utils.FuiComponentSelectorUtil;

class RewardsToolTipAssigner extends DefaultTooltipDataAssigner {


    private var _list: ItemList;

    function RewardsToolTipAssigner() {
        super();
    }

    override public function assign(): void {
        this._list = FuiComponentSelectorUtil.selectComponent("wrapper.list", target) as ItemList;
        this._list.itemDataAssigner = ToolTipListAssigner;
        this._list.list = new VectorCollection(data);
        super.assign();
    }
}

import com.bigpoint.utils.class_122;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.filters.BitmapFilterQuality;
import flash.filters.GlowFilter;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.fui.components.list.itemlist.DefaultItemDataAssigner;
import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
import net.bigpoint.darkorbit.mvc.common.utils.TextUtils;

import package_11.class_65;

import package_17.class_62;

import package_38.class_117;
import package_38.class_533;
import package_38.class_563;

class ToolTipListAssigner extends DefaultItemDataAssigner {

    private static const FILTERS: Array = [new GlowFilter(16769536, 0.7, 1, 1, 6, BitmapFilterQuality.HIGH)];


    private var _clipContainer: Bitmap;

    private var _assetsProxy: AssetsProxy;

    private var _resKey: String;

    function ToolTipListAssigner() {
        this._clipContainer = new Bitmap();
        super();
    }

    override public function set data(param1: Object): void {
        var _loc3_: * = null;
        var _loc2_: class_563 = param1 as class_563;
        if (_loc2_) {
            label.text = class_122.method_98(_loc2_.amount) + "x  " + TextUtils.getTranslationByType(_loc2_.lootId, class_117.const_2693);
            this._resKey = _loc2_.lootId.split("_").pop();
            if (this._resKey) {
                this._resKey += "_30x30";
                this.assetsProxy.load(this._resKey, this.handleAssetLoaded, this.handleError, AssetsProxy.ITEMS);
            }
        } else {
            _loc3_ = param1 as class_533;
            if (_loc3_) {
                this.setIcon(this.assetsProxy.getBitmapData("traininggroundsUI", "title_icon"));
                label.text = class_88.method_734("achievements", _loc3_.titleKey);
            }
        }
        super.data = param1;
    }

    private function handleAssetLoaded(param1: class_65): void {
        this.setIcon(param1.getBitmap().bitmapData);
    }

    private function setIcon(param1: BitmapData): void {
        this._clipContainer.bitmapData = param1;
        this._clipContainer.y = Number(this.height) * 0.5 - Number(this._clipContainer.height) * 0.5;
    }

    private function handleError(param1: *): void {
    }

    override public function set index(param1: int): void {
        super.index = param1;
    }

    override public function assignChildren(): void {
        super.assignChildren();
        this._clipContainer.x = 5;
        addChild(this._clipContainer);
    }

    private function get assetsProxy(): AssetsProxy {
        if (!this._assetsProxy) {
            this._assetsProxy = class_62.getInstance().retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
        }
        return this._assetsProxy;
    }

    override public function dispose(): void {
        this._clipContainer.bitmapData = null;
        this.assetsProxy.getFileCollectionByInstanceName(AssetsProxy.ITEMS).method_2379(this._resKey, this.handleAssetLoaded);
        super.dispose();
    }
}
