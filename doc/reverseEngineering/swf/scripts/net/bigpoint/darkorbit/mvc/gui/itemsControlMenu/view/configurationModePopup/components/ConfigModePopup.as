package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.configurationModePopup.components {

import mx.binding.BindingManager;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.events.FlexEvent;

import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOButtonBaseSkin;

import spark.components.Group;
import spark.components.Label;
import spark.components.VGroup;

public class ConfigModePopup extends ConfigModePopupBase {


    private var __moduleFactoryInitialized: Boolean = false;

    public function ConfigModePopup() {
        super();
        mx_internal::_document = this;
        this.styleName = "battleStationPopup";
        this.width = 250;
        this.height = 200;
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this._ConfigModePopup_Array1_c);
        this.addEventListener("creationComplete", this.___ConfigModePopup_ConfigModePopupBase1_creationComplete);
    }

    override public function set moduleFactory(param1: IFlexModuleFactory): void {
        super.moduleFactory = param1;
        if (this.__moduleFactoryInitialized) {
            return;
        }
        this.__moduleFactoryInitialized = true;
    }

    override public function initialize(): void {
        super.initialize();
    }

    private function _ConfigModePopup_Array1_c(): Array {
        return [this._ConfigModePopup_Group1_c()];
    }

    private function _ConfigModePopup_Group1_c(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this._ConfigModePopup_VGroup1_c()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function _ConfigModePopup_VGroup1_c(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.horizontalCenter = 0;
        _loc1_.verticalCenter = 0;
        _loc1_.gap = 10;
        _loc1_.paddingTop = -15;
        _loc1_.mxmlContent = [this._ConfigModePopup_DOButtonBase1_i(), this._ConfigModePopup_Label1_i(), this._ConfigModePopup_DOButtonBase2_i()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function _ConfigModePopup_DOButtonBase1_i(): DOButtonBase {
        var _loc1_: DOButtonBase = new DOButtonBase();
        _loc1_.width = 215;
        _loc1_.top = 4;
        _loc1_.visible = true;
        _loc1_.styleName = "questWindowAcceptQuest";
        _loc1_.mouseChildren = false;
        _loc1_.buttonMode = false;
        _loc1_.useHandCursor = true;
        _loc1_.setStyle("fontSize", 14);
        _loc1_.setStyle("color", 16777215);
        _loc1_.setStyle("skinClass", DOButtonBaseSkin);
        _loc1_.id = "resetAndExit";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        resetAndExit = _loc1_;
        BindingManager.executeBindings(this, "resetAndExit", resetAndExit);
        return _loc1_;
    }

    private function _ConfigModePopup_Label1_i(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 100;
        _loc1_.setStyle("textAlign", "center");
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.setStyle("color", 16763904);
        _loc1_.setStyle("fontSize", 16);
        _loc1_.id = "orLabelF";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        orLabelF = _loc1_;
        BindingManager.executeBindings(this, "orLabelF", orLabelF);
        return _loc1_;
    }

    private function _ConfigModePopup_DOButtonBase2_i(): DOButtonBase {
        var _loc1_: DOButtonBase = new DOButtonBase();
        _loc1_.width = 215;
        _loc1_.top = 4;
        _loc1_.visible = true;
        _loc1_.styleName = "questWindowAcceptQuest";
        _loc1_.mouseChildren = false;
        _loc1_.buttonMode = false;
        _loc1_.useHandCursor = true;
        _loc1_.setStyle("fontSize", 14);
        _loc1_.setStyle("color", 16777215);
        _loc1_.setStyle("skinClass", DOButtonBaseSkin);
        _loc1_.id = "saveAndExit";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        saveAndExit = _loc1_;
        BindingManager.executeBindings(this, "saveAndExit", saveAndExit);
        return _loc1_;
    }

    public function ___ConfigModePopup_ConfigModePopupBase1_creationComplete(param1: FlexEvent): void {
        creationCompleteHandler();
    }
}
}
