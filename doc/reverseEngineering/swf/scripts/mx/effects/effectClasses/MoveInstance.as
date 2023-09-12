package mx.effects.effectClasses {

import flash.events.Event;

import mx.core.EdgeMetrics;
import mx.core.IContainer;
import mx.core.IUIComponent;
import mx.core.mx_internal;
import mx.effects.EffectManager;
import mx.events.MoveEvent;
import mx.styles.IStyleClient;

public class MoveInstance extends TweenEffectInstance {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var left;

    private var right;

    private var top;

    private var bottom;

    private var horizontalCenter;

    private var verticalCenter;

    private var forceClipping: Boolean = false;

    private var checkClipping: Boolean = true;

    private var oldWidth: Number;

    private var oldHeight: Number;

    public var xBy: Number;

    public var xFrom: Number;

    public var xTo: Number;

    public var yBy: Number;

    public var yFrom: Number;

    public var yTo: Number;

    public function MoveInstance(param1: Object) {
        super(param1);
    }

    override public function initEffect(param1: Event): void {
        super.initEffect(param1);
        if (param1 is MoveEvent && param1.type == MoveEvent.MOVE) {
            if (isNaN(this.xFrom) && isNaN(this.xTo) && isNaN(this.xBy) && isNaN(this.yFrom) && isNaN(this.yTo) && isNaN(this.yBy)) {
                this.xFrom = MoveEvent(param1).oldX;
                this.xTo = target.x;
                this.yFrom = MoveEvent(param1).oldY;
                this.yTo = target.y;
            }
        }
    }

    override public function play(): void {
        var _loc2_: * = null;
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        super.play();
        EffectManager.mx_internal::startBitmapEffect(IUIComponent(target));
        if (isNaN(this.xFrom)) {
            this.xFrom = !isNaN(this.xTo) && !isNaN(this.xBy) ? this.xTo - this.xBy : Number(target.x);
        }
        if (isNaN(this.xTo)) {
            if (isNaN(this.xBy) && propertyChanges && propertyChanges.end["x"] !== undefined) {
                this.xTo = propertyChanges.end["x"];
            } else {
                this.xTo = !isNaN(this.xBy) ? this.xFrom + this.xBy : Number(target.x);
            }
        }
        if (isNaN(this.yFrom)) {
            this.yFrom = !isNaN(this.yTo) && !isNaN(this.yBy) ? this.yTo - this.yBy : Number(target.y);
        }
        if (isNaN(this.yTo)) {
            if (isNaN(this.yBy) && propertyChanges && propertyChanges.end["y"] !== undefined) {
                this.yTo = propertyChanges.end["y"];
            } else {
                this.yTo = !isNaN(this.yBy) ? this.yFrom + this.yBy : Number(target.y);
            }
        }
        tween = createTween(this, [this.xFrom, this.yFrom], [this.xTo, this.yTo], duration);
        var _loc1_: IContainer = target.parent as IContainer;
        if (_loc1_) {
            _loc2_ = _loc1_.viewMetrics;
            _loc3_ = _loc2_.left;
            _loc4_ = Number(_loc1_.width) - _loc2_.right;
            _loc5_ = _loc2_.top;
            _loc6_ = Number(_loc1_.height) - _loc2_.bottom;
            if (this.xFrom < _loc3_ || this.xTo < _loc3_ || this.xFrom + target.width > _loc4_ || this.xTo + target.width > _loc4_ || this.yFrom < _loc5_ || this.yTo < _loc5_ || this.yFrom + target.height > _loc6_ || this.yTo + target.height > _loc6_) {
                this.forceClipping = true;
                if ("forceClipping" in _loc1_) {
                    _loc1_["forceClipping"] = true;
                }
            }
        }
        mx_internal::applyTweenStartValues();
        if (target is IStyleClient) {
            this.left = target.getStyle("left");
            if (this.left != undefined) {
                target.setStyle("left", undefined);
            }
            this.right = target.getStyle("right");
            if (this.right != undefined) {
                target.setStyle("right", undefined);
            }
            this.top = target.getStyle("top");
            if (this.top != undefined) {
                target.setStyle("top", undefined);
            }
            this.bottom = target.getStyle("bottom");
            if (this.bottom != undefined) {
                target.setStyle("bottom", undefined);
            }
            this.horizontalCenter = target.getStyle("horizontalCenter");
            if (this.horizontalCenter != undefined) {
                target.setStyle("horizontalCenter", undefined);
            }
            this.verticalCenter = target.getStyle("verticalCenter");
            if (this.verticalCenter != undefined) {
                target.setStyle("verticalCenter", undefined);
            }
            if (this.left != undefined && this.right != undefined) {
                _loc7_ = 0;
                this.oldWidth = target.explicitWidth;
                target.width = _loc7_;
            }
            if (this.top != undefined && this.bottom != undefined) {
                _loc8_ = 0;
                this.oldHeight = target.explicitHeight;
                target.height = _loc8_;
            }
        }
    }

    override public function onTweenUpdate(param1: Object): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        EffectManager.suspendEventHandling();
        if (!this.forceClipping && this.checkClipping) {
            _loc2_ = target.parent as IContainer;
            if (_loc2_) {
                _loc3_ = _loc2_.viewMetrics;
                _loc4_ = _loc3_.left;
                _loc5_ = Number(_loc2_.width) - _loc3_.right;
                _loc6_ = _loc3_.top;
                _loc7_ = Number(_loc2_.height) - _loc3_.bottom;
                if (param1[0] < _loc4_ || param1[0] + target.width > _loc5_ || param1[1] < _loc6_ || param1[1] + target.height > _loc7_) {
                    this.forceClipping = true;
                    if ("forceClipping" in _loc2_) {
                        _loc2_["forceClipping"] = true;
                    }
                }
            }
        }
        target.move(param1[0], param1[1]);
        EffectManager.resumeEventHandling();
    }

    override public function onTweenEnd(param1: Object): void {
        var _loc2_: * = null;
        EffectManager.mx_internal::endBitmapEffect(IUIComponent(target));
        if (this.left != undefined) {
            target.setStyle("left", this.left);
        }
        if (this.right != undefined) {
            target.setStyle("right", this.right);
        }
        if (this.top != undefined) {
            target.setStyle("top", this.top);
        }
        if (this.bottom != undefined) {
            target.setStyle("bottom", this.bottom);
        }
        if (this.horizontalCenter != undefined) {
            target.setStyle("horizontalCenter", this.horizontalCenter);
        }
        if (this.verticalCenter != undefined) {
            target.setStyle("verticalCenter", this.verticalCenter);
        }
        if (this.left != undefined && this.right != undefined) {
            target.explicitWidth = this.oldWidth;
        }
        if (this.top != undefined && this.bottom != undefined) {
            target.explicitHeight = this.oldHeight;
        }
        if (this.forceClipping) {
            _loc2_ = target.parent as IContainer;
            if (_loc2_) {
                this.forceClipping = false;
                if ("forceClipping" in _loc2_) {
                    _loc2_["forceClipping"] = false;
                }
            }
        }
        this.checkClipping = false;
        super.onTweenEnd(param1);
    }
}
}
