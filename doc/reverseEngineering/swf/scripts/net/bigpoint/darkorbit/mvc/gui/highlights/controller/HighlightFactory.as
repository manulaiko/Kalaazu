package net.bigpoint.darkorbit.mvc.gui.highlights.controller {

import flash.display.DisplayObject;

import net.bigpoint.darkorbit.mvc.gui.highlights.view.CombinedHighLighter;
import net.bigpoint.darkorbit.mvc.gui.highlights.view.FlashHighlight;
import net.bigpoint.darkorbit.mvc.gui.highlights.view.FlashHighlightWithSound;
import net.bigpoint.darkorbit.mvc.gui.highlights.view.FlashWindowHighlight;
import net.bigpoint.darkorbit.mvc.gui.highlights.view.IHighLighter;
import net.bigpoint.darkorbit.mvc.gui.highlights.view.ItemActivationHighlight;
import net.bigpoint.darkorbit.mvc.gui.highlights.view.PointingArrowHighlighter;
import net.bigpoint.darkorbit.mvc.gui.highlights.view.RedBlinkingHighLight;
import net.bigpoint.darkorbit.mvc.gui.highlights.view.WrongHighlighter;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;

import package_11.class_39;

import package_38.class_447;

import package_9.ResourceManager;

public class HighlightFactory {


    public function HighlightFactory() {
        super();
    }

    public static function createHighlight(param1: uint): IHighLighter {
        var _loc2_: * = null;
        switch (param1) {
            case class_447.RED_BLINK:
                _loc2_ = getRedBlinkingHighlighter();
                break;
            case class_447.const_1290:
                _loc2_ = getPointingArrow();
                break;
            case class_447.const_274:
                _loc2_ = getFlashingHighlighterWithSound();
                break;
            case class_447.const_980:
                _loc2_ = getFlashingHighlighter();
                break;
            case class_447.const_2265:
                _loc2_ = getFlashingAndArrowHighlighter();
                break;
            case class_447.const_1799:
                _loc2_ = getFlashingWindowHighlighter();
                break;
            case class_447.ACTIVE:
                _loc2_ = getItemActivationHighlighter();
                break;
            default:
                _loc2_ = getMissingHighliter(param1);
        }
        return _loc2_;
    }

    private static function getFlashingHighlighterWithSound(): IHighLighter {
        return new FlashHighlightWithSound();
    }

    private static function getFlashingAndArrowHighlighter(): IHighLighter {
        var _loc1_: Vector.<IHighLighter> = new <IHighLighter>[getFlashingHighlighter(), getPointingArrow()];
        return new CombinedHighLighter(_loc1_);
    }

    private static function getMissingHighliter(param1: int): IHighLighter {
        return new WrongHighlighter();
    }

    private static function getRedBlinkingHighlighter(): IHighLighter {
        return new RedBlinkingHighLight();
    }

    private static function getFlashingHighlighter(): IHighLighter {
        return new FlashHighlight();
    }

    private static function getPointingArrow(): IHighLighter {
        var _loc1_: class_39 = ResourceManager.name_15.getFinisher(ItemsControlMenuConstants.MENU_ID) as class_39;
        return new PointingArrowHighlighter(_loc1_.method_2545(PointingArrowHighlighter.SYMBOL_LINKAGE) as DisplayObject);
    }

    private static function getFlashingWindowHighlighter(): IHighLighter {
        return new FlashWindowHighlight();
    }

    private static function getItemActivationHighlighter(): IHighLighter {
        return new ItemActivationHighlight();
    }
}
}
