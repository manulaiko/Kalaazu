package package_166 {

import com.bigpoint.utils.class_129;

import flash.events.MouseEvent;

import mx.controls.ProgressBar;
import mx.events.PropertyChangeEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;

import package_150.class_988;

import package_163.class_1018;

import spark.components.Button;
import spark.components.Label;
import spark.components.SkinnableContainer;

public class class_1025 extends SkinnableContainer {


    private var var_3411: Label;

    private var var_1012: class_1542;

    private var var_1841: class_1542;

    private var var_2485: class_1542;

    private var var_4686: class_1542;

    private var var_4977: class_1542;

    private var var_3620: class_1542;

    private var var_2637: Label;

    private var var_364: Label;

    private var var_4724: Label;

    private var var_645: ProgressBar;

    private var var_1749: Label;

    private var var_3528: Label;

    private var var_3861: Button;

    private var var_1523: class_1018;

    protected var var_2678: String;

    public function class_1025() {
        super();
    }

    protected function handleCreationComplete(): void {
        callLater(this.method_6363);
    }

    private function method_6363(): void {
        this.ratingsTitleLabel.text = class_88.getItem("label_bswin_station_ratings");
        this.attackRating.init("attack_icon", "tooltip_ratings_attack");
        this.defenceRating.init("defense_icon", "tooltip_ratings_defense");
        this.repairRating.init("repair_icon", "tooltip_ratings_repair");
        this.honourRating.init("honor_icon", "tooltip_ratings_honor");
        this.epRating.init("booster_icon", "tooltip_ratings_ep_booster");
        this.damageBoosterRating.init("damage_icon", "tooltip_ratings_damage_booster");
        this.deflectorStatusTitle.text = class_88.getItem("label_bswin_deflector_status");
        this.deflectorTimeLabel.text = class_88.getItem("label_bswin_deflector_time");
        this.deflectorTimeRegRateLabel.text = class_88.getItem("label_bswin_deflector_reg_rate");
        this.deflectorToggleButton.label = class_88.getItem("btn_bswin_deactivate_deflector");
        this._regenerationTooltipText = class_88.getItem("tooltip_deflector_status");
    }

    public function method_475(param1: Boolean, param2: Number, param3: Number, param4: Number): void {
        this.deflectorTimeProgressBar.setProgress(param2, param3);
        this.deflectorTimeValue.text = class_129.method_1101(param2);
        var _loc5_: String = class_88.getItem("abbreviation_minutes").replace("%VALUE%", param4);
        this.deflectorTimeRegRateValue.text = "+" + _loc5_ + " / " + class_88.getItem("abbreviation_hours").replace("%VALUE%", "");
        if (param1 == false && param4 == 0) {
            this.method_3077 = false;
        }
    }

    protected function method_472(param1: MouseEvent): void {
        dispatchEvent(new class_988(class_988.SHOW_DEFLECTOR_DEACTIVATION_POPUP));
    }

    public function set method_5495(param1: class_1018): void {
        this.var_1523 = param1;
        this.attackRating.value = this.var_1523.attackRating;
        this.defenceRating.value = this.var_1523.defenceRating;
        this.repairRating.value = this.var_1523.repairRating;
        this.honourRating.value = this.var_1523.var_5034;
        this.epRating.value = this.var_1523.var_1627;
        this.damageBoosterRating.value = this.var_1523.damageBoosterRating;
        this.method_475(this.var_1523.name_65, this.var_1523.method_6431.name_103, this.var_1523.method_6431.name_83, this.var_1523.name_142);
        this.deflectorTimeValue.text = class_129.method_1101(this.var_1523.method_6431.name_103);
        this.deflectorToggleButton.enabled = this.var_1523.name_65;
    }

    private function set method_3077(param1: Boolean): void {
        this.deflectorTimeProgressBar.enabled = param1;
        this.deflectorTimeValue.enabled = param1;
        this.deflectorTimeRegRateValue.enabled = param1;
        this.deflectorTimeLabel.alpha = this.deflectorTimeProgressBar.alpha = this.deflectorTimeValue.alpha = this.deflectorTimeRegRateLabel.alpha = this.deflectorTimeRegRateValue.alpha = param1 ? 1 : 0.3;
    }

    public function get method_5495(): class_1018 {
        return this.var_1523;
    }

    [Bindable(event="propertyChange")]
    public function get ratingsTitleLabel(): Label {
        return this.var_3411;
    }

    public function set ratingsTitleLabel(param1: Label): void {
        var _loc2_: Object = this.var_3411;
        if (_loc2_ !== param1) {
            this.var_3411 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ratingsTitleLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get attackRating(): class_1542 {
        return this.var_1012;
    }

    public function set attackRating(param1: class_1542): void {
        var _loc2_: Object = this.var_1012;
        if (_loc2_ !== param1) {
            this.var_1012 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attackRating", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get defenceRating(): class_1542 {
        return this.var_1841;
    }

    public function set defenceRating(param1: class_1542): void {
        var _loc2_: Object = this.var_1841;
        if (_loc2_ !== param1) {
            this.var_1841 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "defenceRating", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get repairRating(): class_1542 {
        return this.var_2485;
    }

    public function set repairRating(param1: class_1542): void {
        var _loc2_: Object = this.var_2485;
        if (_loc2_ !== param1) {
            this.var_2485 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "repairRating", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get honourRating(): class_1542 {
        return this.var_4686;
    }

    public function set honourRating(param1: class_1542): void {
        var _loc2_: Object = this.var_4686;
        if (_loc2_ !== param1) {
            this.var_4686 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "honourRating", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get epRating(): class_1542 {
        return this.var_4977;
    }

    public function set epRating(param1: class_1542): void {
        var _loc2_: Object = this.var_4977;
        if (_loc2_ !== param1) {
            this.var_4977 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "epRating", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get damageBoosterRating(): class_1542 {
        return this.var_3620;
    }

    public function set damageBoosterRating(param1: class_1542): void {
        var _loc2_: Object = this.var_3620;
        if (_loc2_ !== param1) {
            this.var_3620 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "damageBoosterRating", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get deflectorStatusTitle(): Label {
        return this.var_2637;
    }

    public function set deflectorStatusTitle(param1: Label): void {
        var _loc2_: Object = this.var_2637;
        if (_loc2_ !== param1) {
            this.var_2637 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "deflectorStatusTitle", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get deflectorTimeLabel(): Label {
        return this.var_364;
    }

    public function set deflectorTimeLabel(param1: Label): void {
        var _loc2_: Object = this.var_364;
        if (_loc2_ !== param1) {
            this.var_364 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "deflectorTimeLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get deflectorTimeValue(): Label {
        return this.var_4724;
    }

    public function set deflectorTimeValue(param1: Label): void {
        var _loc2_: Object = this.var_4724;
        if (_loc2_ !== param1) {
            this.var_4724 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "deflectorTimeValue", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get deflectorTimeProgressBar(): ProgressBar {
        return this.var_645;
    }

    public function set deflectorTimeProgressBar(param1: ProgressBar): void {
        var _loc2_: Object = this.var_645;
        if (_loc2_ !== param1) {
            this.var_645 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "deflectorTimeProgressBar", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get deflectorTimeRegRateLabel(): Label {
        return this.var_1749;
    }

    public function set deflectorTimeRegRateLabel(param1: Label): void {
        var _loc2_: Object = this.var_1749;
        if (_loc2_ !== param1) {
            this.var_1749 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "deflectorTimeRegRateLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get deflectorTimeRegRateValue(): Label {
        return this.var_3528;
    }

    public function set deflectorTimeRegRateValue(param1: Label): void {
        var _loc2_: Object = this.var_3528;
        if (_loc2_ !== param1) {
            this.var_3528 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "deflectorTimeRegRateValue", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get deflectorToggleButton(): Button {
        return this.var_3861;
    }

    public function set deflectorToggleButton(param1: Button): void {
        var _loc2_: Object = this.var_3861;
        if (_loc2_ !== param1) {
            this.var_3861 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "deflectorToggleButton", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get _regenerationTooltipText(): String {
        return this.var_2678;
    }

    protected function set _regenerationTooltipText(param1: String): void {
        var _loc2_: Object = this.var_2678;
        if (_loc2_ !== param1) {
            this.var_2678 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_regenerationTooltipText", _loc2_, param1));
            }
        }
    }
}
}
