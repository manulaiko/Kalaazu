package spark.components {

import flash.display.DisplayObject;
import flash.events.Event;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;

import mx.core.IFlexDisplayObject;
import mx.core.IUIComponent;
import mx.core.LayoutDirection;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.managers.PopUpManager;
import mx.styles.ISimpleStyleClient;
import mx.utils.MatrixUtil;
import mx.utils.PopUpUtil;

public class PopUpAnchor extends UIComponent {

    private static var decomposition: Vector.<Number> = new <Number>[0, 0, 0, 0, 0];


    private var popUpWidth: Number = 0;

    private var popUpHeight: Number = 0;

    private var popUpIsDisplayed: Boolean = false;

    private var addedToStage: Boolean = false;

    private var popUpSizeCaptured: Boolean = false;

    private var _popUpHeightMatchesAnchorHeight: Boolean = false;

    private var _popUpWidthMatchesAnchorWidth: Boolean = false;

    private var _displayPopUp: Boolean = false;

    private var _popUp: IFlexDisplayObject;

    private var _popUpPosition: String = "topLeft";

    public function PopUpAnchor() {
        super();
        addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
        addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
    }

    public function set popUpHeightMatchesAnchorHeight(param1: Boolean): void {
        if (this._popUpHeightMatchesAnchorHeight == param1) {
            return;
        }
        this._popUpHeightMatchesAnchorHeight = param1;
        invalidateDisplayList();
    }

    public function get popUpHeightMatchesAnchorHeight(): Boolean {
        return this._popUpHeightMatchesAnchorHeight;
    }

    public function set popUpWidthMatchesAnchorWidth(param1: Boolean): void {
        if (this._popUpWidthMatchesAnchorWidth == param1) {
            return;
        }
        this._popUpWidthMatchesAnchorWidth = param1;
        invalidateDisplayList();
    }

    public function get popUpWidthMatchesAnchorWidth(): Boolean {
        return this._popUpWidthMatchesAnchorWidth;
    }

    public function set displayPopUp(param1: Boolean): void {
        if (this._displayPopUp == param1) {
            return;
        }
        this._displayPopUp = param1;
        this.addOrRemovePopUp();
    }

    public function get displayPopUp(): Boolean {
        return this._displayPopUp;
    }

    [Bindable("popUpChanged")]
    public function set popUp(param1: IFlexDisplayObject): void {
        if (this._popUp == param1) {
            return;
        }
        this._popUp = param1;
        if (this._popUp is ISimpleStyleClient) {
            ISimpleStyleClient(this._popUp).styleName = this;
        }
        dispatchEvent(new Event("popUpChanged"));
    }

    public function get popUp(): IFlexDisplayObject {
        return this._popUp;
    }

    public function set popUpPosition(param1: String): void {
        if (this._popUpPosition == param1) {
            return;
        }
        this._popUpPosition = param1;
        invalidateDisplayList();
    }

    public function get popUpPosition(): String {
        return this._popUpPosition;
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        super.updateDisplayList(param1, param2);
        this.applyPopUpTransform(param1, param2);
    }

    public function updatePopUpTransform(): void {
        this.applyPopUpTransform(width, height);
    }

    protected function calculatePopUpPosition(): Point {
        var _loc6_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc1_: DisplayObject = systemManager.getSandboxRoot();
        var _loc2_: Matrix = MatrixUtil.getConcatenatedMatrix(this, _loc1_);
        var _loc3_: Point = new Point();
        if (!_loc2_) {
            return _loc3_;
        }
        var _loc4_: Rectangle = new Rectangle();
        var _loc5_: DisplayObject = this.popUp as DisplayObject;
        this.mx_internal::determinePosition(this.popUpPosition, _loc5_.width, _loc5_.height, _loc2_, _loc3_, _loc4_);
        if (screen) {
            switch (this.popUpPosition) {
                case PopUpPosition.BELOW:
                    if (_loc4_.bottom > screen.bottom) {
                        _loc6_ = "null";
                        break;
                    }
                    break;
                case PopUpPosition.ABOVE:
                    if (_loc4_.top < screen.top) {
                        _loc6_ = "null";
                        break;
                    }
                    break;
                case PopUpPosition.LEFT:
                    if (_loc4_.left < screen.left) {
                        _loc6_ = "null";
                        break;
                    }
                    break;
                case PopUpPosition.RIGHT:
                    if (_loc4_.right > screen.right) {
                        _loc6_ = "null";
                        break;
                    }
            }
        }
        if (_loc6_ != null) {
            _loc9_ = new Point();
            _loc10_ = new Rectangle();
            this.mx_internal::determinePosition(_loc6_, _loc5_.width, _loc5_.height, _loc2_, _loc9_, _loc10_);
            if (screen) {
                switch (_loc6_) {
                    case PopUpPosition.BELOW:
                        if (_loc10_.bottom > screen.bottom) {
                            _loc6_ = null;
                            break;
                        }
                        break;
                    case PopUpPosition.ABOVE:
                        if (_loc10_.top < screen.top) {
                            _loc6_ = null;
                            break;
                        }
                        break;
                    case PopUpPosition.LEFT:
                        if (_loc10_.left < screen.left) {
                            _loc6_ = null;
                            break;
                        }
                        break;
                    case PopUpPosition.RIGHT:
                        if (_loc10_.right > screen.right) {
                            _loc6_ = null;
                            break;
                        }
                }
            }
            if (_loc6_ != null) {
                _loc3_ = _loc9_;
                _loc4_ = _loc10_;
            }
        }
        MatrixUtil.decomposeMatrix(decomposition, _loc2_, 0, 0);
        var _loc7_: Number = 0;
        var _loc8_: Number = 0;
        if (_loc4_.top < screen.top) {
            _loc3_.y += (0 - _loc4_.top) / _loc8_;
        } else if (_loc4_.bottom > screen.bottom) {
            _loc3_.y -= (_loc4_.bottom - 0) / _loc8_;
        }
        if (_loc4_.left < screen.left) {
            _loc3_.x += (0 - _loc4_.left) / _loc7_;
        } else if (_loc4_.right > screen.right) {
            _loc3_.x -= (_loc4_.right - 0) / _loc7_;
        }
        if (layoutDirection == LayoutDirection.RTL) {
            _loc3_.x += _loc4_.width;
        }
        return MatrixUtil.getConcatenatedComputedMatrix(this, _loc1_).transformPoint(_loc3_);
    }

    private function addOrRemovePopUp(): void {
        if (!this.addedToStage) {
            return;
        }
        if (this.popUp == null) {
            return;
        }
        if (DisplayObject(this.popUp).parent == null && this.displayPopUp) {
            PopUpManager.addPopUp(this.popUp, this, false);
            if (this.popUp is IUIComponent) {
                IUIComponent(this.popUp).owner = this;
            }
            this.popUpIsDisplayed = true;
            if (this.popUp is UIComponent && !this.popUpSizeCaptured) {
                this.popUpWidth = UIComponent(this.popUp).explicitWidth;
                this.popUpHeight = UIComponent(this.popUp).explicitHeight;
                UIComponent(this.popUp).validateNow();
                this.popUpSizeCaptured = true;
            }
            this.applyPopUpTransform(width, height);
        } else if (DisplayObject(this.popUp).parent != null && this.displayPopUp == false) {
            this.removeAndResetPopUp();
        }
    }

    private function removeAndResetPopUp(): void {
        PopUpManager.removePopUp(this.popUp);
        this.popUpIsDisplayed = false;
    }

    mx_internal function determinePosition(param1: String, param2: Number, param3: Number, param4: Matrix, param5: Point, param6: Rectangle): void {
        switch (param1) {
            case PopUpPosition.BELOW:
                param5.x = 0;
                param5.y = unscaledHeight;
                break;
            case PopUpPosition.ABOVE:
                param5.x = 0;
                param5.y = -param3;
                break;
            case PopUpPosition.LEFT:
                param5.x = -param2;
                param5.y = 0;
                break;
            case PopUpPosition.RIGHT:
                param5.x = unscaledWidth;
                param5.y = 0;
                break;
            case PopUpPosition.CENTER:
                param5.x = (unscaledWidth - param2) / 2;
                param5.y = (unscaledHeight - param3) / 2;
                break;
            case PopUpPosition.TOP_LEFT:
        }
        var _loc7_: DisplayObject = this.popUp as DisplayObject;
        var _loc8_: Point = param5.clone();
        var _loc9_: Point = MatrixUtil.transformBounds(_loc7_.width, _loc7_.height, param4, _loc8_);
        param6.left = _loc8_.x;
        param6.top = _loc8_.y;
        param6.width = _loc9_.x;
        param6.height = _loc9_.y;
    }

    private function applyPopUpTransform(param1: Number, param2: Number): void {
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        if (!this.popUpIsDisplayed) {
            return;
        }
        if (this.popUp is UIComponent) {
            if (this.popUpWidthMatchesAnchorWidth) {
                UIComponent(this.popUp).width = param1;
            } else {
                UIComponent(this.popUp).explicitWidth = this.popUpWidth;
            }
            if (this.popUpHeightMatchesAnchorHeight) {
                UIComponent(this.popUp).height = param2;
            } else {
                UIComponent(this.popUp).explicitHeight = this.popUpHeight;
            }
        } else {
            _loc4_ = this.popUpWidthMatchesAnchorWidth ? param1 : Number(this.popUp.measuredWidth);
            _loc5_ = this.popUpHeightMatchesAnchorHeight ? param2 : Number(this.popUp.measuredHeight);
            this.popUp.setActualSize(_loc4_, _loc5_);
        }
        var _loc3_: Point = this.calculatePopUpPosition();
        PopUpUtil.applyPopUpTransform(this, mx_internal::$transform.concatenatedColorTransform, systemManager, this.popUp, _loc3_);
    }

    private function addedToStageHandler(param1: Event): void {
        this.addedToStage = true;
        this.addOrRemovePopUp();
    }

    private function removedFromStageHandler(param1: Event): void {
        if (this.popUp != null && DisplayObject(this.popUp).parent != null) {
            this.removeAndResetPopUp();
        }
        this.addedToStage = false;
    }
}
}
