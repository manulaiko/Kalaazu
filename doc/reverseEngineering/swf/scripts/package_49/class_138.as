package package_49 {

import flash.display.MovieClip;

import mx.collections.ArrayList;
import mx.events.PropertyChangeEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.mvc.common.view.components.DOViewContainerBase;
import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;

import package_11.class_39;

import package_145.class_983;

import package_146.QuestGiverWindowMediator;

import package_147.class_984;

import package_148.class_985;

import package_17.class_62;

import package_65.class_203;

import package_80.QuestProxy;

import package_9.ResourceManager;

import spark.components.Group;
import spark.components.Image;
import spark.components.Label;
import spark.components.List;
import spark.components.TabBar;
import spark.core.SpriteVisualElement;
import spark.events.IndexChangeEvent;
import spark.primitives.BitmapImage;

public class class_138 extends DOWindow {


    public var var_3957: ArrayList;

    public var var_3267: ArrayList;

    private var var_2274: ArrayList;

    private var var_1411: List;

    private var var_3295: SpriteVisualElement;

    private var var_2363: BitmapImage;

    private var var_3349: DOViewContainerBase;

    private var var_1964: DOViewContainerBase;

    private var var_388: Label;

    private var var_1731: Label;

    private var var_2173: Label;

    private var var_2932: class_983;

    private var var_1657: class_984;

    private var var_2215: TabBar;

    private var var_793: Image;

    private var var_2999: Image;

    private var var_440: Image;

    private var var_2389: Group;

    private var var_1813: Image;

    private var var_753: Image;

    private var var_819: Group;

    private var var_4078: MovieClip;

    private var var_328: String;

    public function class_138() {
        this.var_2274 = new ArrayList();
        super();
    }

    public function handleCreationComplete(): void {
        this.var_4078 = ResourceManager.getMovieClip("questWin", "questgiver_frame");
        this.questGiverImageContainer.addChild(this.var_4078);
        this.method_614();
        title = class_88.getItem("title_questwin");
        this.var_3957 = new ArrayList([{"label": class_88.getItem("tab_questwin_missions")}, {"label": class_88.getItem("tab_questwin_challenges")}, {"label": class_88.getItem("tab_questwin_daily_missions")}, {"label": class_88.getItem("tab_questwin_event_missions")}]);
        this.var_3267 = new ArrayList([{"label": class_88.getItem("tab_questwin_starter_missions")}]);
        this.tabList = this.var_3957;
        this.noAvailableQuestsMessage.text = class_88.getItem("title_questwin_no_quests_available");
        this.noAvailableQuestsMessageDescription.text = class_88.getItem("desc_questwin_no_quests_available_NYX");
        this.noAvailableQuestListMessage.text = class_88.getItem("label_questwin_no_quests_available");
        this.method_738(new IndexChangeEvent(IndexChangeEvent.CHANGE, false, false, -1, 0));
    }

    public function method_614(): void {
        var _loc4_: * = null;
        if (this.var_4078 == null) {
            return;
        }
        var _loc1_: class_203 = QuestProxy(class_62.getInstance().retrieveProxy(QuestProxy.NAME)).selectedQuest;
        var _loc2_: Vector.<String> = new Vector.<String>();
        if (Boolean(_loc1_) && Boolean(_loc1_.name_19)) {
            _loc2_.push(_loc1_.name_19);
            _loc2_.push(_loc1_.name_19 + "_" + class_81.method_2322);
            _loc2_.push(class_126.getInstance().method_2408(_loc1_.id));
        } else {
            _loc2_.push(class_126.getInstance().method_2408());
        }
        var _loc3_: class_39 = ResourceManager.name_15.getFinisher("questWin") as class_39;
        var _loc5_: int = 0;
        while (_loc5_ < _loc2_.length) {
            _loc4_ = _loc2_[_loc5_];
            if (_loc3_.hasEmbeddedObject(_loc4_)) {
                break;
            }
            _loc5_++;
        }
        if (_loc4_ == this.var_328) {
            return;
        }
        this.var_328 = _loc4_;
        while (this.var_4078.content.numChildren) {
            this.var_4078.content.removeChildAt(0);
        }
        if (_loc3_.hasEmbeddedObject(_loc4_)) {
            this.var_4078.content.addChild(_loc3_.getEmbeddedMovieClip(_loc4_));
        }
        if (_loc4_ == "nyx_portrait") {
            this.questGiverPortraitNameText.source = ResourceManager.getBitmap("questWin", "nyx_name_label_fancy");
        } else {
            this.questGiverPortraitNameText.source = null;
        }
    }

    public function method_5248(param1: Boolean): void {
        this.noQuestListMessageContainer.visible = param1;
        this.noQuestsMessageContainer.visible = param1;
    }

    public function init(param1: ArrayList): void {
        this.questList.dataProvider = param1;
    }

    public function method_4252(param1: int): void {
    }

    public function method_4441(param1: int): void {
    }

    public function method_3437(param1: int): void {
    }

    public function method_3061(param1: int): void {
    }

    protected function method_738(param1: IndexChangeEvent): void {
        if (param1.newIndex == QuestGiverWindowMediator.const_2824 || param1.newIndex == QuestGiverWindowMediator.const_2978) {
            this.questWindowQuestSection.questsLeft.visible = true;
        } else {
            this.questWindowQuestSection.questsLeft.visible = false;
        }
        if (param1.newIndex == QuestGiverWindowMediator.const_1079) {
            this.questStateFilters.visible = false;
            this.challengeStateFilters.visible = true;
        } else {
            this.questStateFilters.visible = true;
            this.challengeStateFilters.visible = false;
        }
        if (param1.newIndex == QuestGiverWindowMediator.const_2978) {
            this.noAvailableQuestsMessageDescription.text = class_88.getItem("desc_questwin_no_event_quests_available_NYX");
        } else {
            this.noAvailableQuestsMessageDescription.text = class_88.getItem("desc_questwin_no_quests_available_NYX");
        }
        if (param1.oldIndex == param1.newIndex) {
            return;
        }
        dispatchEvent(new class_985(class_985.TAB_CHANGED, param1.newIndex, true));
    }

    [Bindable(event="propertyChange")]
    public function get tabList(): ArrayList {
        return this.var_2274;
    }

    public function set tabList(param1: ArrayList): void {
        var _loc2_: Object = this.var_2274;
        if (_loc2_ !== param1) {
            this.var_2274 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabList", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get questList(): List {
        return this.var_1411;
    }

    public function set questList(param1: List): void {
        var _loc2_: Object = this.var_1411;
        if (_loc2_ !== param1) {
            this.var_1411 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questList", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get questGiverImageContainer(): SpriteVisualElement {
        return this.var_3295;
    }

    public function set questGiverImageContainer(param1: SpriteVisualElement): void {
        var _loc2_: Object = this.var_3295;
        if (_loc2_ !== param1) {
            this.var_3295 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questGiverImageContainer", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get questGiverPortraitNameText(): BitmapImage {
        return this.var_2363;
    }

    public function set questGiverPortraitNameText(param1: BitmapImage): void {
        var _loc2_: Object = this.var_2363;
        if (_loc2_ !== param1) {
            this.var_2363 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questGiverPortraitNameText", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get noQuestListMessageContainer(): DOViewContainerBase {
        return this.var_3349;
    }

    public function set noQuestListMessageContainer(param1: DOViewContainerBase): void {
        var _loc2_: Object = this.var_3349;
        if (_loc2_ !== param1) {
            this.var_3349 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "noQuestListMessageContainer", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get noQuestsMessageContainer(): DOViewContainerBase {
        return this.var_1964;
    }

    public function set noQuestsMessageContainer(param1: DOViewContainerBase): void {
        var _loc2_: Object = this.var_1964;
        if (_loc2_ !== param1) {
            this.var_1964 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "noQuestsMessageContainer", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get noAvailableQuestsMessage(): Label {
        return this.var_388;
    }

    public function set noAvailableQuestsMessage(param1: Label): void {
        var _loc2_: Object = this.var_388;
        if (_loc2_ !== param1) {
            this.var_388 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "noAvailableQuestsMessage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get noAvailableQuestsMessageDescription(): Label {
        return this.var_1731;
    }

    public function set noAvailableQuestsMessageDescription(param1: Label): void {
        var _loc2_: Object = this.var_1731;
        if (_loc2_ !== param1) {
            this.var_1731 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "noAvailableQuestsMessageDescription", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get noAvailableQuestListMessage(): Label {
        return this.var_2173;
    }

    public function set noAvailableQuestListMessage(param1: Label): void {
        var _loc2_: Object = this.var_2173;
        if (_loc2_ !== param1) {
            this.var_2173 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "noAvailableQuestListMessage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get questWindowQuestSection(): class_983 {
        return this.var_2932;
    }

    public function set questWindowQuestSection(param1: class_983): void {
        var _loc2_: Object = this.var_2932;
        if (_loc2_ !== param1) {
            this.var_2932 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questWindowQuestSection", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get questWindowChallengesSection(): class_984 {
        return this.var_1657;
    }

    public function set questWindowChallengesSection(param1: class_984): void {
        var _loc2_: Object = this.var_1657;
        if (_loc2_ !== param1) {
            this.var_1657 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questWindowChallengesSection", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get mainTabBar(): TabBar {
        return this.var_2215;
    }

    public function set mainTabBar(param1: TabBar): void {
        var _loc2_: Object = this.var_2215;
        if (_loc2_ !== param1) {
            this.var_2215 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainTabBar", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get availableDesc(): Image {
        return this.var_793;
    }

    public function set availableDesc(param1: Image): void {
        var _loc2_: Object = this.var_793;
        if (_loc2_ !== param1) {
            this.var_793 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "availableDesc", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get unavailableDesc(): Image {
        return this.var_2999;
    }

    public function set unavailableDesc(param1: Image): void {
        var _loc2_: Object = this.var_2999;
        if (_loc2_ !== param1) {
            this.var_2999 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "unavailableDesc", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get completedDesc(): Image {
        return this.var_440;
    }

    public function set completedDesc(param1: Image): void {
        var _loc2_: Object = this.var_440;
        if (_loc2_ !== param1) {
            this.var_440 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "completedDesc", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get questStateFilters(): Group {
        return this.var_2389;
    }

    public function set questStateFilters(param1: Group): void {
        var _loc2_: Object = this.var_2389;
        if (_loc2_ !== param1) {
            this.var_2389 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questStateFilters", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get notYetDoneDesc(): Image {
        return this.var_1813;
    }

    public function set notYetDoneDesc(param1: Image): void {
        var _loc2_: Object = this.var_1813;
        if (_loc2_ !== param1) {
            this.var_1813 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "notYetDoneDesc", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get doneDesc(): Image {
        return this.var_753;
    }

    public function set doneDesc(param1: Image): void {
        var _loc2_: Object = this.var_753;
        if (_loc2_ !== param1) {
            this.var_753 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "doneDesc", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get challengeStateFilters(): Group {
        return this.var_819;
    }

    public function set challengeStateFilters(param1: Group): void {
        var _loc2_: Object = this.var_819;
        if (_loc2_ !== param1) {
            this.var_819 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "challengeStateFilters", _loc2_, param1));
            }
        }
    }
}
}
