package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.slotBar {

import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.ItemVO;

public class SlotVO {


    private var _id: int;

    private var _itemVO: ItemVO;

    private var _premium: Boolean;

    private var _slotBarId: String;

    public function SlotVO(param1: int, param2: ItemVO, param3: String, param4: Boolean = false) {
        super();
        this._id = param1;
        this._itemVO = param2;
        this._premium = param4;
        this._slotBarId = param3;
    }

    public function get id(): int {
        return this._id;
    }

    public function get itemVO(): ItemVO {
        return this._itemVO;
    }

    public function get premium(): Boolean {
        return this._premium;
    }

    public function get slotBarId(): String {
        return this._slotBarId;
    }

    public function set slotBarId(param1: String): void {
        this._slotBarId = param1;
    }
}
}
