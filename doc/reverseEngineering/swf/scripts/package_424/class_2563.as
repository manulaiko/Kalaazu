package package_424 {

import com.greensock.TimelineMax;
import com.greensock.TweenMax;
import com.greensock.core.TweenCore;
import com.greensock.events.TweenEvent;
import com.greensock.plugins.FrameBackwardPlugin;
import com.greensock.plugins.FrameForwardPlugin;
import com.greensock.plugins.FrameLabelPlugin;
import com.greensock.plugins.FramePlugin;
import com.greensock.plugins.TweenPlugin;

import package_19.class_68;
import package_19.class_70;

public class class_2563 {

    {
        TweenPlugin.activate([FramePlugin, FrameLabelPlugin, FrameBackwardPlugin, FrameForwardPlugin]);
    }

    public const completed: class_68 = new class_70();

    private var _timeline: TimelineMax;

    private var _vo: class_2564;

    private var var_2919: Object;

    public function class_2563(param1: class_2564, param2: Object) {
        super();
        this._vo = param1;
        this.var_2919 = param2;
    }

    public function start(): void {
        if (!this._timeline) {
            this.initTimeLine();
        }
        this._timeline.play();
    }

    public function resume(): void {
        if (this._timeline) {
            this._timeline.resume();
        }
    }

    public function pause(): void {
        if (this._timeline) {
            this._timeline.pause();
        }
    }

    public function stop(): void {
        if (this._timeline) {
            this._timeline.stop();
        }
    }

    public function dispose(): void {
        if (this._timeline) {
            this._timeline.stop();
            this._timeline.kill();
            this._timeline = null;
        }
    }

    public function reset(): void {
        if (this._timeline) {
            this._timeline.restart();
            this._timeline.stop();
            this._timeline.kill();
            this._timeline = null;
        }
    }

    private function initTimeLine(): void {
        this._timeline = this.animationToTimeline(this._vo);
        this._timeline.addEventListener(TweenEvent.COMPLETE, this.method_2715);
    }

    private function animationToTimeline(param1: class_2564): TimelineMax {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc2_: TimelineMax = new TimelineMax({
            "yoyo": param1.yoyo,
            "repeat": param1.repeat
        });
        var _loc3_: int = int(param1.children.length);
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_) {
            if ((_loc5_ = param1.children[_loc4_]) is class_2564) {
                _loc6_ = this.animationToTimeline(_loc5_ as class_2564);
            } else {
                _loc7_ = _loc5_ as class_2684;
                if (_loc8_ = this.var_2919 is Function ? (this.var_2919 as Function)(_loc7_.name_150) : this.var_2919) {
                    _loc6_ = new TweenMax(_loc8_, _loc7_.time, _loc7_.props);
                }
            }
            if (_loc6_) {
                if (param1.parallel) {
                    _loc2_.insert(_loc6_);
                } else {
                    _loc2_.append(_loc6_);
                }
            }
            _loc4_++;
        }
        return _loc2_;
    }

    private function method_2715(param1: TweenEvent): void {
        this.completed.dispatch();
    }
}
}
