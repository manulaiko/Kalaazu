package net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.view {

import com.greensock.TweenMax;

import flash.utils.Dictionary;

import net.bigpoint.darkorbit.mvc.display.class_1704;
import net.bigpoint.darkorbit.mvc.display.class_1705;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.ViewCreateDTO;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo.AnimationVO;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo.AssetDescriptionVO;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.tween.FactoryTween;
import net.bigpoint.darkorbit.settings.Settings;

public class StandartViewContainer implements IAnimatedViewContainer {


    private var _animationLookup: Dictionary;

    private var _tweenLookup: Dictionary;

    private var _viewsLookup: Dictionary;

    private var _view: class_1704;

    private var _animationList: Vector.<AnimationVO>;

    private var _assetDecriptionVOList: Vector.<AssetDescriptionVO>;

    private var _tweens: Vector.<FactoryTween>;

    private var _dto: ViewCreateDTO;

    private var _reductionLevel: int = 0;

    private var _userQuality: int = 2147483647;

    public function StandartViewContainer(param1: ViewCreateDTO, param2: Dictionary, param3: Dictionary, param4: Vector.<AnimationVO>, param5: class_1704, param6: Vector.<AssetDescriptionVO>) {
        var _loc8_: * = null;
        this._animationLookup = new Dictionary();
        this._tweenLookup = new Dictionary();
        this._viewsLookup = new Dictionary();
        this._tweens = new Vector.<FactoryTween>();
        super();
        this._dto = param1;
        this._assetDecriptionVOList = param6;
        this._animationList = param4;
        this._view = param5;
        this._viewsLookup = param2;
        this._animationLookup = param3;
        var _loc7_: int = this._animationList.length;
        var _loc9_: int = 0;
        while (_loc9_ < _loc7_) {
            if ((_loc8_ = this._animationList[_loc9_]).autoPlay) {
                if (_loc8_.id) {
                    this.startTween(_loc8_.id);
                } else {
                    this.startTweenByVo(_loc8_);
                }
            }
            _loc9_++;
        }
    }

    private function startTweenByVo(param1: AnimationVO): FactoryTween {
        var _loc2_: FactoryTween = new FactoryTween(param1, this._reductionLevel, this._userQuality);
        _loc2_.start();
        this._tweens.push(_loc2_);
        return _loc2_;
    }

    public function getViewById(param1: String): class_1704 {
        return this._viewsLookup[param1];
    }

    public function get view(): class_1704 {
        return this._view;
    }

    public function startTween(param1: String): Boolean {
        var _loc3_: * = null;
        var _loc2_: AnimationVO = this._animationLookup[param1];
        if (_loc2_) {
            _loc3_ = this._tweenLookup[_loc2_];
            if (!_loc3_) {
                _loc3_ = this.startTweenByVo(_loc2_);
                this._tweenLookup[_loc2_] = _loc3_;
            } else {
                _loc3_.start();
            }
            return true;
        }
        return false;
    }

    public function resumeTween(param1: String): Boolean {
        var _loc2_: FactoryTween = this.getTween(param1);
        if (_loc2_) {
            _loc2_.resume();
            return true;
        }
        return false;
    }

    private function getTween(param1: String): FactoryTween {
        return Boolean(this._animationLookup[param1]) && Boolean(this._tweenLookup[this._animationLookup[param1]]) ? this._tweenLookup[this._animationLookup[param1]] : null;
    }

    public function pauseTween(param1: String): Boolean {
        var _loc2_: FactoryTween = this.getTween(param1);
        if (_loc2_) {
            _loc2_.pause();
            return true;
        }
        return false;
    }

    public function stopTween(param1: String): Boolean {
        var _loc2_: FactoryTween = this.getTween(param1);
        if (_loc2_) {
            _loc2_.stop();
            return true;
        }
        return false;
    }

    public function resetTween(param1: String): Boolean {
        var _loc2_: FactoryTween = this.getTween(param1);
        if (_loc2_) {
            _loc2_.reset();
            return true;
        }
        return false;
    }

    public function set reductionLevel(param1: int): void {
        var _loc4_: * = null;
        this._reductionLevel = param1;
        var _loc2_: int = this._tweens.length;
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            this._tweens[_loc3_].reductionLevel = param1;
            _loc3_++;
        }
        for each(_loc4_ in this._assetDecriptionVOList) {
            _loc4_.view.visible = _loc4_.maxReductionThreshold > param1;
            if (_loc4_.view is class_1705) {
                class_1705(_loc4_.view).freezed = param1 >= Settings.AQ_NO_ANIMATED_MAPASSETS_LIMIT;
            }
        }
    }

    public function set userQuality(param1: int): void {
        this._userQuality = param1;
        var _loc2_: int = this._tweens.length;
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            this._tweens[_loc3_].userQuality = param1;
            _loc3_++;
        }
    }

    public function get assetDecriptionVOList(): Vector.<AssetDescriptionVO> {
        return this._assetDecriptionVOList;
    }

    public function set view(param1: class_1704): void {
        this._view = param1;
    }

    public function get dto(): ViewCreateDTO {
        return this._dto;
    }

    public function dispose(): void {
        var _loc1_: * = undefined;
        this._view.dispose();
        this._tweenLookup = null;
        this._animationLookup = null;
        this._animationLookup = null;
        this._tweens.length = 0;
        for (_loc1_ in this._viewsLookup) {
            TweenMax.killTweensOf(this._viewsLookup[_loc1_]);
            (this._viewsLookup[_loc1_] as class_1704).dispose();
        }
    }
}
}
