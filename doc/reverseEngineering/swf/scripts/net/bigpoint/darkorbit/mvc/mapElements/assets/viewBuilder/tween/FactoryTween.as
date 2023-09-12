package net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.tween {

import com.greensock.TimelineMax;
import com.greensock.TweenMax;
import com.greensock.core.TweenCore;

import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo.AnimationVO;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo.FactoryTweenVO;

public class FactoryTween {

    private static const STATE_PLAYING: int = 1;

    private static const STATE_STOPPED: int = 0;


    protected var _timeline: TimelineMax;

    private var _vo: AnimationVO;

    private var _state: int = 0;

    private var _reductionLevel: int = -1;

    private var _userQuality: int = 2147483647;

    public function FactoryTween(param1: AnimationVO, param2: int = -1, param3: int = 2147483647) {
        super();
        this._reductionLevel = param2;
        this._userQuality = param3;
        this._vo = param1;
    }

    public function set reductionLevel(param1: int): void {
        if (!this._vo.loop) {
            return;
        }
        if (this._reductionLevel > param1) {
            this._reductionLevel = param1;
            if (Boolean(this._timeline) && this._reductionLevel > this._vo.maxReductionThreshold) {
                this.reset();
            }
        } else if (this._reductionLevel < param1) {
            this._reductionLevel = param1;
            if (this._reductionLevel <= this._vo.maxReductionThreshold) {
                if (!this._timeline) {
                    this.initTimeLine();
                    if (this._state == STATE_PLAYING) {
                        this.start();
                    }
                }
            }
        }
    }

    public function set userQuality(param1: int): void {
        if (!this._vo.loop) {
            return;
        }
        if (this._userQuality < param1) {
            this._userQuality = param1;
            if (Boolean(this._timeline) && this._userQuality < this._vo.minUserQuality) {
                this.reset();
            }
        } else if (this._userQuality > param1) {
            this._userQuality = param1;
            if (this._userQuality >= this._vo.minUserQuality) {
                if (this._state == STATE_PLAYING) {
                    this.start();
                }
            }
        }
    }

    public function start(): void {
        this._state = STATE_PLAYING;
        this.reset();
        this.initTimeLine();
        if (this._timeline) {
            this._timeline.play();
        }
    }

    public function resume(): void {
        this._state = STATE_PLAYING;
        if (this._timeline) {
            this._timeline.resume();
        }
    }

    public function pause(): void {
        this._state = STATE_STOPPED;
        if (this._timeline) {
            this._timeline.pause();
        }
    }

    public function stop(): void {
        this._state = STATE_STOPPED;
        if (this._timeline) {
            this._timeline.stop();
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

    protected function initTimeLine(): void {
        if (this._reductionLevel <= this._vo.maxReductionThreshold && this._userQuality >= this._vo.minUserQuality) {
            this._timeline = this.animationToTimeline(this._vo);
            this._timeline.pause();
        }
    }

    private function animationToTimeline(param1: AnimationVO): TimelineMax {
        var _loc2_: * = null;
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc6_: * = null;
        if (param1.maxReductionThreshold >= this._reductionLevel) {
            _loc2_ = new TimelineMax({
                "yoyo": param1.yoyo,
                "repeat": (param1.loop ? -1 : 0)
            });
            _loc3_ = param1.children.length;
            _loc4_ = 0;
            while (_loc4_ < _loc3_) {
                if ((_loc5_ = param1.children[_loc4_]) is AnimationVO) {
                    _loc6_ = this.animationToTimeline(_loc5_ as AnimationVO);
                } else {
                    _loc6_ = this.getNormalTween(_loc5_ as FactoryTweenVO);
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
        return null;
    }

    private function getNormalTween(param1: FactoryTweenVO): TweenCore {
        if (Boolean(param1.view) && param1.maxReductionThreshold >= this._reductionLevel) {
            return new TweenMax(param1.view, param1.time, param1.props);
        }
        return null;
    }
}
}
