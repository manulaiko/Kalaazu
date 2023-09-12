package net.bigpoint.darkorbit.mvc.gui.highlights.controller {

import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.view.FeaturesMenuMediator;
import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightItemVO;
import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightProxy;
import net.bigpoint.darkorbit.mvc.gui.highlights.view.IHighLighter;
import net.bigpoint.darkorbit.mvc.gui.interfaces.IWindow;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.ItemsControlMenuMediator;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.SlotAndItemBarElement;
import net.bigpoint.darkorbit.mvc.gui.view.GuiMediator;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_141.class_969;

import package_84.class_243;

public class AddItemHighlightCommand extends class_243 {


    public function AddItemHighlightCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: * = null;
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: int = 0;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc14_: * = 0;
        super.execute(param1);
        _loc2_ = param1.getBody() as HighlightItemVO;
        var _loc3_: HighlightProxy = retrieveProxy(HighlightProxy.NAME) as HighlightProxy;
        var _loc4_: Vector.<HelperVO> = new Vector.<HelperVO>();
        if (!_loc3_.hasHighlighterOfType(_loc2_)) {
            switch (_loc2_.source) {
                case ItemsControlMenuConstants.MENU_ID:
                    _loc9_ = this.getItemsControlMenuVosByVo(_loc2_);
                    _loc4_ = this.getItembarElements(_loc9_);
                    break;
                case ItemsControlMenuConstants.STANDARD_SLOT_BAR:
                    _loc4_ = this.getItembarElements(new <HighlightItemVO>[_loc2_]);
                    break;
                case ItemsControlMenuConstants.PREMIUM_SLOT_BAR:
                    _loc4_ = this.getItembarElements(new <HighlightItemVO>[_loc2_]);
                    break;
                case ItemsControlMenuConstants.PRO_ACTION_BAR:
                    _loc4_ = this.getItembarElements(new <HighlightItemVO>[_loc2_]);
                    break;
                case ItemsControlMenuConstants.CATEGORY_BAR:
                    _loc4_ = this.getItembarElements(new <HighlightItemVO>[_loc2_]);
                    break;
                case FeaturesMenuConstants.MENU_ID:
                    if (_loc11_ = (_loc10_ = retrieveMediator(FeaturesMenuMediator.NAME) as FeaturesMenuMediator).getGameFeatureBtnById(_loc2_.itemId) as class_969) {
                        _loc4_.push(new HelperVO(_loc2_, _loc11_));
                        break;
                    }
                    break;
                case GuiConstants.WINDOWS_ID:
                    if (_loc13_ = (_loc12_ = retrieveMediator(GuiMediator.NAME) as GuiMediator).getWindowById(_loc2_.itemId) as IWindow) {
                        _loc4_.push(new HelperVO(_loc2_, _loc13_));
                        break;
                    }
            }
            _loc5_ = _loc4_.length;
            _loc8_ = 0;
            while (_loc8_ < _loc5_) {
                _loc14_ = (_loc7_ = _loc4_[_loc8_]).vo.highlighterType;
                _loc6_ = HighlightFactory.createHighlight(_loc14_);
                if (_loc7_.element is _loc6_.expectedClass) {
                    _loc6_.decorateUiElement(_loc7_.element, _loc7_.vo);
                    _loc3_.addHighlightToLookup(_loc6_);
                }
                _loc8_++;
            }
        }
    }

    private function getItembarElements(param1: Vector.<HighlightItemVO>): Vector.<HelperVO> {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc7_: int = 0;
        var _loc2_: Vector.<HelperVO> = new Vector.<HelperVO>();
        var _loc3_: ItemsControlMenuMediator = retrieveMediator(ItemsControlMenuMediator.NAME) as ItemsControlMenuMediator;
        var _loc6_: int = 0;
        while (_loc6_ < param1.length) {
            _loc5_ = param1[_loc6_];
            _loc4_ = _loc3_.getItemBySlotbarID(_loc5_.source, _loc5_.itemId);
            _loc7_ = 0;
            while (_loc7_ < _loc4_.length) {
                _loc2_.push(new HelperVO(_loc5_, _loc4_[_loc7_]));
                _loc7_++;
            }
            _loc6_++;
        }
        return _loc2_;
    }

    private function getItemsControlMenuVosByVo(param1: HighlightItemVO): Vector.<HighlightItemVO> {
        var _loc2_: Vector.<HighlightItemVO> = new Vector.<HighlightItemVO>();
        _loc2_.push(new HighlightItemVO(param1.itemId, ItemsControlMenuConstants.CATEGORY_BAR, param1.highlighterType, param1.highlightDuration));
        _loc2_.push(new HighlightItemVO(param1.itemId, ItemsControlMenuConstants.STANDARD_SLOT_BAR, param1.highlighterType, param1.highlightDuration));
        _loc2_.push(new HighlightItemVO(param1.itemId, ItemsControlMenuConstants.PREMIUM_SLOT_BAR, param1.highlighterType, param1.highlightDuration));
        _loc2_.push(new HighlightItemVO(param1.itemId, ItemsControlMenuConstants.PRO_ACTION_BAR, param1.highlighterType, param1.highlightDuration));
        return _loc2_;
    }
}
}

import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightItemVO;

class HelperVO {


    public var vo: HighlightItemVO;

    public var element: Object;

    function HelperVO(param1: HighlightItemVO, param2: Object) {
        super();
        this.vo = param1;
        this.element = param2;
    }
}
