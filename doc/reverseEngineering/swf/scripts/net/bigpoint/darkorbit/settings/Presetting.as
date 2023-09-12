package net.bigpoint.darkorbit.settings {

import package_30.class_1551;

public class Presetting {


    public var setQualityHigh: Array;

    public var setQualityGood: Array;

    public var setQualityMedium: Array;

    public var setQualityLow: Array;

    public function Presetting(param1: Boolean = false) {
        super();
        this.setQualityHigh = [];
        this.setQualityHigh.push(new PresettingItem(class_1551.const_1443, param1 ? 0 : Settings.QUALITY_GOOD));
        this.setQualityHigh.push(new PresettingItem(class_1551.const_520, Settings.QUALITY_HIGH));
        this.setQualityHigh.push(new PresettingItem(class_1551.const_1879, Settings.QUALITY_HIGH));
        this.setQualityHigh.push(new PresettingItem(class_1551.const_1788, Settings.QUALITY_HIGH));
        this.setQualityHigh.push(new PresettingItem(class_1551.const_3225, Settings.QUALITY_HIGH));
        this.setQualityHigh.push(new PresettingItem(class_1551.const_43, Settings.QUALITY_HIGH));
        this.setQualityGood = [];
        this.setQualityGood.push(new PresettingItem(class_1551.const_1443, Settings.QUALITY_GOOD));
        this.setQualityGood.push(new PresettingItem(class_1551.const_520, Settings.QUALITY_HIGH));
        this.setQualityGood.push(new PresettingItem(class_1551.const_1879, Settings.QUALITY_HIGH));
        this.setQualityGood.push(new PresettingItem(class_1551.const_1788, Settings.QUALITY_GOOD));
        this.setQualityGood.push(new PresettingItem(class_1551.const_3225, Settings.QUALITY_HIGH));
        this.setQualityGood.push(new PresettingItem(class_1551.const_43, Settings.QUALITY_MEDIUM));
        this.setQualityMedium = [];
        this.setQualityMedium.push(new PresettingItem(class_1551.const_1443, Settings.QUALITY_MEDIUM));
        this.setQualityMedium.push(new PresettingItem(class_1551.const_520, Settings.QUALITY_MEDIUM));
        this.setQualityMedium.push(new PresettingItem(class_1551.const_1879, Settings.QUALITY_LOW));
        this.setQualityMedium.push(new PresettingItem(class_1551.const_1788, Settings.QUALITY_MEDIUM));
        this.setQualityMedium.push(new PresettingItem(class_1551.const_3225, Settings.QUALITY_LOW));
        this.setQualityMedium.push(new PresettingItem(class_1551.const_43, Settings.QUALITY_MEDIUM));
        this.setQualityLow = [];
        this.setQualityLow.push(new PresettingItem(class_1551.const_1443, Settings.QUALITY_LOW));
        this.setQualityLow.push(new PresettingItem(class_1551.const_520, Settings.QUALITY_LOW));
        this.setQualityLow.push(new PresettingItem(class_1551.const_1879, Settings.QUALITY_LOW));
        this.setQualityLow.push(new PresettingItem(class_1551.const_1788, Settings.QUALITY_LOW));
        this.setQualityLow.push(new PresettingItem(class_1551.const_3225, Settings.QUALITY_LOW));
        this.setQualityLow.push(new PresettingItem(class_1551.const_43, Settings.QUALITY_LOW));
    }

    public function getQualitySet(param1: int): Array {
        var _loc2_: * = null;
        switch (param1) {
            case Settings.QUALITY_LOW:
                _loc2_ = this.setQualityLow;
                break;
            case Settings.QUALITY_MEDIUM:
                _loc2_ = this.setQualityMedium;
                break;
            case Settings.QUALITY_GOOD:
                _loc2_ = this.setQualityGood;
                break;
            case Settings.QUALITY_HIGH:
            default:
                _loc2_ = this.setQualityHigh;
        }
        return _loc2_;
    }
}
}
