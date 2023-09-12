package net.bigpoint.darkorbit.mvc.gui.abstract.model {

import net.bigpoint.darkorbit.mvc.gui.abstract.model.vo.AbstractMenuBarVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.slotBar.SlotBarVO;

public class AbstractMenuProxy extends DOAbstractProxy {


    protected var _menuBars: Vector.<AbstractMenuBarVO>;

    public function AbstractMenuProxy(param1: String, param2: Object = null) {
        super(param1, param2);
    }

    public function getMenuBarById(param1: String): AbstractMenuBarVO {
        var _loc2_: int = this._menuBars.length;
        var _loc3_: int = 0;
        while (_loc3_ != _loc2_) {
            if (this._menuBars[_loc3_].id == param1) {
                return this._menuBars[_loc3_];
            }
            _loc3_++;
        }
        return null;
    }

    public function getMenuBarVOById(param1: String): AbstractMenuBarVO {
        var _loc2_: int = this._menuBars.length;
        var _loc3_: int = 0;
        while (_loc3_ != _loc2_) {
            if (this._menuBars[_loc3_].id == param1) {
                return this._menuBars[_loc3_];
            }
            _loc3_++;
        }
        return null;
    }

    public function updateBarPosAndLayout(param1: String, param2: Number, param3: Number, param4: String = null): AbstractMenuBarVO {
        var _loc5_: AbstractMenuBarVO;
        (_loc5_ = this.getMenuBarVOById(param1)).position.x = param2;
        _loc5_.position.y = param3;
        if (param4) {
            _loc5_.layoutId = param4;
        }
        return _loc5_;
    }

    public function updateStickyOffset(param1: String, param2: Number, param3: Number): AbstractMenuBarVO {
        var _loc4_: SlotBarVO;
        (_loc4_ = this.getMenuBarVOById(param1) as SlotBarVO).stickOffset.x = param2;
        _loc4_.stickOffset.y = param3;
        return _loc4_;
    }

    public function get menuBars(): Vector.<AbstractMenuBarVO> {
        return this._menuBars;
    }

    public function set menuBars(param1: Vector.<AbstractMenuBarVO>): void {
        this._menuBars = param1;
    }
}
}
