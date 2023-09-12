package spark.components.supportClasses {

import flash.display.DisplayObject;
import flash.events.Event;
import flash.geom.Point;
import flash.utils.getQualifiedClassName;

import mx.core.FlexVersion;
import mx.core.IFactory;
import mx.core.ILayoutElement;
import mx.core.IVisualElement;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;

import spark.events.SkinPartEvent;
import spark.utils.FTETextUtil;

public class SkinnableComponent extends UIComponent {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var _skinDestructionPolicy: String = "never";

    private var skinDestructionPolicyChanged: Boolean = false;

    private var _skin: UIComponent;

    private var errorObj: DisplayObject;

    private var errorStringChanged: Boolean;

    private var _explicitMouseEnabled: Boolean = true;

    private var _explicitMouseChildren: Boolean = true;

    mx_internal var focusObj: DisplayObject;

    mx_internal var drawFocusAnyway: Boolean;

    private var dynamicPartsCache: Object;

    private var skinChanged: Boolean = false;

    private var skinFactoryStyleChanged: Boolean = false;

    private var skinStateIsDirty: Boolean = false;

    public function SkinnableComponent() {
        super();
        this.skinStateIsDirty = true;
    }

    mx_internal function get skinDestructionPolicy(): String {
        return this._skinDestructionPolicy;
    }

    mx_internal function set skinDestructionPolicy(param1: String): void {
        if (param1 == this._skinDestructionPolicy) {
            return;
        }
        this._skinDestructionPolicy = param1;
        this.skinDestructionPolicyChanged = true;
        invalidateProperties();
    }

    [Bindable("skinChanged")]
    public function get skin(): UIComponent {
        return this._skin;
    }

    private function setSkin(param1: UIComponent): void {
        if (param1 === this._skin) {
            return;
        }
        this._skin = param1;
        dispatchEvent(new Event("skinChanged"));
    }

    public function get suggestedFocusSkinExclusions(): Array {
        return null;
    }

    override public function get baselinePosition(): Number {
        if (!mx_internal::validateBaselinePosition()) {
            return NaN;
        }
        return FTETextUtil.calculateFontBaseline(this, height, moduleFactory);
    }

    override protected function get currentCSSState(): String {
        return this.getCurrentSkinState();
    }

    override public function set enabled(param1: Boolean): void {
        super.enabled = param1;
        this.invalidateSkinState();
        super.mouseChildren = param1 ? this._explicitMouseChildren : false;
        super.mouseEnabled = param1 ? this._explicitMouseEnabled : false;
    }

    override public function set errorString(param1: String): void {
        super.errorString = param1;
        this.errorStringChanged = true;
        invalidateProperties();
    }

    override public function set mouseEnabled(param1: Boolean): void {
        if (enabled) {
            super.mouseEnabled = param1;
        }
        this._explicitMouseEnabled = param1;
    }

    override public function set mouseChildren(param1: Boolean): void {
        if (enabled) {
            super.mouseChildren = param1;
        }
        this._explicitMouseChildren = param1;
    }

    override public function matchesCSSState(param1: String): Boolean {
        return this.getCurrentSkinState() == param1 || currentState == param1;
    }

    override protected function createChildren(): void {
        super.createChildren();
        if (moduleFactory) {
            this.validateSkinChange();
        }
    }

    private function validateSkinChange(): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc1_: * = false;
        if (this._skin) {
            _loc2_ = getStyle("skinFactory");
            if (_loc2_) {
                _loc1_ = !this.skinFactoryStyleChanged;
            } else {
                _loc3_ = getStyle("skinClass");
                _loc1_ = Boolean(_loc3_) && getQualifiedClassName(_loc3_) == getQualifiedClassName(this._skin);
            }
            this.skinFactoryStyleChanged = false;
        }
        if (!_loc1_) {
            if (this.skin) {
                this.detachSkin();
            }
            this.attachSkin();
        }
    }

    override protected function commitProperties(): void {
        var _loc1_: * = null;
        super.commitProperties();
        if (this.skinChanged) {
            this.skinChanged = false;
            this.validateSkinChange();
        }
        if (this.skinStateIsDirty) {
            _loc1_ = this.getCurrentSkinState();
            stateChanged(this.skin.currentState, _loc1_, false);
            this.skin.currentState = _loc1_;
            this.skinStateIsDirty = false;
        }
        if (this.errorStringChanged) {
            this.mx_internal::updateErrorSkin();
            this.errorStringChanged = false;
        }
        if (this.skinDestructionPolicyChanged) {
            if (this.mx_internal::skinDestructionPolicy == "auto") {
                addEventListener(Event.ADDED_TO_STAGE, this.adddedToStageHandler);
                addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
            } else {
                removeEventListener(Event.ADDED_TO_STAGE, this.adddedToStageHandler);
                removeEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
            }
            this.skinDestructionPolicyChanged = false;
        }
    }

    override protected function measure(): void {
        if (this.skin) {
            if (false) {
                measuredWidth = this.skin.getExplicitOrMeasuredWidth();
                measuredHeight = this.skin.getExplicitOrMeasuredHeight();
                measuredMinWidth = isNaN(this.skin.explicitWidth) ? this.skin.minWidth : this.skin.explicitWidth;
                measuredMinHeight = isNaN(this.skin.explicitHeight) ? this.skin.minHeight : this.skin.explicitHeight;
            } else {
                measuredWidth = this.skin.getExplicitOrMeasuredWidth();
                measuredHeight = this.skin.getExplicitOrMeasuredHeight();
                measuredMinWidth = this.skin.minWidth;
                measuredMinHeight = this.skin.minHeight;
            }
        }
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        if (this.skin) {
            this.skin.setActualSize(param1, param2);
        }
    }

    override public function styleChanged(param1: String): void {
        var _loc2_: Boolean = param1 == null || param1 == "styleName";
        if (_loc2_ || param1 == "skinClass" || param1 == "skinFactory") {
            this.skinChanged = true;
            invalidateProperties();
            if (param1 == "skinFactory") {
                this.skinFactoryStyleChanged = true;
            }
        }
        super.styleChanged(param1);
    }

    override public function drawFocus(param1: Boolean): void {
        var _loc2_: * = null;
        if (param1) {
            if (!this.mx_internal::drawFocusAnyway && focusManager.getFocus() != this) {
                return;
            }
            if (!this.mx_internal::focusObj) {
                _loc2_ = getStyle("focusSkin");
                if (_loc2_) {
                    this.mx_internal::focusObj = new _loc2_();
                }
                if (this.mx_internal::focusObj) {
                    super.addChildAt(this.mx_internal::focusObj, 0);
                }
            }
            if (Boolean(this.mx_internal::focusObj) && "target" in this.mx_internal::focusObj) {
                this.mx_internal::focusObj["target"] = this;
            }
        } else {
            if (this.mx_internal::focusObj) {
                super.removeChild(this.mx_internal::focusObj);
            }
            this.mx_internal::focusObj = null;
        }
    }

    protected function getCurrentSkinState(): String {
        return null;
    }

    public function invalidateSkinState(): void {
        if (this.skinStateIsDirty) {
            return;
        }
        this.skinStateIsDirty = true;
        invalidateProperties();
    }

    protected function attachSkin(): void {
        var _loc2_: * = null;
        var _loc1_: IFactory = getStyle("skinFactory") as IFactory;
        if (_loc1_) {
            this.setSkin(_loc1_.newInstance() as UIComponent);
        }
        if (!this.skin) {
            _loc2_ = getStyle("skinClass") as Class;
            if (_loc2_) {
                this.setSkin(new _loc2_());
            }
        }
        if (this.skin) {
            this.skin.owner = this;
            if ("hostComponent" in this.skin) {
                try {
                    Object(this.skin).hostComponent = this;
                } catch (err: Error) {
                }
            }
            this.skin.styleName = this;
            super.addChild(this.skin);
            this.skin.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, this.skin_propertyChangeHandler);
            this.findSkinParts();
            this.invalidateSkinState();
            return;
        }
        throw new Error(resourceManager.getString("components", "skinNotFound", [this]));
    }

    protected function findSkinParts(): void {
        var _loc1_: * = null;
        if (this.skinParts) {
            for (_loc1_ in this.skinParts) {
                if (this.skinParts[_loc1_] == true) {
                    if (!(_loc1_ in this.skin)) {
                        throw new Error(resourceManager.getString("components", "requiredSkinPartNotFound", [_loc1_]));
                    }
                }
                if (_loc1_ in this.skin) {
                    this[_loc1_] = this.skin[_loc1_];
                    if (this[_loc1_] != null && !(this[_loc1_] is IFactory)) {
                        this.partAdded(_loc1_, this[_loc1_]);
                    }
                }
            }
        }
    }

    protected function clearSkinParts(): void {
        var _loc1_: * = null;
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        if (this.skinParts) {
            for (_loc1_ in this.skinParts) {
                if (this[_loc1_] != null) {
                    if (!(this[_loc1_] is IFactory)) {
                        this.partRemoved(_loc1_, this[_loc1_]);
                    } else {
                        _loc2_ = this.numDynamicParts(_loc1_);
                        _loc3_ = _loc2_ - 1;
                        while (_loc3_ >= 0) {
                            this.removeDynamicPartInstance(_loc1_, this.getDynamicPartAt(_loc1_, _loc3_));
                            _loc3_--;
                        }
                    }
                }
                this[_loc1_] = null;
            }
        }
    }

    protected function detachSkin(): void {
        this.skin.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, this.skin_propertyChangeHandler);
        this.skin.styleName = null;
        this.clearSkinParts();
        super.removeChild(this.skin);
        this.setSkin(null);
    }

    mx_internal function updateErrorSkin(): void {
        var _loc1_: * = null;
        if (errorString != null && errorString != "" && getStyle("showErrorSkin")) {
            if (!this.errorObj) {
                _loc1_ = getStyle("errorSkin");
                if (_loc1_) {
                    this.errorObj = new _loc1_();
                }
                if (this.errorObj) {
                    if ("target" in this.errorObj) {
                        this.errorObj["target"] = this;
                    }
                    super.addChild(this.errorObj);
                }
            }
        } else {
            if (this.errorObj) {
                super.removeChild(this.errorObj);
            }
            this.errorObj = null;
        }
    }

    protected function partAdded(param1: String, param2: Object): void {
        var _loc3_: SkinPartEvent = new SkinPartEvent(SkinPartEvent.PART_ADDED);
        _loc3_.partName = param1;
        _loc3_.instance = param2;
        dispatchEvent(_loc3_);
    }

    protected function partRemoved(param1: String, param2: Object): void {
        var _loc3_: SkinPartEvent = new SkinPartEvent(SkinPartEvent.PART_REMOVED);
        _loc3_.partName = param1;
        _loc3_.instance = param2;
        dispatchEvent(_loc3_);
    }

    protected function createDynamicPartInstance(param1: String): Object {
        var _loc3_: * = undefined;
        var _loc2_: IFactory = this[param1];
        if (_loc2_) {
            _loc3_ = _loc2_.newInstance();
            if (!this.dynamicPartsCache) {
                this.dynamicPartsCache = new Object();
            }
            if (!this.dynamicPartsCache[param1]) {
                this.dynamicPartsCache[param1] = new Array();
            }
            this.dynamicPartsCache[param1].push(_loc3_);
            this.partAdded(param1, _loc3_);
            return _loc3_;
        }
        return null;
    }

    protected function removeDynamicPartInstance(param1: String, param2: Object): void {
        this.partRemoved(param1, param2);
        var _loc3_: Array = this.dynamicPartsCache[param1] as Array;
        _loc3_.splice(_loc3_.indexOf(param2), 1);
    }

    protected function numDynamicParts(param1: String): int {
        if (Boolean(this.dynamicPartsCache) && Boolean(this.dynamicPartsCache[param1])) {
            return this.dynamicPartsCache[param1].length;
        }
        return 0;
    }

    protected function getDynamicPartAt(param1: String, param2: int): Object {
        if (Boolean(this.dynamicPartsCache) && Boolean(this.dynamicPartsCache[param1])) {
            return this.dynamicPartsCache[param1][param2];
        }
        return null;
    }

    protected function getSkinPartPosition(param1: IVisualElement): Point {
        return !param1 || !param1.parent ? new Point(0, 0) : globalToLocal(param1.parent.localToGlobal(new Point((param1 as ILayoutElement).getLayoutBoundsX(), (param1 as ILayoutElement).getLayoutBoundsY())));
    }

    protected function getBaselinePositionForPart(param1: IVisualElement): Number {
        if (!param1 || !mx_internal::validateBaselinePosition()) {
            return super.baselinePosition;
        }
        return this.getSkinPartPosition(param1).y + param1.baselinePosition;
    }

    private function skin_propertyChangeHandler(param1: PropertyChangeEvent): void {
        var _loc2_: * = null;
        if (this.skinParts) {
            _loc2_ = param1.property as String;
            if (this.skinParts[_loc2_] != null) {
                if (param1.newValue == null) {
                    if (!(this[_loc2_] is IFactory)) {
                        this.partRemoved(_loc2_, this[_loc2_]);
                    }
                    this[_loc2_] = param1.newValue;
                } else {
                    this[_loc2_] = param1.newValue;
                    if (!(this[_loc2_] is IFactory)) {
                        this.partAdded(_loc2_, this[_loc2_]);
                    }
                }
            }
        }
    }

    private function adddedToStageHandler(param1: Event): void {
        if (this.skin == null) {
            this.attachSkin();
        }
    }

    private function removedFromStageHandler(param1: Event): void {
        this.detachSkin();
    }

    override public function addChild(param1: DisplayObject): DisplayObject {
        throw new Error(resourceManager.getString("components", "addChildError"));
    }

    override public function addChildAt(param1: DisplayObject, param2: int): DisplayObject {
        throw new Error(resourceManager.getString("components", "addChildAtError"));
    }

    override public function removeChild(param1: DisplayObject): DisplayObject {
        throw new Error(resourceManager.getString("components", "removeChildError"));
    }

    override public function removeChildAt(param1: int): DisplayObject {
        throw new Error(resourceManager.getString("components", "removeChildAtError"));
    }

    override public function setChildIndex(param1: DisplayObject, param2: int): void {
        throw new Error(resourceManager.getString("components", "setChildIndexError"));
    }

    override public function swapChildren(param1: DisplayObject, param2: DisplayObject): void {
        throw new Error(resourceManager.getString("components", "swapChildrenError"));
    }

    override public function swapChildrenAt(param1: int, param2: int): void {
        throw new Error(resourceManager.getString("components", "swapChildrenAtError"));
    }
}
}
