package net.bigpoint.darkorbit.fui.components.list.combobox {

import flash.events.MouseEvent;
import flash.geom.Point;

import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.fui.builder.xml.XMLBasedUIBuilder;
import net.bigpoint.darkorbit.fui.components.buttons.checkbox.CheckBox;
import net.bigpoint.darkorbit.fui.components.core.Container;
import net.bigpoint.darkorbit.fui.components.core.InvalidationType;
import net.bigpoint.darkorbit.fui.components.core.data.ICollection;
import net.bigpoint.darkorbit.fui.components.list.IList;
import net.bigpoint.darkorbit.fui.components.list.itemlist.ItemList;
import net.bigpoint.darkorbit.fui.components.scroll.Scrollbar;
import net.bigpoint.darkorbit.fui.system.manager.IPopUpManager;

public class ComboBox extends CheckBox implements IList {

    private static const ITEMLIST_INSTANCE_NAME: String = "itemlist";

    private static const SCROLLBAR_INSTANCE_NAME: String = "scrollbar";


    private var _popupManager: IPopUpManager;

    private var _popupContainer: Container;

    private var _popupOffsetX: int = 0;

    private var _popupOffsetY: int = 0;

    private var _itemList: ItemList;

    private var _scrollbar: Scrollbar;

    private var _closeListOnSelection: Boolean;

    public function ComboBox() {
        super();
    }

    override protected function initialize(): void {
        super.initialize();
        this._popupContainer = new Container();
        this._popupManager = UISystem.getInstance().popupManager;
        this.closeListOnSelection = false;
    }

    override public function dispose(): void {
        super.dispose();
        if (this._popupContainer) {
            this._popupContainer.dispose();
        }
        if (this._itemList) {
            this._itemList.dispose();
        }
        this._popupManager = null;
    }

    override protected function drawSelectionState(): void {
        if (_skin) {
            setSkinState(_currentSkinState);
        }
        if (_selectionState == SELECTED) {
            this.showPopContainer();
            UISystem.getInstance().stage.addEventListener(MouseEvent.CLICK, this.handleStageClickEvent);
        } else {
            UISystem.getInstance().stage.removeEventListener(MouseEvent.CLICK, this.handleStageClickEvent);
            this.hidePopContainer();
        }
    }

    protected function handleStageClickEvent(param1: MouseEvent): void {
        selection = false;
    }

    protected function showPopContainer(): void {
        this._popupContainer.x = this.globalPosition.x;
        this._popupContainer.y = this.globalPosition.y;
        this._popupContainer.forceRedraw(InvalidationType.POSITION);
        this._popupManager.add(this._popupContainer);
    }

    protected function hidePopContainer(): void {
        this._popupManager.remove(this._popupContainer);
    }

    override public function get globalPosition(): Point {
        var _loc1_: Point = super.globalPosition;
        _loc1_.x += this._popupOffsetX;
        _loc1_.y += this._popupOffsetY + this.height;
        return _loc1_;
    }

    public function set closeListOnSelection(param1: Boolean): void {
        this._closeListOnSelection = param1;
        if (!this._closeListOnSelection) {
            this._popupContainer.addEventListener(MouseEvent.CLICK, this.killMouseEventPropagation);
        } else {
            this._popupContainer.removeEventListener(MouseEvent.CLICK, this.killMouseEventPropagation);
        }
    }

    protected function killMouseEventPropagation(param1: MouseEvent): void {
        param1.stopImmediatePropagation();
    }

    public function get closeListOnSelection(): Boolean {
        return this._closeListOnSelection;
    }

    public function set list(param1: ICollection): void {
        if (this._itemList) {
            this._itemList.list = param1;
        }
    }

    public function get list(): ICollection {
        if (this._itemList == null) {
            return null;
        }
        return this._itemList.list;
    }

    public function set popupTemplate(param1: String): void {
        UISystem.getInstance().buildByTemplate(param1, this._popupContainer, XMLBasedUIBuilder.TYPE, true);
        this._itemList = this._popupContainer.getChildByName(ITEMLIST_INSTANCE_NAME) as ItemList;
        this._scrollbar = this._popupContainer.getChildByName(ITEMLIST_INSTANCE_NAME) as Scrollbar;
    }

    public function set popupOffsetX(param1: int): void {
        this._popupOffsetX = param1;
    }

    public function get popupOffsetX(): int {
        return this._popupOffsetX;
    }

    public function set popupOffsetY(param1: int): void {
        this._popupOffsetY = param1;
    }

    public function get popupOffsetY(): int {
        return this._popupOffsetY;
    }
}
}
