package mx.effects.effectClasses {

import flash.events.Event;

import mx.core.mx_internal;
import mx.events.FlexEvent;

public class FadeInstance extends TweenEffectInstance {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var origAlpha: Number = NaN;

    private var restoreAlpha: Boolean;

    public var alphaFrom: Number;

    public var alphaTo: Number;

    public function FadeInstance(param1: Object) {
        super(param1);
    }

    override public function initEffect(param1: Event): void {
        super.initEffect(param1);
        switch (param1.type) {
            case "childrenCreationComplete":
            case FlexEvent.CREATION_COMPLETE:
            case FlexEvent.SHOW:
            case Event.ADDED:
            case "resizeEnd":
                if (isNaN(this.alphaFrom)) {
                    this.alphaFrom = 0;
                }
                if (isNaN(this.alphaTo)) {
                    this.alphaTo = target.alpha;
                    break;
                }
                break;
            case FlexEvent.HIDE:
            case Event.REMOVED:
            case "resizeStart":
                this.restoreAlpha = true;
                if (isNaN(this.alphaFrom)) {
                    this.alphaFrom = target.alpha;
                }
                if (isNaN(this.alphaTo)) {
                    this.alphaTo = 0;
                    break;
                }
        }
    }

    override public function play(): void {
        super.play();
        this.origAlpha = target.alpha;
        var _loc1_: PropertyChanges = propertyChanges;
        if (isNaN(this.alphaFrom) && isNaN(this.alphaTo)) {
            if (Boolean(_loc1_) && _loc1_.end["alpha"] !== undefined) {
                this.alphaFrom = this.origAlpha;
                this.alphaTo = _loc1_.end["alpha"];
            } else if (Boolean(_loc1_) && _loc1_.end["visible"] !== undefined) {
                this.alphaFrom = !!_loc1_.start["visible"] ? this.origAlpha : 0;
                this.alphaTo = !!_loc1_.end["visible"] ? this.origAlpha : 0;
            } else {
                this.alphaFrom = 0;
                this.alphaTo = this.origAlpha;
            }
        } else if (isNaN(this.alphaFrom)) {
            this.alphaFrom = this.alphaTo == 0 ? this.origAlpha : 0;
        } else if (isNaN(this.alphaTo)) {
            if (Boolean(_loc1_) && _loc1_.end["alpha"] !== undefined) {
                this.alphaTo = _loc1_.end["alpha"];
            } else {
                this.alphaTo = this.alphaFrom == 0 ? this.origAlpha : 0;
            }
        }
        tween = createTween(this, this.alphaFrom, this.alphaTo, duration);
        target.alpha = tween.mx_internal::getCurrentValue(0);
    }

    override public function onTweenUpdate(param1: Object): void {
        target.alpha = param1;
    }

    override public function onTweenEnd(param1: Object): void {
        super.onTweenEnd(param1);
        if (Boolean(mx_internal::hideOnEffectEnd) || this.restoreAlpha) {
            target.alpha = this.origAlpha;
        }
    }
}
}
