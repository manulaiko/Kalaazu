package net.bigpoint.darkorbit.fui.builder.xml.creators.skins {

import flash.display.DisplayObject;
import flash.utils.Dictionary;

import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.fui.builder.repository.SkinRepository;
import net.bigpoint.darkorbit.fui.builder.xml.creators.AbstractCreator;
import net.bigpoint.darkorbit.fui.builder.xml.factories.SkinLayerFactory;
import net.bigpoint.darkorbit.fui.components.bars.skins.ProgressBarSkin;
import net.bigpoint.darkorbit.fui.components.buttons.button.ButtonSkin;
import net.bigpoint.darkorbit.fui.components.buttons.button.FadableButtonSkin;
import net.bigpoint.darkorbit.fui.components.buttons.checkbox.CheckBoxSkin;
import net.bigpoint.darkorbit.fui.components.buttons.radio.RadioButtonSkin;
import net.bigpoint.darkorbit.fui.components.buttons.toggle.ToggleButtonSkin;
import net.bigpoint.darkorbit.fui.components.core.skins.BasicSkin;
import net.bigpoint.darkorbit.fui.components.core.skins.BasicStateSkin;
import net.bigpoint.darkorbit.fui.components.core.skins.ISkin;
import net.bigpoint.darkorbit.fui.components.core.skins.SkinLayerNames;
import net.bigpoint.darkorbit.fui.components.core.skins.layers.ISkinLayer;
import net.bigpoint.darkorbit.fui.components.text.RichTextSkin;
import net.bigpoint.darkorbit.fui.components.text.input.InputSkin;
import net.bigpoint.darkorbit.fui.components.text.label.LabelSkin;

public class SkinCreator extends AbstractCreator {

    protected static var CLASSNAME_CONTAINER_SKIN: String = "ContainerSkin";

    protected static var CLASSNAME_WINDOW_SKIN: String = "WindowSkin";

    protected static var CLASSNAME_BASIC_SKIN: String = "BasicSkin";

    protected static var CLASSNAME_BASIC_STATE_SKIN: String = "BasicStateSkin";

    protected static var CLASSNAME_BUTTON_BITMAP_SKIN: String = "ButtonSkin";

    protected static var CLASSNAME_FADEABLE_BUTTON_BITMAP_SKIN: String = "FadableButtonSkin";

    protected static var CLASSNAME_TOGGLE_BUTTON_BITMAP_SKIN: String = "ToggleButtonSkin";

    protected static var CLASSNAME_CHECKBOX_BITMAP_SKIN: String = "CheckBoxSkin";

    protected static var CLASSNAME_RADIOBUTTON_BITMAP_SKIN: String = "RadioButtonSkin";

    protected static var CLASSNAME_TEXT_LABEL_SKIN: String = "LabelSkin";

    protected static var CLASSNAME_TEXT_INPUT_SKIN: String = "InputSkin";

    protected static var CLASSNAME_TEXT_RICHTEXT_SKIN: String = "RichTextSkin";

    protected static var CLASSNAME_PROGRESS_BAR_SKIN: String = "ProgressBarSkin";

    protected static var skinMap: Dictionary;


    public function SkinCreator() {
        super();
        initialize();
    }

    protected static function initialize(): void {
        initSkinMapping();
    }

    protected static function initSkinMapping(): void {
        if (skinMap == null) {
            skinMap = new Dictionary();
            skinMap[CLASSNAME_CONTAINER_SKIN] = createContainerSkin;
            skinMap[CLASSNAME_WINDOW_SKIN] = createContainerSkin;
            skinMap[CLASSNAME_BASIC_SKIN] = createContainerSkin;
            skinMap[CLASSNAME_BASIC_STATE_SKIN] = createContainerStateSkin;
            skinMap[CLASSNAME_BUTTON_BITMAP_SKIN] = createButtonSkin;
            skinMap[CLASSNAME_TOGGLE_BUTTON_BITMAP_SKIN] = createToggleButtonSkin;
            skinMap[CLASSNAME_FADEABLE_BUTTON_BITMAP_SKIN] = createFadableButtonSkin;
            skinMap[CLASSNAME_CHECKBOX_BITMAP_SKIN] = createCheckboxSkin;
            skinMap[CLASSNAME_RADIOBUTTON_BITMAP_SKIN] = createRadioButtonSkin;
            skinMap[CLASSNAME_TEXT_LABEL_SKIN] = createLabelSkin;
            skinMap[CLASSNAME_TEXT_INPUT_SKIN] = createInputSkin;
            skinMap[CLASSNAME_TEXT_RICHTEXT_SKIN] = createRichTextSkin;
            skinMap[CLASSNAME_PROGRESS_BAR_SKIN] = createProgressBarSkin;
        }
    }

    protected static function createContainerSkin(param1: XML): void {
        var _loc2_: ISkin = new BasicSkin();
        assignSkinStates(param1, _loc2_);
    }

    protected static function createContainerStateSkin(param1: XML): void {
        var _loc2_: ISkin = new BasicStateSkin();
        assignStateNames(param1, _loc2_);
        assignSkinStates(param1, _loc2_);
    }

    protected static function createProgressBarSkin(param1: XML): void {
        var _loc2_: ISkin = new ProgressBarSkin();
        (_loc2_ as ProgressBarSkin).tweenTime = param1.attribute("tweenTime").length() > 0 ? Number(param1.attribute("tweenTime")) : 0;
        assignSkinStates(param1, _loc2_);
    }

    protected static function createButtonSkin(param1: XML): void {
        var _loc2_: ISkin = new ButtonSkin();
        assignSkinStates(param1, _loc2_);
    }

    protected static function createFadableButtonSkin(param1: XML): void {
        var _loc2_: ISkin = new FadableButtonSkin();
        assignSkinStates(param1, _loc2_);
    }

    protected static function createToggleButtonSkin(param1: XML): void {
        var _loc2_: ISkin = new ToggleButtonSkin();
        assignSkinStates(param1, _loc2_);
    }

    protected static function createCheckboxSkin(param1: XML): void {
        var _loc2_: ISkin = new CheckBoxSkin();
        assignSkinStates(param1, _loc2_);
    }

    protected static function createRadioButtonSkin(param1: XML): void {
        var _loc2_: ISkin = new RadioButtonSkin();
        assignSkinStates(param1, _loc2_);
    }

    protected static function createLabelSkin(param1: XML): void {
        var _loc2_: ISkin = new LabelSkin();
        if (param1.attribute("truncateText") != undefined) {
            (_loc2_ as LabelSkin).truncateText = AbstractCreator.isBoolean(param1.attribute("truncateText"));
        }
        registerSkin(param1, _loc2_);
    }

    protected static function createInputSkin(param1: XML): void {
        var _loc2_: ISkin = new InputSkin();
        assignSkinStates(param1, _loc2_);
    }

    private static function createRichTextSkin(param1: XML): void {
        var _loc2_: ISkin = new RichTextSkin();
        var _loc3_: Dictionary = new Dictionary();
        _loc3_[SkinLayerNames.NORMAL] = true;
        assignSkinStates(param1, _loc2_, _loc3_);
    }

    private static function assignSkinStates(param1: XML, param2: ISkin, param3: Dictionary = null): void {
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        if (param3 == null) {
            param3 = param2.getSkinLayerDefintions();
        }
        var _loc4_: XMLList = param1.children();
        var _loc5_: String = param1.attribute(AbstractCreator.ATTRIBUTENAME_LIBRARY);
        for each(_loc6_ in _loc4_) {
            _loc8_ = (_loc7_ = createSkinLayer(_loc6_, _loc5_)).name;
            if (param3[_loc8_]) {
                param2.setSkinLayer(_loc8_, _loc7_ as DisplayObject);
            }
        }
        registerSkin(param1, param2);
    }

    private static function assignStateNames(param1: XML, param2: ISkin): void {
        var _loc4_: * = null;
        var _loc3_: XMLList = param1.child("layer");
        for each(_loc4_ in _loc3_) {
            param2.getSkinLayerDefintions()[_loc4_.text().toString()] = {};
        }
    }

    private static function registerSkin(param1: XML, param2: ISkin): void {
        var _loc3_: String = param1.@name;
        if (_loc3_) {
            SkinRepository.getInstance().registerSkin(_loc3_, param2);
            param2.registerdName = _loc3_;
        } else {
            UISystem.log("No skinName has been defined. It´s needed to register it at the SkinRegistry.", UISystem.LOG_LEVEL_WARN);
        }
    }

    protected static function createSkinLayer(param1: XML, param2: String): ISkinLayer {
        return SkinLayerFactory.create(param1, param2);
    }

    public function create(param1: XML): void {
        var _loc2_: String = param1.@classname;
        var _loc3_: Function = skinMap[_loc2_];
        if (_loc3_ != null) {
            _loc3_(param1);
        } else {
            UISystem.log("A SkinClass with the name= {" + _loc2_ + "} doesn´t exist.", UISystem.LOG_LEVEL_WARN);
        }
    }
}
}
