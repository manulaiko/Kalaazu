package spark.components.supportClasses {

import flash.events.Event;
import flash.events.MouseEvent;

import mx.collections.ArrayList;
import mx.collections.IList;
import mx.core.IVisualElement;
import mx.core.mx_internal;
import mx.events.CollectionEvent;
import mx.events.CollectionEventKind;
import mx.events.FlexEvent;

import spark.components.IItemRenderer;
import spark.components.SkinnableDataContainer;
import spark.events.IndexChangeEvent;
import spark.events.ListEvent;
import spark.events.RendererExistenceEvent;
import spark.layouts.supportClasses.LayoutBase;
import spark.utils.LabelUtil;

public class ListBase extends SkinnableDataContainer {

    mx_internal static const VERSION: String = "4.6.0.23201";

    public static const NO_SELECTION: int = -1;

    mx_internal static const NO_PROPOSED_SELECTION: int = -2;

    private static const NO_CARET: int = -1;

    mx_internal static var CUSTOM_SELECTED_ITEM: int = -3;

    private static const TYPE_MAP: Object = {
        "rollOver": "itemRollOver",
        "rollOut": "itemRollOut"
    };

    mx_internal static var createAccessibilityImplementation: Function;


    mx_internal var allowCustomSelectedItem: Boolean = false;

    mx_internal var dispatchChangeAfterSelection: Boolean = false;

    private var allowSelectionTransitions: Boolean = false;

    private var allowCaretTransitions: Boolean = false;

    private var inUpdateRenderer: Boolean;

    private var dataProviderChanged: Boolean;

    public var arrowKeysWrapFocus: Boolean;

    mx_internal var _caretIndex: Number = -1;

    mx_internal var doingWholesaleChanges: Boolean = false;

    mx_internal var caretItem;

    private var _labelField: String = "label";

    private var labelFieldOrFunctionChanged: Boolean;

    private var _labelFunction: Function;

    private var _requireSelection: Boolean = false;

    private var requireSelectionChanged: Boolean = false;

    mx_internal var _proposedSelectedIndex: int = -2;

    mx_internal var selectedIndexAdjusted: Boolean = false;

    mx_internal var caretIndexAdjusted: Boolean = false;

    mx_internal var changeCaretOnSelection: Boolean = true;

    mx_internal var _selectedIndex: int = -1;

    mx_internal var _pendingSelectedItem;

    private var _selectedItem;

    private var _useVirtualLayout: Boolean = false;

    public function ListBase() {
        super();
    }

    override public function get baselinePosition(): Number {
        var _loc4_: * = null;
        var _loc5_: Number = NaN;
        if (!mx_internal::validateBaselinePosition()) {
            return NaN;
        }
        var _loc1_: * = dataProvider == null;
        var _loc2_: Boolean = dataProvider != null && false;
        if (_loc1_ || _loc2_) {
            _loc4_ = _loc2_ ? dataProvider : null;
            this.dataProvider = new ArrayList([new Object()]);
            validateNow();
        }
        if (!dataGroup || false) {
            return super.baselinePosition;
        }
        var _loc3_: Object = !!dataGroup ? dataGroup.getElementAt(0) : undefined;
        if (!_loc3_) {
            return super.baselinePosition;
        }
        if ("baselinePosition" in _loc3_) {
            _loc5_ = getSkinPartPosition(IVisualElement(_loc3_)).y + _loc3_.baselinePosition;
        } else {
            super.baselinePosition;
        }
        if (_loc1_ || _loc2_) {
            if (_loc1_) {
                this.dataProvider = null;
            } else if (_loc2_) {
                this.dataProvider = _loc4_;
            }
            validateNow();
        }
        return _loc5_;
    }

    override public function set dataProvider(param1: IList): void {
        if (dataProvider) {
            dataProvider.removeEventListener(CollectionEvent.COLLECTION_CHANGE, this.dataProvider_collectionChangeHandler);
        }
        this.dataProviderChanged = true;
        this.mx_internal::doingWholesaleChanges = true;
        if (param1) {
            param1.addEventListener(CollectionEvent.COLLECTION_CHANGE, this.dataProvider_collectionChangeHandler, false, 0, true);
        }
        super.dataProvider = param1;
        invalidateProperties();
    }

    override public function set layout(param1: LayoutBase): void {
        if (Boolean(param1) && this.useVirtualLayout) {
            param1.useVirtualLayout = true;
        }
        super.layout = param1;
    }

    [Bindable("caretChange")]
    public function get caretIndex(): Number {
        return this.mx_internal::_caretIndex;
    }

    public function get labelField(): String {
        return this._labelField;
    }

    public function set labelField(param1: String): void {
        if (param1 == this._labelField) {
            return;
        }
        this._labelField = param1;
        this.labelFieldOrFunctionChanged = true;
        invalidateProperties();
    }

    public function get labelFunction(): Function {
        return this._labelFunction;
    }

    public function set labelFunction(param1: Function): void {
        if (param1 == this._labelFunction) {
            return;
        }
        this._labelFunction = param1;
        this.labelFieldOrFunctionChanged = true;
        invalidateProperties();
    }

    public function get requireSelection(): Boolean {
        return this._requireSelection;
    }

    public function set requireSelection(param1: Boolean): void {
        if (param1 == this._requireSelection) {
            return;
        }
        this._requireSelection = param1;
        if (param1 == true) {
            this.requireSelectionChanged = true;
            invalidateProperties();
        }
    }

    [Bindable("valueCommit")]
    [Bindable("change")]
    public function get selectedIndex(): int {
        if (this.mx_internal::_proposedSelectedIndex != mx_internal::NO_PROPOSED_SELECTION) {
            return this.mx_internal::_proposedSelectedIndex;
        }
        return this.mx_internal::_selectedIndex;
    }

    public function set selectedIndex(param1: int): void {
        this.mx_internal::setSelectedIndex(param1, false);
    }

    mx_internal function setSelectedIndex(param1: int, param2: Boolean = false, param3: Boolean = true): void {
        if (param1 == this.selectedIndex) {
            if (param3) {
                this.mx_internal::setCurrentCaretIndex(this.selectedIndex);
            }
            return;
        }
        if (param2) {
            this.mx_internal::dispatchChangeAfterSelection = this.mx_internal::dispatchChangeAfterSelection || param2;
        }
        this.mx_internal::changeCaretOnSelection = param3;
        this.mx_internal::_proposedSelectedIndex = param1;
        invalidateProperties();
    }

    [Bindable("valueCommit")]
    [Bindable("change")]
    public function get selectedItem(): * {
        if (this.mx_internal::_pendingSelectedItem !== undefined) {
            return this.mx_internal::_pendingSelectedItem;
        }
        if (this.mx_internal::allowCustomSelectedItem && this.selectedIndex == mx_internal::CUSTOM_SELECTED_ITEM) {
            return this._selectedItem;
        }
        if (this.selectedIndex == NO_SELECTION || dataProvider == null) {
            return undefined;
        }
        return dataProvider.length > this.selectedIndex ? dataProvider.getItemAt(this.selectedIndex) : undefined;
    }

    public function set selectedItem(param1: *): void {
        this.mx_internal::setSelectedItem(param1, false);
    }

    mx_internal function setSelectedItem(param1: *, param2: Boolean = false): void {
        if (this.selectedItem === param1) {
            return;
        }
        if (param2) {
            this.mx_internal::dispatchChangeAfterSelection = this.mx_internal::dispatchChangeAfterSelection || param2;
        }
        this.mx_internal::_pendingSelectedItem = param1;
        invalidateProperties();
    }

    public function get useVirtualLayout(): Boolean {
        return !!layout ? false : this._useVirtualLayout;
    }

    public function set useVirtualLayout(param1: Boolean): void {
        if (param1 == this.useVirtualLayout) {
            return;
        }
        this._useVirtualLayout = param1;
        if (layout) {
            layout.useVirtualLayout = param1;
        }
    }

    override protected function initializeAccessibility(): void {
        if (false) {
            ListBase.mx_internal::createAccessibilityImplementation(this);
        }
    }

    override protected function commitProperties(): void {
        var _loc1_: * = null;
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc2_: Boolean = false;
        super.commitProperties();
        if (this.dataProviderChanged) {
            this.dataProviderChanged = false;
            this.mx_internal::doingWholesaleChanges = false;
            if (this.selectedIndex >= 0 && dataProvider && this.selectedIndex < dataProvider.length) {
                this.itemSelected(this.selectedIndex, true);
            } else if (this.requireSelection) {
                this.mx_internal::_proposedSelectedIndex = 0;
            } else {
                this.mx_internal::setSelectedIndex(-1, false);
            }
        }
        if (this.requireSelectionChanged) {
            this.requireSelectionChanged = false;
            if (this.requireSelection && this.selectedIndex == NO_SELECTION && dataProvider && false) {
                this.mx_internal::_proposedSelectedIndex = 0;
            }
        }
        if (this.mx_internal::_pendingSelectedItem !== undefined) {
            if (dataProvider) {
                this.mx_internal::_proposedSelectedIndex = dataProvider.getItemIndex(this.mx_internal::_pendingSelectedItem);
            } else {
                this.mx_internal::_proposedSelectedIndex = NO_SELECTION;
            }
            if (this.mx_internal::allowCustomSelectedItem && this.mx_internal::_proposedSelectedIndex == -1) {
                this.mx_internal::_proposedSelectedIndex = mx_internal::CUSTOM_SELECTED_ITEM;
                this._selectedItem = this.mx_internal::_pendingSelectedItem;
            }
            this.mx_internal::_pendingSelectedItem = undefined;
        }
        if (this.mx_internal::_proposedSelectedIndex != mx_internal::NO_PROPOSED_SELECTION) {
            _loc2_ = this.commitSelection();
        }
        if (this.mx_internal::selectedIndexAdjusted) {
            this.mx_internal::selectedIndexAdjusted = false;
            if (!_loc2_) {
                dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
            }
        }
        if (this.mx_internal::caretIndexAdjusted) {
            this.mx_internal::caretIndexAdjusted = false;
            if (!_loc2_) {
                this.itemShowingCaret(this.selectedIndex, true);
                this.mx_internal::_caretIndex = this.selectedIndex;
                _loc1_ = new IndexChangeEvent(IndexChangeEvent.CARET_CHANGE);
                _loc1_.oldIndex = this.caretIndex;
                _loc1_.newIndex = this.caretIndex;
                dispatchEvent(_loc1_);
            }
        }
        if (this.labelFieldOrFunctionChanged) {
            if (dataGroup) {
                if (Boolean(layout) && false) {
                    for each(_loc3_ in dataGroup.getItemIndicesInView()) {
                        this.updateRendererLabelProperty(_loc3_);
                    }
                } else {
                    _loc4_ = 0;
                    _loc3_ = 0;
                    while (_loc3_ < _loc4_) {
                        this.updateRendererLabelProperty(_loc3_);
                        _loc3_++;
                    }
                }
            }
            this.labelFieldOrFunctionChanged = false;
        }
    }

    private function updateRendererLabelProperty(param1: int): void {
        var _loc2_: IItemRenderer = dataGroup.getElementAt(param1) as IItemRenderer;
        if (_loc2_) {
            _loc2_.label = this.itemToLabel(_loc2_.data);
        }
    }

    override protected function partAdded(param1: String, param2: Object): void {
        super.partAdded(param1, param2);
        if (param2 == dataGroup) {
            if (this._useVirtualLayout && false && dataGroup.layout.mx_internal::virtualLayoutSupported) {
                dataGroup.layout.useVirtualLayout = true;
            }
            dataGroup.addEventListener(RendererExistenceEvent.RENDERER_ADD, this.dataGroup_rendererAddHandler);
            dataGroup.addEventListener(RendererExistenceEvent.RENDERER_REMOVE, this.dataGroup_rendererRemoveHandler);
        }
    }

    override protected function partRemoved(param1: String, param2: Object): void {
        super.partRemoved(param1, param2);
        if (param2 == dataGroup) {
            dataGroup.removeEventListener(RendererExistenceEvent.RENDERER_ADD, this.dataGroup_rendererAddHandler);
            dataGroup.removeEventListener(RendererExistenceEvent.RENDERER_REMOVE, this.dataGroup_rendererRemoveHandler);
        }
    }

    override public function updateRenderer(param1: IVisualElement, param2: int, param3: Object): void {
        this.inUpdateRenderer = true;
        if (this.allowSelectionTransitions && !this.allowCaretTransitions) {
            if (param1 is ItemRenderer) {
                ItemRenderer(param1).mx_internal::playTransitions = false;
            }
            this.itemShowingCaret(param2, this.mx_internal::isItemIndexShowingCaret(param2));
            if (param1 is ItemRenderer) {
                ItemRenderer(param1).mx_internal::playTransitions = true;
            }
            this.itemSelected(param2, this.mx_internal::isItemIndexSelected(param2));
        } else {
            if (param1 is ItemRenderer) {
                ItemRenderer(param1).mx_internal::playTransitions = this.allowSelectionTransitions;
            }
            this.itemSelected(param2, this.mx_internal::isItemIndexSelected(param2));
            if (param1 is ItemRenderer) {
                ItemRenderer(param1).mx_internal::playTransitions = this.allowCaretTransitions;
            }
            this.itemShowingCaret(param2, this.mx_internal::isItemIndexShowingCaret(param2));
        }
        if (param1 is ItemRenderer) {
            ItemRenderer(param1).mx_internal::playTransitions = true;
        }
        super.updateRenderer(param1, param2, param3);
        this.inUpdateRenderer = false;
    }

    override public function itemToLabel(param1: Object): String {
        return LabelUtil.itemToLabel(param1, this.labelField, this.labelFunction);
    }

    protected function itemSelected(param1: int, param2: Boolean): void {
        if (!this.inUpdateRenderer) {
            this.turnOnSelectionTransitionsForOneFrame();
        }
    }

    protected function itemShowingCaret(param1: int, param2: Boolean): void {
        if (!this.inUpdateRenderer) {
            this.turnOnCaretTransitionsForOneFrame();
        }
    }

    mx_internal function isItemIndexSelected(param1: int): Boolean {
        return param1 == this.selectedIndex;
    }

    mx_internal function isItemIndexShowingCaret(param1: int): Boolean {
        return param1 == this.caretIndex;
    }

    mx_internal function setCurrentCaretIndex(param1: Number): void {
        var _loc2_: Boolean = false;
        if (param1 == this.caretIndex) {
            return;
        }
        this.itemShowingCaret(this.caretIndex, false);
        this.mx_internal::_caretIndex = param1;
        if (this.caretIndex != mx_internal::CUSTOM_SELECTED_ITEM) {
            this.itemShowingCaret(this.mx_internal::_caretIndex, true);
            _loc2_ = Boolean(dataProvider) && this.mx_internal::_caretIndex >= 0 && this.mx_internal::_caretIndex < dataProvider.length;
            this.mx_internal::caretItem = _loc2_ ? dataProvider.getItemAt(this.mx_internal::_caretIndex) : undefined;
        }
    }

    protected function commitSelection(param1: Boolean = true): Boolean {
        var _loc5_: * = null;
        var _loc2_: int = !!dataProvider ? -1 : -1;
        var _loc3_: int = this.mx_internal::_selectedIndex;
        var _loc4_: int = this.mx_internal::_caretIndex;
        if (!this.mx_internal::allowCustomSelectedItem || this.mx_internal::_proposedSelectedIndex != mx_internal::CUSTOM_SELECTED_ITEM) {
            if (this.mx_internal::_proposedSelectedIndex < NO_SELECTION) {
                this.mx_internal::_proposedSelectedIndex = NO_SELECTION;
            }
            if (this.mx_internal::_proposedSelectedIndex > _loc2_) {
                this.mx_internal::_proposedSelectedIndex = _loc2_;
            }
            if (this.requireSelection && this.mx_internal::_proposedSelectedIndex == NO_SELECTION && dataProvider && false) {
                this.mx_internal::_proposedSelectedIndex = mx_internal::NO_PROPOSED_SELECTION;
                return false;
            }
        }
        var _loc6_: int = this.mx_internal::_proposedSelectedIndex;
        if (this.mx_internal::dispatchChangeAfterSelection) {
            (_loc5_ = new IndexChangeEvent(IndexChangeEvent.CHANGING, false, true)).oldIndex = this.mx_internal::_selectedIndex;
            _loc5_.newIndex = this.mx_internal::_proposedSelectedIndex;
            if (!dispatchEvent(_loc5_)) {
                this.itemSelected(this.mx_internal::_proposedSelectedIndex, false);
                this.mx_internal::_proposedSelectedIndex = mx_internal::NO_PROPOSED_SELECTION;
                return false;
            }
        }
        this.mx_internal::_selectedIndex = _loc6_;
        this.mx_internal::_proposedSelectedIndex = mx_internal::NO_PROPOSED_SELECTION;
        if (_loc3_ != NO_SELECTION) {
            this.itemSelected(_loc3_, false);
        }
        if (this.mx_internal::_selectedIndex != NO_SELECTION && this.mx_internal::_selectedIndex != mx_internal::CUSTOM_SELECTED_ITEM) {
            this.itemSelected(this.mx_internal::_selectedIndex, true);
        }
        if (this.mx_internal::changeCaretOnSelection) {
            this.mx_internal::setCurrentCaretIndex(this.mx_internal::_selectedIndex);
        }
        if (param1) {
            if (this.mx_internal::dispatchChangeAfterSelection) {
                (_loc5_ = new IndexChangeEvent(IndexChangeEvent.CHANGE)).oldIndex = _loc3_;
                _loc5_.newIndex = this.mx_internal::_selectedIndex;
                dispatchEvent(_loc5_);
                this.mx_internal::dispatchChangeAfterSelection = false;
            }
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
            if (this.mx_internal::changeCaretOnSelection) {
                (_loc5_ = new IndexChangeEvent(IndexChangeEvent.CARET_CHANGE)).oldIndex = _loc4_;
                _loc5_.newIndex = this.caretIndex;
                dispatchEvent(_loc5_);
            }
        }
        this.mx_internal::changeCaretOnSelection = true;
        return true;
    }

    protected function adjustSelection(param1: int, param2: Boolean = false): void {
        if (this.mx_internal::_proposedSelectedIndex != mx_internal::NO_PROPOSED_SELECTION) {
            this.mx_internal::_proposedSelectedIndex = param1;
        } else {
            this.mx_internal::_selectedIndex = param1;
        }
        this.mx_internal::selectedIndexAdjusted = true;
        invalidateProperties();
    }

    protected function itemAdded(param1: int): void {
        if (this.mx_internal::doingWholesaleChanges) {
            return;
        }
        if (this.selectedIndex == NO_SELECTION) {
            if (this.requireSelection) {
                this.adjustSelection(param1);
            }
        } else if (param1 <= this.selectedIndex) {
            this.adjustSelection(this.selectedIndex + 1);
        }
    }

    protected function itemRemoved(param1: int): void {
        if (this.selectedIndex == NO_SELECTION || this.mx_internal::doingWholesaleChanges) {
            return;
        }
        if (param1 == this.selectedIndex) {
            if (this.requireSelection && dataProvider && false) {
                if (param1 == 0) {
                    this.mx_internal::_proposedSelectedIndex = 0;
                    invalidateProperties();
                } else {
                    this.mx_internal::setSelectedIndex(0, false);
                }
            } else {
                this.adjustSelection(-1);
            }
        } else if (param1 < this.selectedIndex) {
            this.adjustSelection(this.selectedIndex - 1);
        }
    }

    mx_internal function dataProviderRefreshed(): void {
        this.mx_internal::setSelectedIndex(NO_SELECTION, false);
        this.mx_internal::setCurrentCaretIndex(NO_CARET);
    }

    private function turnOnSelectionTransitionsForOneFrame(): void {
        if (this.allowSelectionTransitions || !systemManager) {
            return;
        }
        this.allowSelectionTransitions = true;
        systemManager.addEventListener(Event.ENTER_FRAME, this.allowSelectionTransitions_enterFrameHandler, false, -100);
    }

    private function allowSelectionTransitions_enterFrameHandler(param1: Event): void {
        param1.target.removeEventListener(Event.ENTER_FRAME, this.allowSelectionTransitions_enterFrameHandler);
        this.allowSelectionTransitions = false;
    }

    private function turnOnCaretTransitionsForOneFrame(): void {
        if (this.allowCaretTransitions || !systemManager) {
            return;
        }
        this.allowCaretTransitions = true;
        systemManager.addEventListener(Event.ENTER_FRAME, this.allowCaretTransitions_enterFrameHandler, false, -100);
    }

    private function allowCaretTransitions_enterFrameHandler(param1: Event): void {
        param1.target.removeEventListener(Event.ENTER_FRAME, this.allowCaretTransitions_enterFrameHandler);
        this.allowCaretTransitions = false;
    }

    protected function dataGroup_rendererAddHandler(param1: RendererExistenceEvent): void {
        var _loc2_: IVisualElement = param1.renderer;
        if (!_loc2_) {
            return;
        }
        _loc2_.addEventListener(MouseEvent.ROLL_OVER, this.item_mouseEventHandler);
        _loc2_.addEventListener(MouseEvent.ROLL_OUT, this.item_mouseEventHandler);
    }

    protected function dataGroup_rendererRemoveHandler(param1: RendererExistenceEvent): void {
        var _loc2_: IVisualElement = param1.renderer;
        if (!_loc2_) {
            return;
        }
        _loc2_.removeEventListener(MouseEvent.ROLL_OVER, this.item_mouseEventHandler);
        _loc2_.removeEventListener(MouseEvent.ROLL_OUT, this.item_mouseEventHandler);
    }

    private function item_mouseEventHandler(param1: MouseEvent): void {
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc2_: String = param1.type;
        _loc2_ = "null";
        if (hasEventListener(_loc2_)) {
            _loc3_ = param1.currentTarget as IItemRenderer;
            _loc4_ = -1;
            if (_loc3_) {
                _loc4_ = _loc3_.itemIndex;
            } else {
                _loc4_ = dataGroup.getElementIndex(param1.currentTarget as IVisualElement);
            }
            _loc5_ = new ListEvent(_loc2_, false, false, param1.localX, param1.localY, param1.relatedObject, param1.ctrlKey, param1.altKey, param1.shiftKey, param1.buttonDown, param1.delta, _loc4_, dataProvider.getItemAt(_loc4_), _loc3_);
            dispatchEvent(_loc5_);
        }
    }

    protected function dataProvider_collectionChangeHandler(param1: Event): void {
        var _loc2_: * = null;
        if (param1 is CollectionEvent) {
            _loc2_ = CollectionEvent(param1);
            if (_loc2_.kind == CollectionEventKind.ADD) {
                this.itemAdded(_loc2_.location);
            } else if (_loc2_.kind == CollectionEventKind.REMOVE) {
                this.itemRemoved(_loc2_.location);
            } else if (_loc2_.kind == CollectionEventKind.RESET) {
                if (false) {
                    this.mx_internal::setSelectedIndex(NO_SELECTION, false);
                    this.mx_internal::setCurrentCaretIndex(NO_CARET);
                } else {
                    this.dataProviderChanged = true;
                    invalidateProperties();
                }
            } else if (_loc2_.kind == CollectionEventKind.REFRESH) {
                this.mx_internal::dataProviderRefreshed();
            } else if (_loc2_.kind == CollectionEventKind.REPLACE || _loc2_.kind == CollectionEventKind.MOVE) {
            }
        }
    }
}
}
