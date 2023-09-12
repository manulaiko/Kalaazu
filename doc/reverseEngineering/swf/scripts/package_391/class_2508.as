package package_391 {

import com.greensock.TweenLite;

import flash.display.Sprite;
import flash.events.EventDispatcher;
import flash.events.MouseEvent;

import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.fui.components.core.Container;
import net.bigpoint.darkorbit.fui.components.core.Coreponent;
import net.bigpoint.darkorbit.fui.components.core.InvalidationType;
import net.bigpoint.darkorbit.fui.components.scroll.ScrollContainer;
import net.bigpoint.darkorbit.fui.components.scroll.ScrollEvent;
import net.bigpoint.darkorbit.fui.components.scroll.Scrollbar;

import package_392.class_2265;

import package_450.class_2510;
import package_450.class_2670;
import package_450.class_2671;

import package_76.class_215;

public class class_2508 extends EventDispatcher {

    private static const const_2073: Number = 0.3;


    private var _content: Sprite;

    private var var_3753: Container;

    private var scrollContainer: ScrollContainer;

    private var var_3393: Coreponent;

    private var scrollbar: Scrollbar;

    public function class_2508() {
        super();
    }

    public function build(param1: Sprite, param2: Object = null): void {
        var _loc3_: * = null;
        if (this._content == null) {
            this._content = param1;
            UISystem.getInstance().build(param2, this._content);
            this.var_3753 = this._content.getChildByName("hintOverviewContainer") as Container;
            this.var_3753.mouseEnabled = false;
            _loc3_ = this.var_3753.getChildByName("overviewListContainer") as Container;
            this.scrollContainer = _loc3_.getChildByName("scrollContainer") as ScrollContainer;
            this.scrollContainer.addEventListener(MouseEvent.MOUSE_WHEEL, this.handleScrollContainerMouseWheelEvent);
            this.scrollContainer.addEventListener(ScrollEvent.SCROLLCONTAINER_VERTICAL_SIZE_CHANGED, this.method_5196);
            this.var_3393 = this.scrollContainer.content as Coreponent;
            this.scrollbar = _loc3_.getChildByName("scrollbar") as Scrollbar;
            this.scrollbar.addEventListener(ScrollEvent.SCROLLBAR_POSITION_CHANGED, this.handleScrollbarPositionChangeEvent);
        }
    }

    private function handleScrollbarPositionChangeEvent(param1: ScrollEvent): void {
        this.method_5767();
    }

    private function method_5767(): void {
        var _loc1_: Number = Number(this.scrollbar.getScrollPositionInPercent());
        this.scrollContainer.setScrollPositionInPercent(_loc1_);
    }

    private function handleScrollContainerMouseWheelEvent(param1: MouseEvent): void {
        this.scrollbar.updateScrollPositionByScrollDelta(param1.delta);
    }

    private function method_5196(param1: ScrollEvent): void {
        this.scrollbar.updateBySizes(param1.viewSize, param1.contentSize);
    }

    protected function method_3773(param1: MouseEvent): void {
        var _loc2_: Coreponent = param1.target as Coreponent;
        var _loc3_: uint = _loc2_.data as uint;
        TweenLite.killDelayedCallsTo(this.method_1473);
        TweenLite.delayedCall(const_2073, this.method_1473, [_loc3_]);
    }

    protected function method_1473(param1: uint): void {
        dispatchEvent(new class_2510(class_2510.ITEM_CLICKED, param1));
    }

    public function set list(param1: Vector.<class_2265>): void {
        this.method_6460(this.var_3393);
        this.method_1589(param1, this.var_3393);
        this.scrollContainer.invalidate(InvalidationType.SIZE);
    }

    protected function method_6460(param1: Sprite): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        while (param1.numChildren > 0) {
            _loc2_ = param1.getChildAt(0) as Sprite;
            _loc3_ = _loc2_ as Coreponent;
            if (_loc3_) {
                _loc3_.dispose();
            } else {
                class_215.removeDisplayObject(_loc2_);
            }
        }
    }

    protected function method_1589(param1: Vector.<class_2265>, param2: Sprite): void {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc3_: uint = param1.length;
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_) {
            _loc5_ = param1[_loc4_];
            (_loc6_ = this.method_944(_loc5_) as Sprite).y = _loc4_ * 18;
            param2.addChild(_loc6_);
            _loc4_++;
        }
    }

    protected function method_944(param1: class_2265): Sprite {
        var _loc2_: class_2670 = new class_2670();
        var _loc3_: class_2671 = new class_2671();
        _loc3_.registeredTextStyleName = "hintsystem_overview_itemlist";
        _loc3_.skin = _loc2_;
        _loc3_.text = param1.content.title;
        _loc3_.autoSizeWidth = true;
        _loc3_.height = 18;
        _loc3_.data = param1.id;
        _loc3_.addEventListener(MouseEvent.CLICK, this.method_3773);
        return _loc3_;
    }

    public function setSize(param1: Number, param2: Number): void {
        this.var_3753.setSize(param1, param2);
    }

    public function activate(): void {
        this._content.mouseChildren = true;
        this._content.alpha = 1;
    }

    public function deactivate(): void {
        this._content.mouseChildren = false;
        this._content.alpha = 0.4;
    }
}
}
