package spark.components {

import flash.display.DisplayObject;
import flash.events.Event;
import flash.geom.PerspectiveProjection;
import flash.geom.Rectangle;
import flash.utils.Dictionary;
import flash.utils.getQualifiedClassName;

import mx.collections.IList;
import mx.core.IDataRenderer;
import mx.core.IFactory;
import mx.core.IInvalidating;
import mx.core.ILayoutElement;
import mx.core.IVisualElement;
import mx.core.mx_internal;
import mx.events.CollectionEvent;
import mx.events.CollectionEventKind;
import mx.events.PropertyChangeEvent;
import mx.managers.ILayoutManagerClient;
import mx.managers.LayoutManager;
import mx.utils.MatrixUtil;

import spark.components.supportClasses.GroupBase;
import spark.events.RendererExistenceEvent;
import spark.layouts.supportClasses.LayoutBase;

public class DataGroup extends GroupBase implements IItemRendererOwner {

    private static const LAYERING_ENABLED: uint = 1;

    private static const LAYERING_DIRTY: uint = 2;


    private var _layeringFlags: uint = 0;

    private var rendererToFactoryMap: Dictionary;

    private var freeRendererMap: Dictionary;

    private var addedVirtualRenderer: Boolean = false;

    private var _typicalItem: Object = null;

    private var explicitTypicalItem: Object = null;

    private var typicalItemChanged: Boolean = false;

    private var typicalLayoutElement: ILayoutElement = null;

    private var useVirtualLayoutChanged: Boolean = false;

    private var _itemRenderer: IFactory;

    private var itemRendererChanged: Boolean;

    private var _itemRendererFunction: Function;

    private var _rendererUpdateDelegate: IItemRendererOwner;

    private var _dataProvider: IList;

    private var dataProviderChanged: Boolean;

    private var renderersBeingUpdated: Boolean = false;

    private var indexToRenderer: Array;

    private var virtualRendererIndices: Vector.<int> = null;

    private var oldVirtualRendererIndices: Vector.<int> = null;

    private var virtualLayoutUnderway: Boolean = false;

    public function DataGroup() {
        this.rendererToFactoryMap = new Dictionary(true);
        this.freeRendererMap = new Dictionary();
        this.indexToRenderer = [];
        super();
        this._rendererUpdateDelegate = this;
    }

    private static function sortDecreasing(param1: int, param2: int): Number {
        return param2 - param1;
    }

    override public function get baselinePosition(): Number {
        if (!mx_internal::validateBaselinePosition()) {
            return NaN;
        }
        if (this.numElements == 0) {
            return super.baselinePosition;
        }
        return this.getElementAt(0).baselinePosition + this.getElementAt(0).y;
    }

    public function get typicalItem(): Object {
        return this._typicalItem;
    }

    public function set typicalItem(param1: Object): void {
        if (this._typicalItem === param1) {
            return;
        }
        this._typicalItem = this.explicitTypicalItem = param1;
        this.invalidateTypicalItemRenderer();
    }

    private function setTypicalLayoutElement(param1: ILayoutElement): void {
        this.typicalLayoutElement = param1;
        if (layout) {
            layout.typicalLayoutElement = param1;
        }
    }

    public function invalidateTypicalItemRenderer(): void {
        this.typicalItemChanged = true;
        invalidateProperties();
    }

    private function initializeTypicalItem(): void {
        if (this._typicalItem === null) {
            this.setTypicalLayoutElement(null);
            return;
        }
        var _loc1_: IVisualElement = this.createRendererForItem(this._typicalItem, false);
        var _loc2_: DisplayObject = DisplayObject(_loc1_);
        if (!_loc2_) {
            this.setTypicalLayoutElement(null);
            return;
        }
        super.addChild(_loc2_);
        this.setUpItemRenderer(_loc1_, 0, this._typicalItem);
        if (_loc2_ is IInvalidating) {
            IInvalidating(_loc2_).validateNow();
        }
        this.setTypicalLayoutElement(_loc1_);
        super.removeChild(_loc2_);
    }

    mx_internal function createItemRendererFor(param1: int): IVisualElement {
        var _loc2_: * = null;
        if (param1 < 0 || this.dataProvider == null || param1 >= this.dataProvider.length) {
            return null;
        }
        _loc2_ = this.dataProvider.getItemAt(param1);
        var _loc3_: IVisualElement = this.createRendererForItem(_loc2_);
        super.addChild(DisplayObject(_loc3_));
        this.setUpItemRenderer(_loc3_, param1, _loc2_);
        if (_loc3_ is IInvalidating) {
            IInvalidating(_loc3_).validateNow();
        }
        super.removeChild(DisplayObject(_loc3_));
        return _loc3_;
    }

    private function ensureTypicalLayoutElement(): void {
        var _loc2_: * = false;
        if (false) {
            return;
        }
        var _loc1_: IList = this.dataProvider;
        if (Boolean(_loc1_) && _loc1_.length > 0) {
            this._typicalItem = _loc1_.getItemAt(0);
            _loc2_ = getQualifiedClassName(this._typicalItem) == "flashx.textLayout.elements::TextFlow";
            if (_loc2_) {
                this._typicalItem = this._typicalItem["deepCopy"]();
            }
            this.initializeTypicalItem();
        }
    }

    override public function set layout(param1: LayoutBase): void {
        var _loc2_: LayoutBase = layout;
        if (param1 == _loc2_) {
            return;
        }
        if (_loc2_) {
            _loc2_.typicalLayoutElement = null;
            _loc2_.removeEventListener("useVirtualLayoutChanged", this.layout_useVirtualLayoutChangedHandler);
        }
        if (Boolean(_loc2_) && Boolean(param1) && _loc2_.useVirtualLayout != param1.useVirtualLayout) {
            this.changeUseVirtualLayout();
        }
        super.layout = param1;
        if (param1) {
            if (this.typicalLayoutElement) {
                param1.typicalLayoutElement = this.typicalLayoutElement;
            } else {
                this.typicalLayoutElement = param1.typicalLayoutElement;
            }
            param1.addEventListener("useVirtualLayoutChanged", this.layout_useVirtualLayoutChangedHandler);
        }
    }

    private function changeUseVirtualLayout(): void {
        this.removeDataProviderListener();
        this.removeAllItemRenderers();
        this.useVirtualLayoutChanged = true;
        invalidateProperties();
    }

    private function layout_useVirtualLayoutChangedHandler(param1: Event): void {
        this.changeUseVirtualLayout();
    }

    public function get itemRenderer(): IFactory {
        return this._itemRenderer;
    }

    public function set itemRenderer(param1: IFactory): void {
        this._itemRenderer = param1;
        this.removeDataProviderListener();
        this.removeAllItemRenderers();
        invalidateProperties();
        this.itemRendererChanged = true;
        this.typicalItemChanged = true;
    }

    public function get itemRendererFunction(): Function {
        return this._itemRendererFunction;
    }

    public function set itemRendererFunction(param1: Function): void {
        this._itemRendererFunction = param1;
        this.removeDataProviderListener();
        this.removeAllItemRenderers();
        invalidateProperties();
        this.itemRendererChanged = true;
        this.typicalItemChanged = true;
    }

    mx_internal function get rendererUpdateDelegate(): IItemRendererOwner {
        return this._rendererUpdateDelegate;
    }

    mx_internal function set rendererUpdateDelegate(param1: IItemRendererOwner): void {
        this._rendererUpdateDelegate = param1;
    }

    [Bindable("dataProviderChanged")]
    public function get dataProvider(): IList {
        return this._dataProvider;
    }

    public function set dataProvider(param1: IList): void {
        if (this._dataProvider == param1) {
            return;
        }
        this.removeDataProviderListener();
        this._dataProvider = param1;
        this.dataProviderChanged = true;
        invalidateProperties();
        dispatchEvent(new Event("dataProviderChanged"));
    }

    private function removeRendererAt(param1: int): void {
        var _loc3_: * = null;
        var _loc2_: IVisualElement = this.indexToRenderer[param1] as IVisualElement;
        if (_loc2_) {
            if (_loc2_ is IDataRenderer && (this.itemRenderer != null || this.itemRendererFunction != null)) {
                _loc3_ = IDataRenderer(_loc2_).data;
            } else {
                _loc3_ = _loc2_;
            }
            this.mx_internal::itemRemoved(_loc3_, param1);
        }
    }

    private function removeAllItemRenderers(): void {
        var _loc1_: int = 0;
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (this.indexToRenderer.length == 0) {
            return;
        }
        if (Boolean(this.virtualRendererIndices) && this.virtualRendererIndices.length > 0) {
            for each(_loc1_ in this.virtualRendererIndices.concat().sort(sortDecreasing)) {
                this.removeRendererAt(_loc1_);
            }
            this.virtualRendererIndices.length = 0;
            this.oldVirtualRendererIndices.length = 0;
            _loc2_ = this.allFreeRenderers();
            for each(_loc3_ in _loc2_) {
                super.removeChild(_loc3_ as DisplayObject);
            }
            this.resetFreeRenderers();
        } else {
            _loc1_ = this.indexToRenderer.length - 1;
            while (_loc1_ >= 0) {
                this.removeRendererAt(_loc1_);
                _loc1_--;
            }
        }
        this.indexToRenderer = [];
        if (layout) {
            layout.clearVirtualLayoutCache();
            layout.typicalLayoutElement = null;
        }
    }

    public function itemToLabel(param1: Object): String {
        if (param1 !== null) {
            return param1.toString();
        }
        return " ";
    }

    public function getItemIndicesInView(): Vector.<int> {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc8_: * = null;
        if (Boolean(layout) && false) {
            return !!this.virtualRendererIndices ? this.virtualRendererIndices.concat() : new Vector.<int>(0);
        }
        if (!this.dataProvider) {
            return new Vector.<int>(0);
        }
        var _loc1_: Rectangle = scrollRect;
        var _loc2_: int = this.dataProvider.length;
        if (_loc1_) {
            _loc3_ = new Vector.<int>();
            _loc4_ = new Rectangle();
            _loc5_ = transform.perspectiveProjection;
            _loc6_ = 0;
            while (_loc6_ < _loc2_) {
                if (!(!(_loc7_ = this.getElementAt(_loc6_)) || !_loc7_.visible)) {
                    if (Boolean(_loc7_.hasLayoutMatrix3D) && Boolean(_loc5_)) {
                        _loc4_.x = 0;
                        _loc4_.y = 0;
                        _loc4_.width = _loc7_.getLayoutBoundsWidth(false);
                        _loc4_.height = _loc7_.getLayoutBoundsHeight(false);
                        MatrixUtil.projectBounds(_loc4_, _loc7_.getLayoutMatrix3D(), _loc5_);
                    } else {
                        _loc4_.x = _loc7_.getLayoutBoundsX();
                        _loc4_.y = _loc7_.getLayoutBoundsY();
                        _loc4_.width = _loc7_.getLayoutBoundsWidth();
                        _loc4_.height = _loc7_.getLayoutBoundsHeight();
                    }
                    if (_loc1_.intersects(_loc4_)) {
                        _loc3_.push(_loc6_);
                    }
                }
                _loc6_++;
            }
            return _loc3_;
        }
        _loc8_ = new Vector.<int>(_loc2_);
        _loc6_ = 0;
        while (_loc6_ < _loc2_) {
            _loc8_[_loc6_] = _loc6_;
            _loc6_++;
        }
        return _loc8_;
    }

    private function itemToRendererFactory(param1: Object): IFactory {
        if (this.itemRendererFunction != null) {
            return this.itemRendererFunction(param1);
        }
        return this.itemRenderer;
    }

    private function createRenderer(param1: IFactory): IVisualElement {
        var _loc2_: IVisualElement = param1.newInstance() as IVisualElement;
        this.rendererToFactoryMap[_loc2_] = param1;
        return _loc2_;
    }

    private function allocateRenderer(param1: IFactory): IVisualElement {
        var _loc3_: * = null;
        var _loc2_: Vector.<IVisualElement> = this.freeRendererMap[param1] as Vector.<IVisualElement>;
        if (_loc2_) {
            _loc3_ = _loc2_.pop();
            if (_loc2_.length == 0) {
                delete this.freeRendererMap[param1];
            }
            if (_loc3_) {
                return _loc3_;
            }
        }
        return null;
    }

    private function freeRenderer(param1: IVisualElement): void {
        if (!param1) {
            return;
        }
        var _loc2_: IFactory = this.rendererToFactoryMap[param1];
        if (!_loc2_) {
            return;
        }
        var _loc3_: Vector.<IVisualElement> = this.freeRendererMap[_loc2_];
        if (!_loc3_) {
            _loc3_ = new Vector.<IVisualElement>();
            this.freeRendererMap[_loc2_] = _loc3_;
        }
        _loc3_.push(param1);
    }

    private function allFreeRenderers(): Vector.<IVisualElement> {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc1_: Vector.<IVisualElement> = new Vector.<IVisualElement>();
        for each(_loc2_ in this.freeRendererMap) {
            for each(_loc3_ in _loc2_) {
                _loc1_.push(_loc3_);
            }
        }
        return _loc1_;
    }

    private function resetFreeRenderers(): void {
        this.rendererToFactoryMap = new Dictionary(true);
        this.freeRendererMap = new Dictionary();
    }

    private function throwCreateRendererFailedError(param1: Object): void {
        var _loc2_: * = null;
        if (this.itemIsRenderer(param1)) {
            _loc2_ = resourceManager.getString("components", "cannotDisplayVisualElement");
        } else {
            _loc2_ = resourceManager.getString("components", "unableToCreateRenderer", [param1]);
        }
        throw new Error(_loc2_);
    }

    private function itemIsRenderer(param1: Object): Boolean {
        return param1 is IVisualElement && param1 is DisplayObject;
    }

    private function createVirtualRendererForItem(param1: Object, param2: Boolean = true): IVisualElement {
        var _loc3_: * = null;
        var _loc4_: IFactory;
        if (_loc4_ = this.itemToRendererFactory(param1)) {
            _loc3_ = this.allocateRenderer(_loc4_);
        }
        if (!_loc3_ && Boolean(_loc4_)) {
            _loc3_ = this.createRenderer(_loc4_);
            this.addedVirtualRenderer = true;
        }
        if (!_loc3_ && this.itemIsRenderer(param1)) {
            _loc3_ = IVisualElement(param1);
            this.addedVirtualRenderer = true;
        }
        if (!_loc3_ && param2) {
            this.throwCreateRendererFailedError(param1);
        }
        return _loc3_;
    }

    private function createRendererForItem(param1: Object, param2: Boolean = true): IVisualElement {
        var _loc3_: * = null;
        var _loc4_: IFactory;
        if (_loc4_ = this.itemToRendererFactory(param1)) {
            _loc3_ = this.createRenderer(_loc4_);
        }
        if (!_loc3_ && this.itemIsRenderer(param1)) {
            _loc3_ = IVisualElement(param1);
        }
        if (!_loc3_ && param2) {
            this.throwCreateRendererFailedError(param1);
        }
        return _loc3_;
    }

    private function createItemRenderers(): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (!this.dataProvider) {
            this.removeAllItemRenderers();
            return;
        }
        if (Boolean(layout) && false) {
            if (this.virtualRendererIndices != null && this.virtualRendererIndices.length > 0) {
                this.startVirtualLayout();
                this.finishVirtualLayout();
            }
            this.invalidateSize();
            invalidateDisplayList();
            return;
        }
        var _loc1_: int = this.dataProvider.length;
        var _loc2_: int = this.indexToRenderer.length - 1;
        while (_loc2_ >= _loc1_) {
            this.removeRendererAt(_loc2_);
            _loc2_--;
        }
        _loc2_ = 0;
        while (_loc2_ < this.indexToRenderer.length) {
            _loc3_ = this.dataProvider.getItemAt(_loc2_);
            if ((Boolean(_loc4_ = this.indexToRenderer[_loc2_] as IVisualElement)) && (!this.itemIsRenderer(_loc3_) || _loc3_ == _loc4_)) {
                this.setUpItemRenderer(_loc4_, _loc2_, _loc3_);
            } else {
                this.removeRendererAt(_loc2_);
                this.mx_internal::itemAdded(_loc3_, _loc2_);
            }
            _loc2_++;
        }
        _loc2_ = this.indexToRenderer.length;
        while (_loc2_ < _loc1_) {
            this.mx_internal::itemAdded(this.dataProvider.getItemAt(_loc2_), _loc2_);
            _loc2_++;
        }
    }

    override protected function commitProperties(): void {
        if (this.itemRendererChanged || this.useVirtualLayoutChanged || this.dataProviderChanged) {
            this.itemRendererChanged = false;
            this.useVirtualLayoutChanged = false;
            if (layout) {
                layout.clearVirtualLayoutCache();
            }
            this.createItemRenderers();
            this.addDataProviderListener();
            if (this.dataProviderChanged) {
                this.dataProviderChanged = false;
                horizontalScrollPosition = 0;
                verticalScrollPosition = 0;
            }
            mx_internal::maskChanged = true;
        }
        super.commitProperties();
        if (this._layeringFlags & LAYERING_DIRTY) {
            if (Boolean(layout) && false) {
                invalidateDisplayList();
            } else {
                this.manageDisplayObjectLayers();
            }
        }
        if (this.typicalItemChanged) {
            this.typicalItemChanged = false;
            this.initializeTypicalItem();
        }
    }

    private function setUpItemRenderer(param1: IVisualElement, param2: int, param3: Object): void {
        if (!param1) {
            return;
        }
        this.renderersBeingUpdated = true;
        this._rendererUpdateDelegate.updateRenderer(param1, param2, param3);
        this.renderersBeingUpdated = false;
    }

    public function updateRenderer(param1: IVisualElement, param2: int, param3: Object): void {
        param1.owner = this;
        if (param1 is IItemRenderer) {
            IItemRenderer(param1).itemIndex = param2;
        }
        if (param1 is IItemRenderer) {
            IItemRenderer(param1).label = this.itemToLabel(param3);
        }
        if (param1 is IDataRenderer && param1 !== param3) {
            IDataRenderer(param1).data = param3;
        }
    }

    private function sortItemAt(param1: int, param2: Object, param3: int): int {
        var _loc4_: * = null;
        var _loc5_: Number;
        if ((_loc5_ = (_loc4_ = this.getElementAt(param1)).depth) != 0) {
            if (_loc5_ > 0) {
                if (param2.topLayerItems == null) {
                    param2.topLayerItems = new Vector.<IVisualElement>();
                }
                param2.topLayerItems.push(_loc4_);
            } else {
                if (param2.bottomLayerItems == null) {
                    param2.bottomLayerItems = new Vector.<IVisualElement>();
                }
                param2.bottomLayerItems.push(_loc4_);
            }
            return param3;
        }
        super.setChildIndex(_loc4_ as DisplayObject, param3);
        return param3 + 1;
    }

    private function manageDisplayObjectLayers(): void {
        var _loc5_: * = null;
        var _loc8_: int = 0;
        var _loc9_: int = 0;
        this._layeringFlags &= ~LAYERING_DIRTY;
        var _loc1_: * = 0;
        var _loc2_: * = {
            "topLayerItems": null,
            "bottomLayerItems": null
        };
        if (Boolean(layout) && false) {
            for each(_loc9_ in this.virtualRendererIndices) {
                _loc1_ = this.sortItemAt(_loc9_, _loc2_, _loc1_);
            }
        } else {
            _loc9_ = 0;
            while (_loc9_ < this.numElements) {
                _loc1_ = this.sortItemAt(_loc9_, _loc2_, _loc1_);
                _loc9_++;
            }
        }
        var _loc3_: Vector.<IVisualElement> = _loc2_.topLayerItems;
        var _loc4_: Vector.<IVisualElement> = _loc2_.bottomLayerItems;
        var _loc6_: Boolean = false;
        var _loc7_: int = this.numElements;
        if (_loc3_ != null) {
            _loc6_ = true;
            GroupBase.mx_internal::sortOnLayer(_loc3_);
            _loc7_ = _loc3_.length;
            _loc8_ = 0;
            while (_loc8_ < _loc7_) {
                _loc5_ = _loc3_[_loc8_];
                super.setChildIndex(_loc5_ as DisplayObject, _loc1_++);
                _loc8_++;
            }
        }
        if (_loc4_ != null) {
            _loc6_ = true;
            _loc1_ = 0;
            GroupBase.mx_internal::sortOnLayer(_loc4_);
            _loc7_ = _loc4_.length;
            _loc8_ = 0;
            while (_loc8_ < _loc7_) {
                _loc5_ = _loc4_[_loc8_];
                super.setChildIndex(_loc5_ as DisplayObject, _loc1_++);
                _loc8_++;
            }
        }
        if (_loc6_ == false) {
            this._layeringFlags &= ~LAYERING_ENABLED;
        }
    }

    override public function get numElements(): int {
        return !!this.dataProvider ? this.dataProvider.length : 0;
    }

    private function startVirtualLayout(): void {
        var _loc1_: int = 0;
        if (!this.virtualRendererIndices) {
            this.virtualRendererIndices = new Vector.<int>();
        }
        if (!this.oldVirtualRendererIndices) {
            this.oldVirtualRendererIndices = new Vector.<int>();
        }
        this.oldVirtualRendererIndices.length = 0;
        for each(_loc1_ in this.virtualRendererIndices) {
            this.oldVirtualRendererIndices.push(_loc1_);
        }
        this.virtualRendererIndices.length = 0;
        this.ensureTypicalLayoutElement();
    }

    private function finishVirtualLayout(): void {
        var _loc1_: int = 0;
        var _loc2_: Boolean = false;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (this.oldVirtualRendererIndices.length == 0) {
            return;
        }
        for each(_loc1_ in this.oldVirtualRendererIndices) {
            if (this.virtualRendererIndices.indexOf(_loc1_) == -1) {
                _loc3_ = this.indexToRenderer[_loc1_] as IVisualElement;
                delete this.indexToRenderer[_loc1_];
                if ((_loc4_ = this.dataProvider.length > _loc1_ ? this.dataProvider.getItemAt(_loc1_) : null) != _loc3_ && _loc3_ is IDataRenderer) {
                    _loc3_.includeInLayout = false;
                    _loc3_.visible = false;
                    this.freeRenderer(_loc3_);
                } else if (_loc3_) {
                    dispatchEvent(new RendererExistenceEvent(RendererExistenceEvent.RENDERER_REMOVE, false, false, _loc3_, _loc1_, _loc4_));
                    super.removeChild(DisplayObject(_loc3_));
                }
            }
        }
        _loc2_ = false;
        for each(_loc1_ in this.virtualRendererIndices) {
            _loc3_ = this.indexToRenderer[_loc1_] as IVisualElement;
            if (!(!_loc3_ || !_loc3_.visible || !_loc3_.includeInLayout)) {
                if (!(_loc3_.width == 0 || _loc3_.height == 0)) {
                    if (_loc3_.depth != 0) {
                        _loc2_ = true;
                        break;
                    }
                }
            }
        }
        if (_loc2_) {
            this.manageDisplayObjectLayers();
        }
    }

    mx_internal function clearFreeRenderers(): void {
        this.resetFreeRenderers();
    }

    override public function invalidateSize(): void {
        if (!this.virtualLayoutUnderway) {
            super.invalidateSize();
        }
    }

    override protected function measure(): void {
        if (Boolean(layout) && false) {
            this.ensureTypicalLayoutElement();
        }
        super.measure();
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        mx_internal::drawBackground();
        if (Boolean(layout) && false) {
            this.virtualLayoutUnderway = true;
            this.startVirtualLayout();
        }
        super.updateDisplayList(param1, param2);
        if (this.virtualLayoutUnderway) {
            this.finishVirtualLayout();
            this.virtualLayoutUnderway = false;
        }
    }

    override public function getElementAt(param1: int): IVisualElement {
        if (param1 < 0 || param1 >= this.indexToRenderer.length) {
            return null;
        }
        return this.indexToRenderer[param1];
    }

    override public function getVirtualElementAt(param1: int, param2: Number = NaN, param3: Number = NaN): IVisualElement {
        var _loc5_: * = null;
        if (param1 < 0 || this.dataProvider == null || param1 >= this.dataProvider.length) {
            return null;
        }
        var _loc4_: IVisualElement = this.indexToRenderer[param1];
        if (this.virtualLayoutUnderway) {
            if (this.virtualRendererIndices.indexOf(param1) == -1) {
                this.virtualRendererIndices.push(param1);
            }
            this.addedVirtualRenderer = false;
            if (!_loc4_) {
                _loc5_ = this.dataProvider.getItemAt(param1);
                (_loc4_ = this.createVirtualRendererForItem(_loc5_)).visible = true;
                _loc4_.includeInLayout = true;
                this.indexToRenderer[param1] = _loc4_;
                this.addItemRendererToDisplayList(DisplayObject(_loc4_));
                this.setUpItemRenderer(_loc4_, param1, _loc5_);
            } else {
                this.addItemRendererToDisplayList(DisplayObject(_loc4_));
            }
            if (_loc4_ is ILayoutManagerClient) {
                LayoutManager.getInstance().validateClient(_loc4_ as ILayoutManagerClient, true);
            }
            if (!isNaN(param2) || !isNaN(param3)) {
                _loc4_.setLayoutBoundsSize(param2, param3);
            }
            if (this.addedVirtualRenderer) {
                dispatchEvent(new RendererExistenceEvent(RendererExistenceEvent.RENDERER_ADD, false, false, _loc4_, param1, _loc5_));
            }
        }
        return _loc4_;
    }

    override public function getElementIndex(param1: IVisualElement): int {
        if (this.dataProvider == null || param1 == null) {
            return -1;
        }
        return this.indexToRenderer.indexOf(param1);
    }

    override public function invalidateLayering(): void {
        this._layeringFlags |= LAYERING_ENABLED | LAYERING_DIRTY;
        invalidateProperties();
    }

    private function resetRendererItemIndex(param1: int): void {
        var _loc2_: IItemRenderer = this.indexToRenderer[param1] as IItemRenderer;
        if (_loc2_) {
            _loc2_.itemIndex = param1;
        }
    }

    private function resetRenderersIndices(): void {
        var _loc1_: int = 0;
        var _loc2_: int = 0;
        if (this.indexToRenderer.length == 0) {
            return;
        }
        if (Boolean(layout) && false) {
            for each(_loc1_ in this.virtualRendererIndices) {
                this.resetRendererItemIndex(_loc1_);
            }
        } else {
            _loc2_ = this.indexToRenderer.length;
            _loc1_ = 0;
            while (_loc1_ < _loc2_) {
                this.resetRendererItemIndex(_loc1_);
                _loc1_++;
            }
        }
    }

    mx_internal function itemAdded(param1: Object, param2: int): void {
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        if (layout) {
            layout.elementAdded(param2);
        }
        if (Boolean(layout) && false) {
            if (this.virtualRendererIndices) {
                _loc4_ = this.virtualRendererIndices.length;
                _loc5_ = 0;
                while (_loc5_ < _loc4_) {
                    if ((_loc6_ = this.virtualRendererIndices[_loc5_]) >= param2) {
                        this.virtualRendererIndices[_loc5_] = _loc6_ + 1;
                    }
                    _loc5_++;
                }
                this.indexToRenderer.splice(param2, 0, null);
            }
            this.invalidateSize();
            invalidateDisplayList();
            return;
        }
        var _loc3_: IVisualElement = this.createRendererForItem(param1);
        this.indexToRenderer.splice(param2, 0, _loc3_);
        this.addItemRendererToDisplayList(_loc3_ as DisplayObject, param2);
        this.setUpItemRenderer(_loc3_, param2, param1);
        dispatchEvent(new RendererExistenceEvent(RendererExistenceEvent.RENDERER_ADD, false, false, _loc3_, param2, param1));
        this.invalidateSize();
        invalidateDisplayList();
    }

    mx_internal function itemRemoved(param1: Object, param2: int): void {
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        if (layout) {
            layout.elementRemoved(param2);
        }
        if (Boolean(this.virtualRendererIndices) && this.virtualRendererIndices.length > 0) {
            _loc5_ = -1;
            _loc6_ = this.virtualRendererIndices.length;
            _loc7_ = 0;
            while (_loc7_ < _loc6_) {
                if ((_loc8_ = this.virtualRendererIndices[_loc7_]) == param2) {
                    _loc5_ = _loc7_;
                } else if (_loc8_ > param2) {
                    this.virtualRendererIndices[_loc7_] = _loc8_ - 1;
                }
                _loc7_++;
            }
            if (_loc5_ != -1) {
                this.virtualRendererIndices.splice(_loc5_, 1);
            }
        }
        var _loc3_: IVisualElement = this.indexToRenderer[param2];
        if (this.indexToRenderer.length > param2) {
            this.indexToRenderer.splice(param2, 1);
        }
        dispatchEvent(new RendererExistenceEvent(RendererExistenceEvent.RENDERER_REMOVE, false, false, _loc3_, param2, param1));
        if (_loc3_ is IDataRenderer && _loc3_ !== param1) {
            IDataRenderer(_loc3_).data = null;
        }
        var _loc4_: DisplayObject;
        if (_loc4_ = _loc3_ as DisplayObject) {
            super.removeChild(_loc4_);
        }
        this.invalidateSize();
        invalidateDisplayList();
    }

    private function addItemRendererToDisplayList(param1: DisplayObject, param2: int = -1): void {
        var _loc3_: Object = param1.parent;
        var _loc4_: int = !!mx_internal::_overlay ? 0 : 0;
        var _loc5_: int = param2 != -1 ? param2 : super.numChildren - _loc4_;
        if (_loc3_ == this) {
            super.setChildIndex(param1, _loc5_ - 1);
            return;
        }
        if (_loc3_ is DataGroup) {
            DataGroup(_loc3_)._removeChild(param1);
        }
        if (Boolean(this._layeringFlags & LAYERING_ENABLED) || param1 is IVisualElement && (param1 as IVisualElement).depth != 0) {
            this.invalidateLayering();
        }
        super.addChildAt(param1, _loc5_);
    }

    private function addDataProviderListener(): void {
        if (this._dataProvider) {
            this._dataProvider.addEventListener(CollectionEvent.COLLECTION_CHANGE, this.mx_internal::dataProvider_collectionChangeHandler, false, 0, true);
        }
    }

    private function removeDataProviderListener(): void {
        if (this._dataProvider) {
            this._dataProvider.removeEventListener(CollectionEvent.COLLECTION_CHANGE, this.mx_internal::dataProvider_collectionChangeHandler);
        }
    }

    mx_internal function dataProvider_collectionChangeHandler(param1: CollectionEvent): void {
        var _loc2_: int = 0;
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        switch (param1.kind) {
            case CollectionEventKind.ADD:
                this.adjustAfterAdd(param1.items, param1.location);
                break;
            case CollectionEventKind.REPLACE:
                this.adjustAfterReplace(param1.items, param1.location);
                break;
            case CollectionEventKind.REMOVE:
                this.adjustAfterRemove(param1.items, param1.location);
                break;
            case CollectionEventKind.MOVE:
                this.adjustAfterMove(param1.items[0], param1.location, param1.oldLocation);
                break;
            case CollectionEventKind.REFRESH:
                this.removeDataProviderListener();
                this.dataProviderChanged = true;
                invalidateProperties();
                break;
            case CollectionEventKind.RESET:
                this.removeDataProviderListener();
                this.dataProviderChanged = true;
                invalidateProperties();
                break;
            case CollectionEventKind.UPDATE:
                if (this.renderersBeingUpdated) {
                    break;
                }
                _loc2_ = 0;
                while (_loc2_ < param1.items.length) {
                    _loc3_ = param1.items[_loc2_];
                    if (_loc3_) {
                        _loc4_ = this.dataProvider.getItemIndex(_loc3_.source);
                        _loc5_ = this.indexToRenderer[_loc4_];
                        this.setUpItemRenderer(_loc5_, _loc4_, _loc3_.source);
                    }
                    _loc2_++;
                }
                break;
        }
    }

    private function adjustAfterAdd(param1: Array, param2: int): void {
        var _loc3_: int = param1.length;
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_) {
            this.mx_internal::itemAdded(param1[_loc4_], param2 + _loc4_);
            _loc4_++;
        }
        this.resetRenderersIndices();
    }

    private function adjustAfterRemove(param1: Array, param2: int): void {
        var _loc3_: int = param1.length;
        var _loc4_: int = _loc3_ - 1;
        while (_loc4_ >= 0) {
            this.mx_internal::itemRemoved(param1[_loc4_], param2 + _loc4_);
            _loc4_--;
        }
        this.resetRenderersIndices();
    }

    private function adjustAfterMove(param1: Object, param2: int, param3: int): void {
        this.mx_internal::itemRemoved(param1, param3);
        this.mx_internal::itemAdded(param1, param2);
        this.resetRenderersIndices();
    }

    private function adjustAfterReplace(param1: Array, param2: int): void {
        var _loc3_: int = param1.length;
        var _loc4_: int = _loc3_ - 1;
        while (_loc4_ >= 0) {
            this.mx_internal::itemRemoved(param1[_loc4_].oldValue, param2 + _loc4_);
            _loc4_--;
        }
        _loc4_ = _loc3_ - 1;
        while (_loc4_ >= 0) {
            this.mx_internal::itemAdded(param1[_loc4_].newValue, param2);
            _loc4_--;
        }
    }

    private function _removeChild(param1: DisplayObject): DisplayObject {
        return super.removeChild(param1);
    }

    override public function addChild(param1: DisplayObject): DisplayObject {
        throw new Error(resourceManager.getString("components", "addChildDataGroupError"));
    }

    override public function addChildAt(param1: DisplayObject, param2: int): DisplayObject {
        throw new Error(resourceManager.getString("components", "addChildAtDataGroupError"));
    }

    override public function removeChild(param1: DisplayObject): DisplayObject {
        throw new Error(resourceManager.getString("components", "removeChildDataGroupError"));
    }

    override public function removeChildAt(param1: int): DisplayObject {
        throw new Error(resourceManager.getString("components", "removeChildAtDataGroupError"));
    }

    override public function setChildIndex(param1: DisplayObject, param2: int): void {
        throw new Error(resourceManager.getString("components", "setChildIndexDataGroupError"));
    }

    override public function swapChildren(param1: DisplayObject, param2: DisplayObject): void {
        throw new Error(resourceManager.getString("components", "swapChildrenDataGroupError"));
    }

    override public function swapChildrenAt(param1: int, param2: int): void {
        throw new Error(resourceManager.getString("components", "swapChildrenAtDataGroupError"));
    }
}
}
