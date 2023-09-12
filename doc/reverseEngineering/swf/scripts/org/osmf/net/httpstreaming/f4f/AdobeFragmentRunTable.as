package org.osmf.net.httpstreaming.f4f {

class AdobeFragmentRunTable extends FullBox {


    private var _timeScale: uint;

    private var _qualitySegmentURLModifiers: Vector.<String>;

    private var _fragmentDurationPairs: Vector.<FragmentDurationPair>;

    function AdobeFragmentRunTable() {
        super();
        this._fragmentDurationPairs = new Vector.<FragmentDurationPair>();
    }

    public function get timeScale(): uint {
        return this._timeScale;
    }

    public function set timeScale(param1: uint): void {
        this._timeScale = param1;
    }

    public function get qualitySegmentURLModifiers(): Vector.<String> {
        return this._qualitySegmentURLModifiers;
    }

    public function set qualitySegmentURLModifiers(param1: Vector.<String>): void {
        this._qualitySegmentURLModifiers = param1;
    }

    public function get fragmentDurationPairs(): Vector.<FragmentDurationPair> {
        return this._fragmentDurationPairs;
    }

    public function addFragmentDurationPair(param1: FragmentDurationPair): void {
        this._fragmentDurationPairs.push(param1);
    }

    public function findFragmentIdByTime(param1: Number, param2: Number, param3: Boolean = false): FragmentAccessInformation {
        if (this._fragmentDurationPairs.length <= 0) {
            return null;
        }
        var _loc4_: * = null;
        var _loc5_: Number = 1;
        while (_loc5_ < this._fragmentDurationPairs.length) {
            if ((_loc4_ = this._fragmentDurationPairs[_loc5_]).durationAccrued >= param1) {
                return this.validateFragment(this.calculateFragmentId(this._fragmentDurationPairs[_loc5_ - 1], param1), param2, param3);
            }
            _loc5_++;
        }
        return this.validateFragment(this.calculateFragmentId(this._fragmentDurationPairs[this._fragmentDurationPairs.length - 1], param1), param2, param3);
    }

    public function validateFragment(param1: uint, param2: Number, param3: Boolean = false): FragmentAccessInformation {
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        var _loc12_: * = null;
        var _loc4_: uint = this._fragmentDurationPairs.length - 1;
        var _loc5_: * = null;
        var _loc6_: Number = 0;
        while (_loc6_ < _loc4_) {
            _loc7_ = this._fragmentDurationPairs[_loc6_];
            _loc8_ = this._fragmentDurationPairs[_loc6_ + 1];
            if (_loc7_.firstFragment <= param1 && param1 < _loc8_.firstFragment) {
                if (_loc7_.duration <= 0) {
                    _loc5_ = this.getNextValidFragment(_loc6_ + 1, param2);
                    break;
                }
                (_loc5_ = new FragmentAccessInformation()).fragId = param1;
                _loc5_.fragDuration = _loc7_.duration;
                _loc5_.fragmentEndTime = _loc7_.durationAccrued + _loc7_.duration * (param1 - _loc7_.firstFragment + 1);
                break;
            }
            if (_loc7_.firstFragment <= param1 && this.endOfStreamEntry(_loc8_)) {
                if (_loc7_.duration > 0) {
                    _loc9_ = param2 - _loc7_.durationAccrued;
                    _loc10_ = (param1 - _loc7_.firstFragment + 1) * _loc7_.duration;
                    _loc11_ = (param1 - _loc7_.firstFragment) * _loc7_.duration;
                    if (_loc9_ > _loc11_) {
                        if (!param3 || _loc11_ + _loc7_.duration + _loc7_.durationAccrued <= param2) {
                            (_loc5_ = new FragmentAccessInformation()).fragId = param1;
                            _loc5_.fragDuration = _loc7_.duration;
                            if (_loc9_ >= _loc10_) {
                                _loc5_.fragmentEndTime = _loc7_.durationAccrued + _loc10_;
                                break;
                            }
                            _loc5_.fragmentEndTime = _loc7_.durationAccrued + _loc9_;
                            break;
                        }
                    }
                }
            }
            _loc6_++;
        }
        if (_loc5_ == null) {
            if ((_loc12_ = this._fragmentDurationPairs[_loc4_]).duration > 0 && param1 >= _loc12_.firstFragment) {
                _loc9_ = param2 - _loc12_.durationAccrued;
                _loc10_ = (param1 - _loc12_.firstFragment + 1) * _loc12_.duration;
                _loc11_ = (param1 - _loc12_.firstFragment) * _loc12_.duration;
                if (_loc9_ > _loc11_) {
                    if (!param3 || _loc11_ + _loc12_.duration + _loc12_.durationAccrued <= param2) {
                        (_loc5_ = new FragmentAccessInformation()).fragId = param1;
                        _loc5_.fragDuration = _loc12_.duration;
                        if (_loc9_ >= _loc10_) {
                            _loc5_.fragmentEndTime = _loc12_.durationAccrued + _loc10_;
                        } else {
                            _loc5_.fragmentEndTime = _loc12_.durationAccrued + _loc9_;
                        }
                    }
                }
            }
        }
        return _loc5_;
    }

    private function getNextValidFragment(param1: uint, param2: Number): FragmentAccessInformation {
        var _loc5_: * = null;
        var _loc3_: * = null;
        var _loc4_: uint = param1;
        while (_loc4_ < this._fragmentDurationPairs.length) {
            if ((_loc5_ = this._fragmentDurationPairs[_loc4_]).duration > 0) {
                _loc3_ = new FragmentAccessInformation();
                _loc3_.fragId = _loc5_.firstFragment;
                _loc3_.fragDuration = _loc5_.duration;
                _loc3_.fragmentEndTime = _loc5_.durationAccrued + _loc5_.duration;
                break;
            }
            _loc4_++;
        }
        return _loc3_;
    }

    private function endOfStreamEntry(param1: FragmentDurationPair): Boolean {
        return param1.duration == 0 && param1.discontinuityIndicator == 0;
    }

    public function fragmentsLeft(param1: uint, param2: Number): uint {
        if (this._fragmentDurationPairs == null || this._fragmentDurationPairs.length == 0) {
            return 0;
        }
        var _loc3_: FragmentDurationPair = this._fragmentDurationPairs[this.fragmentDurationPairs.length - 1] as FragmentDurationPair;
        return (param2 - _loc3_.durationAccrued) / _loc3_.duration + _loc3_.firstFragment - param1 - 1;
    }

    public function tableComplete(): Boolean {
        if (this._fragmentDurationPairs == null || this._fragmentDurationPairs.length <= 0) {
            return false;
        }
        var _loc1_: FragmentDurationPair = this._fragmentDurationPairs[this.fragmentDurationPairs.length - 1] as FragmentDurationPair;
        return _loc1_.duration == 0 && _loc1_.discontinuityIndicator == 0;
    }

    public function adjustEndEntryDurationAccrued(param1: Number): void {
        var _loc2_: FragmentDurationPair = this._fragmentDurationPairs[this._fragmentDurationPairs.length - 1];
        if (_loc2_.duration == 0) {
            _loc2_.durationAccrued = param1;
        }
    }

    private function findValidFragmentDurationPair(param1: uint): FragmentDurationPair {
        var _loc3_: * = null;
        var _loc2_: uint = param1;
        while (param1 < this._fragmentDurationPairs.length) {
            _loc3_ = this._fragmentDurationPairs[_loc2_];
            if (_loc3_.duration > 0) {
                return _loc3_;
            }
            _loc2_++;
        }
        return null;
    }

    private function calculateFragmentId(param1: FragmentDurationPair, param2: Number): uint {
        if (param1.duration <= 0) {
            return param1.firstFragment;
        }
        var _loc3_: Number = param2 - param1.durationAccrued;
        var _loc4_: uint = _loc3_ > 0 ? _loc3_ / param1.duration : 1;
        if (_loc3_ % param1.duration > 0) {
            _loc4_++;
        }
        return param1.firstFragment + _loc4_ - 1;
    }
}
}
