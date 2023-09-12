package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo {

public class MenuActionRequestVO {


    private var _itemVO: ItemVO;

    private var _doubleClick: Boolean;

    private var _barId: String;

    public function MenuActionRequestVO(param1: ItemVO, param2: Boolean, param3: String) {
        super();
        this._itemVO = param1;
        this._doubleClick = param2;
        this._barId = param3;
    }

    public function get itemVO(): ItemVO {
        return this._itemVO;
    }

    public function get doubleClick(): Boolean {
        return this._doubleClick;
    }

    public function get barId(): String {
        return this._barId;
    }
}
}
