package package_149 {

import com.greensock.TweenLite;

import flash.display.BitmapData;
import flash.events.MouseEvent;
import flash.geom.Rectangle;

import flashx.textLayout.conversion.TextConverter;

import mx.events.PropertyChangeEvent;

import net.bigpoint.darkorbit.mvc.questWindow.model.vo.QuestListItemVO;

import package_148.class_985;

import package_38.class_861;

import package_9.ResourceManager;

import spark.components.RichText;

public class class_1509 extends class_1508 {


    private var var_2949: QuestListItemVO;

    private var var_1958: BitmapData;

    private var var_878: BitmapData;

    private var var_1077: BitmapData;

    private var var_314: BitmapData;

    private var var_2276: BitmapData;

    private var var_5010: BitmapData;

    private var var_2620: BitmapData;

    private var var_3053: Rectangle;

    private var var_3777: RichText;

    public function class_1509() {
        super();
        this._normalBitmapData = ResourceManager.getBitmapData("questWin", "quest_list_item_normal");
        this.var_878 = ResourceManager.getBitmapData("questWin", "quest_list_item_selected");
        this.var_1077 = ResourceManager.getBitmapData("questWin", "quest_list_item_disabled");
        this.var_5010 = ResourceManager.getBitmapData("questWin", "quest_list_item_completed");
        this.var_314 = ResourceManager.getBitmapData("questWin", "quest_list_item_rollover");
        this.var_2276 = ResourceManager.getBitmapData("questWin", "quest_list_item_in_progress");
        this.var_2620 = ResourceManager.getBitmapData("questWin", "quest_list_item_locked");
        mouseChildren = false;
        buttonMode = true;
    }

    private function init(): void {
        var _loc1_: Number = NaN;
        var _loc2_: Number = NaN;
        this.var_3777 = questAdditionalInfo;
        this._normalBitmapData = ResourceManager.getBitmapData("questWin", "quest_list_item_normal");
        questNameLabel.textFlow = TextConverter.importToFlow(this.var_2949.method_4615, TextConverter.TEXT_FIELD_HTML_FORMAT);
        if (this.var_2949.questListHTMLaddon != null && this.var_2949.questListHTMLaddon != "") {
            if (questAdditionalInfo) {
                questAdditionalInfo.textFlow = TextConverter.importToFlow(this.var_2949.questListHTMLaddon, TextConverter.TEXT_FIELD_HTML_FORMAT);
                if (!textsContainer.containsElement(this.var_3777)) {
                    textsContainer.addElement(this.var_3777);
                }
            }
        } else if (questAdditionalInfo != null && Boolean(textsContainer.containsElement(this.var_3777))) {
            textsContainer.removeElement(this.var_3777);
        }
        if (Boolean(this.var_2949.acceptable) || Boolean(this.var_2949.completed) || Boolean(this.var_2949.method_1333())) {
            _loc1_ = 0;
        } else {
            _loc1_ = 1;
        }
        TweenLite.to(disabledImage, !this.var_2949.acceptable ? 0.4 : 0, {"alpha": _loc1_});
        if (Boolean(this.var_2949.completed) && !this.var_2949.type.method_6399(class_861.const_1515)) {
            _loc2_ = 1;
        } else {
            _loc2_ = 0;
        }
        TweenLite.to(completedImage, !!this.var_2949.completed ? 0.4 : 0, {"alpha": _loc2_});
        TweenLite.to(selectedImage, !!this.var_2949.method_1333() ? 0.4 : 0, {"alpha": int(this.var_2949.method_1333())});
        if (_loc1_ > 0) {
            rollOverGlowImage.source = this.var_2620;
        } else if (this.var_2949.method_1333()) {
            rollOverGlowImage.source = this.var_2276;
        } else {
            rollOverGlowImage.source = this.var_314;
        }
        questTypeIcon.source = ResourceManager.getBitmap("questWin", this.var_2949.questMainTypeIcon);
        toolTip = this.var_2949.questTitle;
    }

    override protected function creationCompleteHandler(): void {
        super.creationCompleteHandler();
        this._scale9Rect = new Rectangle(15, 17, 1, 1);
        backgroundImage.source = this._normalBitmapData;
        selectedImage.source = this.var_878;
        disabledImage.source = this.var_1077;
        if (true) {
            rollOverGlowImage.source = this.var_314;
        }
        inProgressGlowImage.source = this.var_2276;
        completedImage.source = this.var_5010;
        lockedGlowImage.source = this.var_2620;
        backgroundImage.scale9Grid = selectedImage.scale9Grid = rollOverGlowImage.scale9Grid = inProgressGlowImage.scale9Grid = disabledImage.scale9Grid = completedImage.scale9Grid = lockedGlowImage.scale9Grid = this._scale9Rect;
    }

    override protected function clickHandler(param1: MouseEvent): void {
        super.clickHandler(param1);
        var _loc2_: class_985 = new class_985(class_985.GET_DETAILED_QUEST_INFO, true);
        _loc2_.questID = this.var_2949.questID;
        _loc2_.rootCaseID = this.var_2949.rootCaseID;
        dispatchEvent(_loc2_);
    }

    override protected function rollHandler(param1: MouseEvent): void {
        TweenLite.to(rollOverGlowImage, 0.3, {"alpha": int(param1.type == MouseEvent.ROLL_OVER)});
    }

    override protected function method_31(): void {
        backgroundImage.scale9Grid = this._scale9Rect;
        inProgressGlowImage.scale9Grid = this._scale9Rect;
        rollOverGlowImage.scale9Grid = this._scale9Rect;
    }

    public function set questListItemVO(param1: QuestListItemVO): void {
        this.var_2949 = param1;
        this.init();
        this.creationCompleteHandler();
    }

    public function get questListItemVO(): QuestListItemVO {
        return this.var_2949;
    }

    [Bindable(event="propertyChange")]
    private function get _normalBitmapData(): BitmapData {
        return this.var_1958;
    }

    private function set _normalBitmapData(param1: BitmapData): void {
        var _loc2_: Object = this.var_1958;
        if (_loc2_ !== param1) {
            this.var_1958 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_normalBitmapData", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _scale9Rect(): Rectangle {
        return this.var_3053;
    }

    private function set _scale9Rect(param1: Rectangle): void {
        var _loc2_: Object = this.var_3053;
        if (_loc2_ !== param1) {
            this.var_3053 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_scale9Rect", _loc2_, param1));
            }
        }
    }
}
}
