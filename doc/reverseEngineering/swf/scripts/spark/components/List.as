package spark.components {

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.system.ApplicationDomain;
import flash.text.TextField;
import flash.ui.Keyboard;

import mx.collections.ArrayCollection;
import mx.collections.IList;
import mx.core.DragSource;
import mx.core.EventPriority;
import mx.core.IFactory;
import mx.core.IFlexDisplayObject;
import mx.core.IUID;
import mx.core.IVisualElement;
import mx.core.InteractionMode;
import mx.core.ScrollPolicy;
import mx.core.UIComponentGlobals;
import mx.core.mx_internal;
import mx.events.DragEvent;
import mx.events.FlexEvent;
import mx.events.SandboxMouseEvent;
import mx.events.TouchInteractionEvent;
import mx.managers.DragManager;
import mx.managers.IFocusManagerComponent;
import mx.utils.ObjectUtil;
import mx.utils.UIDUtil;

import spark.components.supportClasses.ListBase;
import spark.core.NavigationUnit;
import spark.events.IndexChangeEvent;
import spark.events.RendererExistenceEvent;
import spark.layouts.supportClasses.DropLocation;

public class List extends ListBase implements IFocusManagerComponent {

    mx_internal static const VERSION: String = "4.6.0.23201";

    mx_internal static var createAccessibilityImplementation: Function;


    mx_internal var mouseDownPoint: Point;

    mx_internal var mouseDownIndex: int = -1;

    mx_internal var mouseDownObject: DisplayObject;

    mx_internal var pendingSelectionOnMouseUp: Boolean = false;

    mx_internal var pendingSelectionShiftKey: Boolean;

    mx_internal var pendingSelectionCtrlKey: Boolean;

    private var richEditableTextClass: Class;

    [SkinPart(type="flash.display.DisplayObject", required="false")]
    public var dropIndicator: IFactory;

    [SkinPart(required="false")]
    public var scroller: Scroller;

    private var _allowMultipleSelection: Boolean = false;

    private var _dragEnabled: Boolean = false;

    private var _dragMoveEnabled: Boolean = false;

    private var _dropEnabled: Boolean = false;

    private var _selectedIndices: Vector.<int>;

    private var _proposedSelectedIndices: Vector.<int>;

    private var multipleSelectionChanged: Boolean;

    private var _pageScrollingEnabled: Boolean = false;

    private var _scrollSnappingMode: String = "none";

    public function List() {
        this._selectedIndices = new Vector.<int>();
        this._proposedSelectedIndices = new Vector.<int>();
        super();
        this.useVirtualLayout = true;
        if (ApplicationDomain.currentDomain.hasDefinition("spark.components.RichEditableText")) {
            this.richEditableTextClass = Class(ApplicationDomain.currentDomain.getDefinition("spark.components.RichEditableText"));
        }
        addEventListener(TouchInteractionEvent.TOUCH_INTERACTION_START, this.touchInteractionStartHandler);
    }

    override public function set hasFocusableChildren(param1: Boolean): void {
        super.hasFocusableChildren = param1;
        if (this.scroller) {
            this.scroller.hasFocusableChildren = param1;
        }
    }

    override public function get useVirtualLayout(): Boolean {
        return super.useVirtualLayout;
    }

    override public function set useVirtualLayout(param1: Boolean): void {
        super.useVirtualLayout = param1;
    }

    override public function set dataProvider(param1: IList): void {
        if (!this.isEmpty(this._proposedSelectedIndices) || !this.isEmpty(this.selectedIndices)) {
            this._proposedSelectedIndices.length = 0;
            this.multipleSelectionChanged = true;
            invalidateProperties();
            UIComponentGlobals.mx_internal::layoutManager.validateClient(this, true);
        }
        super.dataProvider = param1;
    }

    public function get allowMultipleSelection(): Boolean {
        return this._allowMultipleSelection;
    }

    public function set allowMultipleSelection(param1: Boolean): void {
        if (param1 == this._allowMultipleSelection) {
            return;
        }
        this._allowMultipleSelection = param1;
    }

    public function get dragEnabled(): Boolean {
        return this._dragEnabled;
    }

    public function set dragEnabled(param1: Boolean): void {
        if (param1 == this._dragEnabled) {
            return;
        }
        this._dragEnabled = param1;
        if (this._dragEnabled) {
            addEventListener(DragEvent.DRAG_START, this.dragStartHandler, false, EventPriority.DEFAULT_HANDLER);
            addEventListener(DragEvent.DRAG_COMPLETE, this.dragCompleteHandler, false, EventPriority.DEFAULT_HANDLER);
        } else {
            removeEventListener(DragEvent.DRAG_START, this.dragStartHandler, false);
            removeEventListener(DragEvent.DRAG_COMPLETE, this.dragCompleteHandler, false);
        }
    }

    public function get dragMoveEnabled(): Boolean {
        return this._dragMoveEnabled;
    }

    public function set dragMoveEnabled(param1: Boolean): void {
        this._dragMoveEnabled = param1;
    }

    public function get dropEnabled(): Boolean {
        return this._dropEnabled;
    }

    public function set dropEnabled(param1: Boolean): void {
        if (param1 == this._dropEnabled) {
            return;
        }
        this._dropEnabled = param1;
        if (this._dropEnabled) {
            addEventListener(DragEvent.DRAG_ENTER, this.dragEnterHandler, false, EventPriority.DEFAULT_HANDLER);
            addEventListener(DragEvent.DRAG_EXIT, this.dragExitHandler, false, EventPriority.DEFAULT_HANDLER);
            addEventListener(DragEvent.DRAG_OVER, this.dragOverHandler, false, EventPriority.DEFAULT_HANDLER);
            addEventListener(DragEvent.DRAG_DROP, this.dragDropHandler, false, EventPriority.DEFAULT_HANDLER);
        } else {
            removeEventListener(DragEvent.DRAG_ENTER, this.dragEnterHandler, false);
            removeEventListener(DragEvent.DRAG_EXIT, this.dragExitHandler, false);
            removeEventListener(DragEvent.DRAG_OVER, this.dragOverHandler, false);
            removeEventListener(DragEvent.DRAG_DROP, this.dragDropHandler, false);
        }
    }

    [Bindable("valueCommit")]
    [Bindable("change")]
    public function get selectedIndices(): Vector.<int> {
        return this._selectedIndices;
    }

    public function set selectedIndices(param1: Vector.<int>): void {
        this.mx_internal::setSelectedIndices(param1, false);
    }

    mx_internal function setSelectedIndices(param1: Vector.<int>, param2: Boolean = false, param3: Boolean = true): void {
        if (this._proposedSelectedIndices == param1 || param1 && param1.length == 1 && this.selectedIndices && this.selectedIndices.length == 1 && param1[0] == this.selectedIndices[0]) {
            if (param3) {
                mx_internal::setCurrentCaretIndex(selectedIndex);
            }
            return;
        }
        if (param2) {
            mx_internal::dispatchChangeAfterSelection = Boolean(mx_internal::dispatchChangeAfterSelection) || param2;
        }
        if (param1) {
            this._proposedSelectedIndices = param1;
        } else {
            this._proposedSelectedIndices = new Vector.<int>();
        }
        this.multipleSelectionChanged = true;
        mx_internal::changeCaretOnSelection = param3;
        invalidateProperties();
    }

    [Bindable("valueCommit")]
    [Bindable("change")]
    public function get selectedItems(): Vector.<Object> {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc1_: Vector.<Object> = new Vector.<Object>();
        if (this.selectedIndices) {
            _loc2_ = this.selectedIndices.length;
            _loc3_ = 0;
            while (_loc3_ < _loc2_) {
                _loc1_[_loc3_] = dataProvider.getItemAt(this.selectedIndices[_loc3_]);
                _loc3_++;
            }
        }
        return _loc1_;
    }

    public function set selectedItems(param1: Vector.<Object>): void {
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc2_: Vector.<int> = new Vector.<int>();
        if (param1) {
            _loc3_ = param1.length;
            _loc4_ = 0;
            while (_loc4_ < _loc3_) {
                if ((_loc5_ = dataProvider.getItemIndex(param1[_loc4_])) != -1) {
                    _loc2_.splice(0, 0, _loc5_);
                }
                if (_loc5_ == -1) {
                    _loc2_ = new Vector.<int>();
                    break;
                }
                _loc4_++;
            }
        }
        this._proposedSelectedIndices = _loc2_;
        this.multipleSelectionChanged = true;
        invalidateProperties();
    }

    public function get pageScrollingEnabled(): Boolean {
        if (this.scroller) {
            return this.scroller.pageScrollingEnabled;
        }
        return this._pageScrollingEnabled;
    }

    public function set pageScrollingEnabled(param1: Boolean): void {
        if (this.scroller) {
            this.scroller.pageScrollingEnabled = param1;
        }
        this._pageScrollingEnabled = param1;
    }

    public function get scrollSnappingMode(): String {
        if (this.scroller) {
            return this.scroller.scrollSnappingMode;
        }
        return this._scrollSnappingMode;
    }

    public function set scrollSnappingMode(param1: String): void {
        if (this.scroller) {
            this.scroller.scrollSnappingMode = param1;
        }
        this._scrollSnappingMode = param1;
    }

    override protected function initializeAccessibility(): void {
        if (false) {
            List.mx_internal::createAccessibilityImplementation(this);
        }
    }

    override protected function commitProperties(): void {
        super.commitProperties();
        if (this.multipleSelectionChanged) {
            this.commitSelection();
        }
    }

    override protected function partAdded(param1: String, param2: Object): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        super.partAdded(param1, param2);
        if (param2 == this.scroller) {
            this.scroller.hasFocusableChildren = hasFocusableChildren;
            _loc3_ = getStyle("verticalScrollPolicy");
            if (Boolean(_loc3_) && _loc3_ !== ScrollPolicy.AUTO) {
                this.scroller.setStyle("verticalScrollPolicy", _loc3_);
            }
            if ((Boolean(_loc4_ = getStyle("horizontalScrollPolicy"))) && _loc4_ !== ScrollPolicy.AUTO) {
                this.scroller.setStyle("horizontalScrollPolicy", _loc4_);
            }
            this.scroller.pageScrollingEnabled = this._pageScrollingEnabled;
            this.scroller.scrollSnappingMode = this._scrollSnappingMode;
        }
    }

    override protected function itemAdded(param1: int): void {
        this.adjustSelection(param1, true);
    }

    override protected function itemRemoved(param1: int): void {
        this.adjustSelection(param1, false);
    }

    private function isValidIndex(param1: int, param2: int, param3: Vector.<int>): Boolean {
        return dataProvider != null && param1 >= 0 && param1 < dataProvider.length;
    }

    override protected function commitSelection(param1: Boolean = true): Boolean {
        var _loc6_: * = null;
        var _loc7_: * = null;
        this.multipleSelectionChanged = false;
        var _loc2_: Number = Number(mx_internal::_selectedIndex);
        var _loc3_: Number = Number(mx_internal::_caretIndex);
        this._proposedSelectedIndices = this._proposedSelectedIndices.filter(this.isValidIndex);
        if (!this.allowMultipleSelection && !this.isEmpty(this._proposedSelectedIndices)) {
            (_loc6_ = new Vector.<int>()).push(this._proposedSelectedIndices[0]);
            this._proposedSelectedIndices = _loc6_;
        }
        if (!this.isEmpty(this._proposedSelectedIndices)) {
            mx_internal::_proposedSelectedIndex = this.getFirstItemValue(this._proposedSelectedIndices);
        }
        var _loc4_: Boolean = Boolean(mx_internal::changeCaretOnSelection);
        var _loc5_: Boolean;
        if (!(_loc5_ = super.commitSelection(false))) {
            return false;
        }
        if (selectedIndex > NO_SELECTION) {
            if (Boolean(this._proposedSelectedIndices) && this._proposedSelectedIndices.indexOf(selectedIndex) == -1) {
                this._proposedSelectedIndices.push(selectedIndex);
            }
        }
        this.commitMultipleSelection();
        if (_loc4_) {
            mx_internal::setCurrentCaretIndex(selectedIndex);
        }
        if (param1 && _loc5_) {
            if (mx_internal::dispatchChangeAfterSelection) {
                (_loc7_ = new IndexChangeEvent(IndexChangeEvent.CHANGE)).oldIndex = _loc2_;
                _loc7_.newIndex = mx_internal::_selectedIndex;
                dispatchEvent(_loc7_);
                mx_internal::dispatchChangeAfterSelection = false;
            }
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
            if (_loc4_) {
                (_loc7_ = new IndexChangeEvent(IndexChangeEvent.CARET_CHANGE)).oldIndex = _loc3_;
                _loc7_.newIndex = caretIndex;
                dispatchEvent(_loc7_);
            }
        }
        return _loc5_;
    }

    protected function commitMultipleSelection(): void {
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc1_: Vector.<int> = new Vector.<int>();
        var _loc2_: Vector.<int> = new Vector.<int>();
        if (!this.isEmpty(this._selectedIndices) && !this.isEmpty(this._proposedSelectedIndices)) {
            _loc4_ = this._proposedSelectedIndices.length;
            _loc3_ = 0;
            while (_loc3_ < _loc4_) {
                if (this._selectedIndices.indexOf(this._proposedSelectedIndices[_loc3_]) < 0) {
                    _loc2_.push(this._proposedSelectedIndices[_loc3_]);
                }
                _loc3_++;
            }
            _loc4_ = this._selectedIndices.length;
            _loc3_ = 0;
            while (_loc3_ < _loc4_) {
                if (this._proposedSelectedIndices.indexOf(this._selectedIndices[_loc3_]) < 0) {
                    _loc1_.push(this._selectedIndices[_loc3_]);
                }
                _loc3_++;
            }
        } else if (!this.isEmpty(this._selectedIndices)) {
            _loc1_ = this._selectedIndices;
        } else if (!this.isEmpty(this._proposedSelectedIndices)) {
            _loc2_ = this._proposedSelectedIndices;
        }
        this._selectedIndices = this._proposedSelectedIndices;
        if (_loc1_.length > 0) {
            _loc4_ = _loc1_.length;
            _loc3_ = 0;
            while (_loc3_ < _loc4_) {
                this.itemSelected(_loc1_[_loc3_], false);
                _loc3_++;
            }
        }
        if (!this.isEmpty(this._proposedSelectedIndices)) {
            _loc4_ = this._proposedSelectedIndices.length;
            _loc3_ = 0;
            while (_loc3_ < _loc4_) {
                this.itemSelected(this._proposedSelectedIndices[_loc3_], true);
                _loc3_++;
            }
        }
        this._proposedSelectedIndices = new Vector.<int>();
    }

    override protected function itemSelected(param1: int, param2: Boolean): void {
        super.itemSelected(param1, param2);
        var _loc3_: Object = !!dataGroup ? dataGroup.getElementAt(param1) : null;
        if (_loc3_ is IItemRenderer) {
            IItemRenderer(_loc3_).selected = param2;
        }
    }

    override protected function itemShowingCaret(param1: int, param2: Boolean): void {
        super.itemShowingCaret(param1, param2);
        var _loc3_: Object = !!dataGroup ? dataGroup.getElementAt(param1) : null;
        if (_loc3_ is IItemRenderer) {
            IItemRenderer(_loc3_).showsCaret = param2;
        }
    }

    private function ensureCaretVisibility(param1: int): void {
        mx_internal::setSelectedIndex(param1, false);
        this.ensureIndexIsVisible(param1);
    }

    private function restoreCaretScrollPosition(param1: int, param2: Number, param3: Number): void {
        var _loc4_: IVisualElement;
        if (!(_loc4_ = dataGroup.getElementAt(param1))) {
            return;
        }
        var _loc5_: Number = Number(_loc4_.getLayoutBoundsX()) - 0;
        var _loc6_: Number = Number(_loc4_.getLayoutBoundsY()) - 0;
        dataGroup.verticalScrollPosition += _loc6_ - param3;
        dataGroup.horizontalScrollPosition += _loc5_ - param2;
    }

    override mx_internal function dataProviderRefreshed(): void {
        var newCaretIndex: int = 0;
        var caretItemRenderer: IVisualElement = null;
        var caretItemRendererX: Number = NaN;
        var caretItemRendererY: Number = NaN;
        var caretOffsetX: Number = NaN;
        var caretOffsetY: Number = NaN;
        var updateCompleteListenerA: Function = null;
        var updateCompleteListenerB: Function = null;
        if (mx_internal::caretItem !== undefined && dataGroup && false) {
            newCaretIndex = dataGroup.dataProvider.getItemIndex(mx_internal::caretItem);
            caretItemRenderer = dataGroup.getElementAt(caretIndex);
            if (newCaretIndex != -1 && Boolean(dataGroup.mx_internal::isElementVisible(caretItemRenderer))) {
                caretItemRendererX = Number(caretItemRenderer.getLayoutBoundsX());
                caretItemRendererY = Number(caretItemRenderer.getLayoutBoundsY());
                caretOffsetX = caretItemRendererX - 0;
                caretOffsetY = caretItemRendererY - 0;
                updateCompleteListenerA = function (): void {
                    dataGroup.removeEventListener(FlexEvent.UPDATE_COMPLETE, updateCompleteListenerA);
                    ensureCaretVisibility(newCaretIndex);
                    dataGroup.addEventListener(FlexEvent.UPDATE_COMPLETE, updateCompleteListenerB);
                };
                updateCompleteListenerB = function (): void {
                    dataGroup.removeEventListener(FlexEvent.UPDATE_COMPLETE, updateCompleteListenerB);
                    restoreCaretScrollPosition(newCaretIndex, caretOffsetX, caretOffsetY);
                };
                dataGroup.addEventListener(FlexEvent.UPDATE_COMPLETE, updateCompleteListenerA);
                return;
            }
        }
        super.mx_internal::dataProviderRefreshed();
    }

    override mx_internal function isItemIndexSelected(param1: int): Boolean {
        if (this.allowMultipleSelection && this.selectedIndices != null) {
            return this.selectedIndices.indexOf(param1) != -1;
        }
        return super.mx_internal::isItemIndexSelected(param1);
    }

    override public function styleChanged(param1: String): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        super.styleChanged(param1);
        var _loc2_: Boolean = param1 == null || param1 == "styleName";
        if (this.scroller) {
            _loc3_ = getStyle("verticalScrollPolicy");
            if (param1 == "verticalScrollPolicy") {
                this.scroller.setStyle("verticalScrollPolicy", _loc3_);
            } else if (_loc2_ && _loc3_ && _loc3_ !== ScrollPolicy.AUTO) {
                this.scroller.setStyle("verticalScrollPolicy", _loc3_);
            }
            _loc4_ = getStyle("horizontalScrollPolicy");
            if (param1 == "horizontalScrollPolicy") {
                this.scroller.setStyle("horizontalScrollPolicy", _loc4_);
            } else if (_loc2_ && _loc4_ && _loc4_ !== ScrollPolicy.AUTO) {
                this.scroller.setStyle("horizontalScrollPolicy", _loc4_);
            }
        }
    }

    private function getLastSelectedIndex(): int {
        if (Boolean(this.selectedIndices) && this.selectedIndices.length > 0) {
            return this.selectedIndices[this.selectedIndices.length - 1];
        }
        return 0;
    }

    private function getFirstItemValue(param1: Vector.<int>): int {
        if (Boolean(param1) && param1.length > 0) {
            return param1[0];
        }
        return -1;
    }

    private function isEmpty(param1: Vector.<int>): Boolean {
        return param1 == null || param1.length == 0;
    }

    protected function calculateSelectedIndices(param1: int, param2: Boolean, param3: Boolean): Vector.<int> {
        var _loc4_: int = 0;
        var _loc6_: Boolean = false;
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        var _loc5_: Vector.<int> = new Vector.<int>();
        if (!param2) {
            if (param3 || getStyle("interactionMode") == InteractionMode.TOUCH) {
                if (!this.isEmpty(this.selectedIndices)) {
                    if (this.selectedIndices.length == 1 && this.selectedIndices[0] == param1) {
                        if (!requireSelection) {
                            return _loc5_;
                        }
                        _loc5_.splice(0, 0, this.selectedIndices[0]);
                        return _loc5_;
                    }
                    _loc6_ = false;
                    _loc4_ = 0;
                    while (_loc4_ < this._selectedIndices.length) {
                        if (this._selectedIndices[_loc4_] == param1) {
                            _loc6_ = true;
                        } else if (this._selectedIndices[_loc4_] != param1) {
                            _loc5_.splice(0, 0, this._selectedIndices[_loc4_]);
                        }
                        _loc4_++;
                    }
                    if (!_loc6_) {
                        _loc5_.splice(0, 0, param1);
                    }
                    return _loc5_;
                }
                _loc5_.splice(0, 0, param1);
                return _loc5_;
            }
            _loc5_.splice(0, 0, param1);
            return _loc5_;
        }
        _loc7_ = !this.isEmpty(this.selectedIndices) ? this.selectedIndices[this.selectedIndices.length - 1] : 0;
        _loc8_ = param1;
        if (_loc7_ < _loc8_) {
            _loc4_ = _loc7_;
            while (_loc4_ <= _loc8_) {
                _loc5_.splice(0, 0, _loc4_);
                _loc4_++;
            }
        } else {
            _loc4_ = _loc7_;
            while (_loc4_ >= _loc8_) {
                _loc5_.splice(0, 0, _loc4_);
                _loc4_--;
            }
        }
        return _loc5_;
    }

    protected function dragStartHandler(param1: DragEvent): void {
        if (param1.isDefaultPrevented()) {
            return;
        }
        var _loc2_: DragSource = new DragSource();
        this.addDragData(_loc2_);
        DragManager.doDrag(this, _loc2_, param1, this.createDragIndicator(), 0, 0, 0.5, this.dragMoveEnabled);
    }

    private function compareValues(param1: int, param2: int): int {
        return param1 - param2;
    }

    protected function dragCompleteHandler(param1: DragEvent): void {
        if (param1.isDefaultPrevented()) {
            return;
        }
        if (!this.dragMoveEnabled || param1.action != DragManager.MOVE || param1.relatedObject == this) {
            return;
        }
        var _loc2_: Vector.<int> = this.selectedIndices;
        this.mx_internal::setSelectedIndices(new Vector.<int>(), true);
        validateProperties();
        _loc2_.sort(this.compareValues);
        var _loc3_: int = _loc2_.length;
        var _loc4_: int = _loc3_ - 1;
        while (_loc4_ >= 0) {
            dataProvider.removeItemAt(_loc2_[_loc4_]);
            _loc4_--;
        }
    }

    public function createDragIndicator(): IFlexDisplayObject {
        var _loc1_: * = null;
        var _loc2_: Class = Class(getStyle("dragIndicatorClass"));
        if (_loc2_) {
            _loc1_ = new _loc2_();
            if (_loc1_ is IVisualElement) {
                IVisualElement(_loc1_).owner = this;
            }
        }
        return _loc1_;
    }

    public function addDragData(param1: DragSource): void {
        param1.addHandler(this.copySelectedItemsForDragDrop, "itemsByIndex");
        var _loc2_: int = 0;
        var _loc3_: Vector.<int> = this.selectedIndices;
        var _loc4_: int = _loc3_.length;
        var _loc5_: int = 0;
        while (_loc5_ < _loc4_) {
            if (this.mx_internal::mouseDownIndex > _loc3_[_loc5_]) {
                _loc2_++;
            }
            _loc5_++;
        }
        param1.addData(_loc2_, "caretIndex");
    }

    private function copySelectedItemsForDragDrop(): Vector.<Object> {
        var _loc1_: Vector.<int> = this.selectedIndices.slice(0, this.selectedIndices.length);
        var _loc2_: Vector.<Object> = new Vector.<Object>(_loc1_.length);
        _loc1_.sort(this.compareValues);
        var _loc3_: int = _loc1_.length;
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_) {
            _loc2_[_loc4_] = dataProvider.getItemAt(_loc1_[_loc4_]);
            _loc4_++;
        }
        return _loc2_;
    }

    protected function item_mouseDownHandler(param1: MouseEvent): void {
        var _loc2_: int = 0;
        if (param1.isDefaultPrevented()) {
            return;
        }
        if (param1.currentTarget is IItemRenderer) {
            _loc2_ = int(IItemRenderer(param1.currentTarget).itemIndex);
        } else {
            _loc2_ = dataGroup.getElementIndex(param1.currentTarget as IVisualElement);
        }
        if (!this.allowMultipleSelection) {
            if (param1.ctrlKey && selectedIndex == _loc2_ || getStyle("interactionMode") == InteractionMode.TOUCH) {
                if (!this.dragEnabled && getStyle("interactionMode") != InteractionMode.TOUCH) {
                    mx_internal::setSelectedIndex(NO_SELECTION, true);
                } else {
                    this.mx_internal::pendingSelectionOnMouseUp = true;
                    this.mx_internal::pendingSelectionCtrlKey = param1.ctrlKey;
                    this.mx_internal::pendingSelectionShiftKey = param1.shiftKey;
                }
            } else {
                mx_internal::setSelectedIndex(_loc2_, true);
            }
        } else if (this.mx_internal::isItemIndexSelected(_loc2_) || getStyle("interactionMode") == InteractionMode.TOUCH) {
            this.mx_internal::pendingSelectionOnMouseUp = true;
            this.mx_internal::pendingSelectionShiftKey = param1.shiftKey;
            this.mx_internal::pendingSelectionCtrlKey = param1.ctrlKey;
        } else {
            this.mx_internal::setSelectedIndices(this.calculateSelectedIndices(_loc2_, param1.shiftKey, param1.ctrlKey), true);
        }
        if (!this.mx_internal::pendingSelectionOnMouseUp) {
            validateProperties();
        }
        this.mx_internal::mouseDownPoint = param1.target.localToGlobal(new Point(param1.localX, param1.localY));
        this.mx_internal::mouseDownObject = param1.target as DisplayObject;
        this.mx_internal::mouseDownIndex = _loc2_;
        var _loc3_: Boolean = this.dragEnabled && getStyle("interactionMode") == InteractionMode.MOUSE && Boolean(this.selectedIndices) && this.selectedIndices.indexOf(_loc2_) != -1;
        if (_loc3_) {
            systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler, false, 0, true);
        }
        if (this.mx_internal::pendingSelectionOnMouseUp || _loc3_) {
            systemManager.getSandboxRoot().addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.mouseUpHandler, false, 0, true);
            systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler, false, 0, true);
        }
    }

    protected function mouseMoveHandler(param1: MouseEvent): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        if (!this.mx_internal::mouseDownPoint || !this.dragEnabled) {
            return;
        }
        var _loc2_: Point = new Point(param1.localX, param1.localY);
        _loc2_ = DisplayObject(param1.target).localToGlobal(_loc2_);
        if (Math.abs(this.mx_internal::mouseDownPoint.x - _loc2_.x) > 5 || Math.abs(this.mx_internal::mouseDownPoint.y - _loc2_.y) > 5) {
            (_loc4_ = new DragEvent(DragEvent.DRAG_START)).dragInitiator = this;
            _loc5_ = this.globalToLocal(this.mx_internal::mouseDownPoint);
            _loc4_.localX = _loc5_.x;
            _loc4_.localY = _loc5_.y;
            _loc4_.buttonDown = true;
            dispatchEvent(_loc4_);
            this.removeMouseHandlersForDragStart(param1);
        }
    }

    private function removeMouseHandlersForDragStart(param1: Event): void {
        var _loc2_: Boolean = false;
        if (this.mx_internal::pendingSelectionOnMouseUp && true) {
            if (getStyle("interactionMode") == InteractionMode.TOUCH) {
                _loc2_ = param1.target == this.mx_internal::mouseDownObject || this.mx_internal::mouseDownObject is DisplayObjectContainer && Boolean(DisplayObjectContainer(this.mx_internal::mouseDownObject).contains(param1.target as DisplayObject));
                if (_loc2_) {
                    if (this.allowMultipleSelection) {
                        this.mx_internal::setSelectedIndices(this.calculateSelectedIndices(this.mx_internal::mouseDownIndex, this.mx_internal::pendingSelectionShiftKey, this.mx_internal::pendingSelectionCtrlKey), true);
                    } else {
                        mx_internal::setSelectedIndex(this.mx_internal::mouseDownIndex, true);
                    }
                }
            } else if (this.allowMultipleSelection) {
                this.mx_internal::setSelectedIndices(this.calculateSelectedIndices(this.mx_internal::mouseDownIndex, this.mx_internal::pendingSelectionShiftKey, this.mx_internal::pendingSelectionCtrlKey), true);
            } else {
                mx_internal::setSelectedIndex(NO_SELECTION, true);
            }
        }
        this.mx_internal::pendingSelectionOnMouseUp = false;
        this.mx_internal::mouseDownPoint = null;
        this.mx_internal::mouseDownObject = null;
        this.mx_internal::mouseDownIndex = -1;
        systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler, false);
        systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler, false);
        systemManager.getSandboxRoot().removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.mouseUpHandler, false);
    }

    protected function mouseUpHandler(param1: Event): void {
        this.removeMouseHandlersForDragStart(param1);
    }

    private function calculateDropLocation(param1: DragEvent): DropLocation {
        if (!enabled || !param1.dragSource.hasFormat("itemsByIndex")) {
            return null;
        }
        return layout.calculateDropLocation(param1);
    }

    public function createDropIndicator(): DisplayObject {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (false) {
            return layout.dropIndicator;
        }
        if (this.dropIndicator) {
            _loc1_ = DisplayObject(createDynamicPartInstance("dropIndicator"));
        } else {
            _loc2_ = Class(getStyle("dropIndicatorSkin"));
            if (_loc2_) {
                _loc1_ = new _loc2_();
            }
        }
        if (_loc1_ is IVisualElement) {
            IVisualElement(_loc1_).owner = this;
        }
        layout.dropIndicator = _loc1_;
        return _loc1_;
    }

    public function destroyDropIndicator(): DisplayObject {
        var _loc1_: DisplayObject = layout.dropIndicator;
        if (!_loc1_) {
            return null;
        }
        layout.dropIndicator = null;
        var _loc2_: int = numDynamicParts("dropIndicator");
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            if (_loc1_ == getDynamicPartAt("dropIndicator", _loc3_)) {
                removeDynamicPartInstance("dropIndicator", _loc1_);
                break;
            }
            _loc3_++;
        }
        return _loc1_;
    }

    protected function dragEnterHandler(param1: DragEvent): void {
        if (param1.isDefaultPrevented()) {
            return;
        }
        var _loc2_: DropLocation = this.calculateDropLocation(param1);
        if (_loc2_) {
            DragManager.acceptDragDrop(this);
            this.createDropIndicator();
            mx_internal::drawFocusAnyway = true;
            drawFocus(true);
            DragManager.showFeedback(param1.ctrlKey ? "null" : DragManager.MOVE);
            layout.showDropIndicator(_loc2_);
        } else {
            DragManager.showFeedback(DragManager.NONE);
        }
    }

    protected function dragOverHandler(param1: DragEvent): void {
        if (param1.isDefaultPrevented()) {
            return;
        }
        var _loc2_: DropLocation = this.calculateDropLocation(param1);
        if (_loc2_) {
            mx_internal::drawFocusAnyway = true;
            drawFocus(true);
            DragManager.showFeedback(param1.ctrlKey ? "null" : DragManager.MOVE);
            layout.showDropIndicator(_loc2_);
        } else {
            layout.hideDropIndicator();
            drawFocus(false);
            mx_internal::drawFocusAnyway = false;
            DragManager.showFeedback(DragManager.NONE);
        }
    }

    protected function dragExitHandler(param1: DragEvent): void {
        if (param1.isDefaultPrevented()) {
            return;
        }
        layout.hideDropIndicator();
        drawFocus(false);
        mx_internal::drawFocusAnyway = false;
        this.destroyDropIndicator();
    }

    private function touchInteractionStartHandler(param1: TouchInteractionEvent): void {
        this.mx_internal::mouseDownIndex = -1;
        this.mx_internal::mouseDownObject = null;
        this.mx_internal::mouseDownPoint = null;
        this.mx_internal::pendingSelectionOnMouseUp = false;
    }

    protected function dragDropHandler(param1: DragEvent): void {
        var _loc10_: int = 0;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: int = 0;
        if (param1.isDefaultPrevented()) {
            return;
        }
        layout.hideDropIndicator();
        this.destroyDropIndicator();
        drawFocus(false);
        mx_internal::drawFocusAnyway = false;
        var _loc2_: DropLocation = this.calculateDropLocation(param1);
        if (!_loc2_) {
            return;
        }
        var _loc3_: int = _loc2_.dropIndex;
        DragManager.showFeedback(param1.ctrlKey ? "null" : DragManager.MOVE);
        var _loc4_: DragSource;
        var _loc5_: Vector.<Object> = (_loc4_ = param1.dragSource).dataForFormat("itemsByIndex") as Vector.<Object>;
        var _loc6_: int = -1;
        if (_loc4_.hasFormat("caretIndex")) {
            _loc6_ = param1.dragSource.dataForFormat("caretIndex") as int;
        }
        var _loc7_: Vector.<int> = this.selectedIndices;
        this.mx_internal::setSelectedIndices(new Vector.<int>(), false);
        validateProperties();
        if (this.dragMoveEnabled && param1.action == DragManager.MOVE && param1.dragInitiator == this) {
            _loc7_.sort(this.compareValues);
            _loc10_ = _loc7_.length - 1;
            while (_loc10_ >= 0) {
                if (_loc7_[_loc10_] < _loc3_) {
                    _loc3_--;
                }
                dataProvider.removeItemAt(_loc7_[_loc10_]);
                _loc10_--;
            }
        }
        var _loc8_: Vector.<int> = new Vector.<int>();
        if (_loc6_ != -1) {
            _loc8_.push(_loc3_ + _loc6_);
        }
        if (!dataProvider) {
            this.dataProvider = new ArrayCollection();
        }
        var _loc9_: * = param1.action == DragManager.COPY;
        _loc10_ = 0;
        while (_loc10_ < _loc5_.length) {
            _loc11_ = _loc5_[_loc10_];
            if (_loc9_) {
                _loc11_ = this.copyItemWithUID(_loc11_);
            }
            dataProvider.addItemAt(_loc11_, _loc3_ + _loc10_);
            if (_loc10_ != _loc6_) {
                _loc8_.push(_loc3_ + _loc10_);
            }
            _loc10_++;
        }
        this.mx_internal::setSelectedIndices(_loc8_, false);
        if (_loc6_ != -1) {
            _loc13_ = 0;
            while (_loc13_++ < 10) {
                validateNow();
                if (!(_loc12_ = layout.getScrollPositionDeltaToElement(_loc3_ + _loc6_)) || _loc12_.x == 0 && _loc12_.y == 0) {
                    break;
                }
                layout.horizontalScrollPosition += _loc12_.x;
                layout.verticalScrollPosition += _loc12_.y;
            }
        }
    }

    protected function copyItemWithUID(param1: Object): Object {
        var _loc2_: Object = ObjectUtil.copy(param1);
        if (_loc2_ is IUID) {
            IUID(_loc2_).uid = UIDUtil.createUID();
        } else if (_loc2_ is Object && "mx_internal_uid" in _loc2_) {
            _loc2_.mx_internal_uid = UIDUtil.createUID();
        }
        return _loc2_;
    }

    override protected function dataGroup_rendererAddHandler(param1: RendererExistenceEvent): void {
        super.dataGroup_rendererAddHandler(param1);
        var _loc2_: IVisualElement = param1.renderer;
        if (!_loc2_) {
            return;
        }
        _loc2_.addEventListener(MouseEvent.MOUSE_DOWN, this.item_mouseDownHandler);
    }

    override protected function dataGroup_rendererRemoveHandler(param1: RendererExistenceEvent): void {
        super.dataGroup_rendererRemoveHandler(param1);
        var _loc2_: Object = param1.renderer;
        if (!_loc2_) {
            return;
        }
        _loc2_.removeEventListener(MouseEvent.MOUSE_DOWN, this.item_mouseDownHandler);
    }

    public function ensureIndexIsVisible(param1: int): void {
        if (!layout) {
            return;
        }
        var _loc2_: Point = dataGroup.layout.getScrollPositionDeltaToElement(param1);
        if (_loc2_) {
            dataGroup.horizontalScrollPosition += _loc2_.x;
            dataGroup.verticalScrollPosition += _loc2_.y;
        }
    }

    override protected function adjustSelection(param1: int, param2: Boolean = false): void {
        var _loc3_: int = 0;
        var _loc4_: Number = NaN;
        var _loc6_: * = null;
        var _loc8_: Number = NaN;
        var _loc5_: Vector.<int> = new Vector.<int>();
        if (selectedIndex == NO_SELECTION || Boolean(mx_internal::doingWholesaleChanges)) {
            if (dataProvider && false && requireSelection) {
                _loc5_.push(0);
                this._selectedIndices = _loc5_;
                mx_internal::_selectedIndex = 0;
                this.itemShowingCaret(0, true);
                dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
                (_loc6_ = new IndexChangeEvent(IndexChangeEvent.CARET_CHANGE)).oldIndex = -1;
                _loc6_.newIndex = mx_internal::_caretIndex;
                dispatchEvent(_loc6_);
            }
            return;
        }
        if (!this.selectedIndices && selectedIndex > NO_SELECTION || selectedIndex > NO_SELECTION && this.selectedIndices.indexOf(selectedIndex) == -1) {
            this.commitSelection();
        }
        if (param2) {
            _loc3_ = 0;
            while (_loc3_ < this.selectedIndices.length) {
                if ((_loc4_ = this.selectedIndices[_loc3_]) >= param1) {
                    _loc5_.push(_loc4_ + 1);
                } else {
                    _loc5_.push(_loc4_);
                }
                _loc3_++;
            }
        } else if (!this.isEmpty(this.selectedIndices) && this.selectedIndices.length == 1 && param1 == selectedIndex && requireSelection) {
            if (false) {
                _loc5_ = new Vector.<int>();
            } else {
                mx_internal::_proposedSelectedIndex = 0;
                invalidateProperties();
                if (param1 == 0) {
                    return;
                }
                _loc5_.push(0);
            }
        } else {
            _loc3_ = 0;
            while (_loc3_ < this.selectedIndices.length) {
                if ((_loc4_ = this.selectedIndices[_loc3_]) > param1) {
                    _loc5_.push(_loc4_ - 1);
                } else if (_loc4_ < param1) {
                    _loc5_.push(_loc4_);
                }
                _loc3_++;
            }
        }
        if (caretIndex == selectedIndex) {
            _loc8_ = caretIndex;
            mx_internal::_caretIndex = this.getFirstItemValue(_loc5_);
            (_loc6_ = new IndexChangeEvent(IndexChangeEvent.CARET_CHANGE)).oldIndex = _loc8_;
            _loc6_.newIndex = caretIndex;
            dispatchEvent(_loc6_);
        } else {
            this.itemShowingCaret(caretIndex, false);
            mx_internal::caretIndexAdjusted = true;
            invalidateProperties();
        }
        var _loc7_: Vector.<int> = this.selectedIndices;
        this._selectedIndices = _loc5_;
        mx_internal::_selectedIndex = this.getFirstItemValue(_loc5_);
        if (this._selectedIndices != _loc7_) {
            mx_internal::selectedIndexAdjusted = true;
            invalidateProperties();
        }
    }

    mx_internal function findKey(param1: int): Boolean {
        var _loc2_: int = param1;
        return _loc2_ >= 33 && _loc2_ <= 126 && this.mx_internal::findString(String.fromCharCode(_loc2_));
    }

    mx_internal function findString(param1: String): Boolean {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: Number = NaN;
        if (!dataProvider || false) {
            return false;
        }
        if (selectedIndex == NO_SELECTION || selectedIndex == mx_internal::CUSTOM_SELECTED_ITEM) {
            _loc2_ = 0;
            _loc3_ = 0;
            _loc4_ = this.mx_internal::findStringLoop(param1, _loc2_, _loc3_);
        } else {
            _loc2_ = selectedIndex + 1;
            _loc3_ = 0;
            if ((_loc4_ = this.mx_internal::findStringLoop(param1, _loc2_, _loc3_)) == -1) {
                _loc4_ = this.mx_internal::findStringLoop(param1, 0, selectedIndex);
            }
        }
        if (_loc4_ != -1) {
            mx_internal::setSelectedIndex(_loc4_, true);
            this.ensureIndexIsVisible(_loc4_);
            return true;
        }
        return false;
    }

    mx_internal function findStringLoop(param1: String, param2: int, param3: int): Number {
        var _loc4_: * = null;
        while (param2 != param3) {
            _loc4_ = (_loc4_ = itemToLabel(dataProvider.getItemAt(param2))).substring(0, param1.length);
            if (param1 == _loc4_ || param1.toUpperCase() == _loc4_.toUpperCase()) {
                return param2;
            }
            param2++;
        }
        return -1;
    }

    override protected function keyDownHandler(param1: KeyboardEvent): void {
        super.keyDownHandler(param1);
        if (!dataProvider || !layout || param1.isDefaultPrevented()) {
            return;
        }
        if (this.isEditableTarget(param1.target)) {
            return;
        }
        var _loc2_: * = getStyle("interactionMode") == InteractionMode.TOUCH;
        if (param1.keyCode == Keyboard.SPACE || _loc2_ && param1.keyCode == Keyboard.ENTER) {
            if (this.allowMultipleSelection) {
                this.mx_internal::setSelectedIndices(this.calculateSelectedIndices(caretIndex, param1.shiftKey, param1.ctrlKey), true, false);
            } else if (caretIndex == selectedIndex && (param1.ctrlKey || _loc2_)) {
                mx_internal::setSelectedIndex(NO_SELECTION, true, false);
            } else {
                mx_internal::setSelectedIndex(caretIndex, true, false);
            }
            param1.preventDefault();
            return;
        }
        if (this.mx_internal::findKey(param1.charCode)) {
            param1.preventDefault();
            return;
        }
        this.adjustSelectionAndCaretUponNavigation(param1);
    }

    protected function adjustSelectionAndCaretUponNavigation(param1: KeyboardEvent): void {
        var _loc4_: Number = NaN;
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc7_: Number = NaN;
        var _loc8_: * = null;
        var _loc2_: uint = uint(mx_internal::mapKeycodeForLayoutDirection(param1));
        if (!NavigationUnit.isNavigationUnit(param1.keyCode)) {
            return;
        }
        var _loc3_: int = layout.getNavigationDestinationIndex(caretIndex, _loc2_, arrowKeysWrapFocus);
        if (_loc3_ == -1) {
            return;
        }
        param1.preventDefault();
        if (this.allowMultipleSelection && param1.shiftKey && Boolean(this.selectedIndices)) {
            _loc4_ = this.getLastSelectedIndex();
            _loc5_ = new Vector.<int>();
            if (_loc4_ <= _loc3_) {
                _loc6_ = _loc4_;
                while (_loc6_ <= _loc3_) {
                    _loc5_.splice(0, 0, _loc6_);
                    _loc6_++;
                }
            } else {
                _loc6_ = _loc4_;
                while (_loc6_ >= _loc3_) {
                    _loc5_.splice(0, 0, _loc6_);
                    _loc6_--;
                }
            }
            this.mx_internal::setSelectedIndices(_loc5_, true);
            this.ensureIndexIsVisible(_loc3_);
        } else if (param1.ctrlKey || getStyle("interactionMode") == InteractionMode.TOUCH) {
            _loc7_ = caretIndex;
            mx_internal::setCurrentCaretIndex(_loc3_);
            (_loc8_ = new IndexChangeEvent(IndexChangeEvent.CARET_CHANGE)).oldIndex = _loc7_;
            _loc8_.newIndex = caretIndex;
            dispatchEvent(_loc8_);
            this.ensureIndexIsVisible(_loc3_);
        } else {
            mx_internal::setSelectedIndex(_loc3_, true);
            this.ensureIndexIsVisible(_loc3_);
        }
    }

    protected function isEditableTarget(param1: Object): Boolean {
        var _loc2_: Object = getFocus();
        return _loc2_ is TextField && _loc2_.type == "input" || this.richEditableTextClass && _loc2_ is this.richEditableTextClass && _loc2_.editable == true;
    }
}
}
