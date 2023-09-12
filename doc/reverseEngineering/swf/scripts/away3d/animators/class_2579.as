package away3d.animators {

import away3d.*;

import flash.display3D.*;
import flash.utils.*;

import package_198.*;

import package_294.*;

import package_304.*;

import package_309.*;

import package_386.*;

import package_431.*;

import package_442.*;

public class class_2579 extends class_2438 implements class_2234 {

    public static const const_1763: int = 9;

    public static const const_717: int = 18;


    arcane var var_1213: class_2238;

    private var var_2255: class_2577;

    private var var_4857: Dictionary;

    private var var_2435: Vector.<class_2406>;

    private var var_316: Vector.<class_2406>;

    private var var_1363: Vector.<class_2406>;

    private var var_547: int = 0;

    public var var_4176: Boolean;

    public var var_3696: Boolean;

    public var var_3591: Boolean;

    public var var_3056: Boolean;

    public var var_3262: Boolean;

    public var var_2254: Function;

    public function class_2579(param1: Boolean = false, param2: Boolean = false, param3: Boolean = false) {
        this.var_4857 = new Dictionary(true);
        this.var_2435 = new Vector.<class_2406>();
        this.var_316 = new Vector.<class_2406>();
        this.var_1363 = new Vector.<class_2406>();
        super();
        this.addAnimation(this.var_2255 = new class_2577(param1, param2, param3));
    }

    public function get method_3903(): Vector.<class_2406> {
        return this.var_2435;
    }

    override public function addAnimation(param1: class_2405): void {
        var _loc2_: int = 0;
        var _loc3_: class_2406 = param1 as class_2406;
        _loc3_.arcane::method_2127(this);
        if (_loc3_.mode == class_2578.name_24) {
            _loc3_.arcane::var_4676 = this.var_547;
            this.var_547 += _loc3_.method_3305;
            this.var_1363.push(_loc3_);
        } else if (_loc3_.mode == class_2578.name_117) {
            this.var_316.push(_loc3_);
        }
        _loc2_ = this.var_2435.length - 1;
        while (_loc2_ >= 0) {
            if (this.var_2435[_loc2_].priority <= _loc3_.priority) {
                break;
            }
            _loc2_--;
        }
        this.var_2435.splice(_loc2_ + 1, 0, _loc3_);
        super.addAnimation(param1);
    }

    public function activate(param1: class_1208, param2: class_1774): void {
        this.arcane::var_1213 = param2.var_2120;
    }

    public function deactivate(param1: class_1208, param2: class_1774): void {
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        if (this.arcane::var_1213) {
            _loc3_ = param1.context3D;
            _loc4_ = int(this.arcane::var_1213.method_4542);
            _loc5_ = int(this.arcane::var_1213.method_1035);
            _loc6_ = _loc4_;
            while (_loc6_ < _loc5_) {
                _loc3_.setVertexBufferAt(_loc6_, null);
                _loc6_++;
            }
        }
    }

    public function method_2174(param1: class_1774, param2: Vector.<String>, param3: Vector.<String>, param4: String): String {
        var _loc6_: * = null;
        var _loc7_: * = param1.var_2120 || new class_2238(param4);
        param1.var_2120 = param1.var_2120 || new class_2238(param4);
        this.arcane::var_1213 = _loc7_;
        this.arcane::var_1213.method_3046 = param1.method_1025;
        this.arcane::var_1213.method_4542 = param1.method_1035;
        this.arcane::var_1213.method_6239 = param1.method_5243;
        this.arcane::var_1213.method_2599 = param1.method_6441;
        this.arcane::var_1213.var_4176 = this.var_4176;
        this.arcane::var_1213.var_3696 = this.var_3696;
        this.arcane::var_1213.var_3591 = this.var_3591;
        this.arcane::var_1213.var_873 = param2;
        this.arcane::var_1213.var_2082 = param3;
        this.arcane::var_1213.name_132 = param1.name_132;
        this.arcane::var_1213.name_26 = param1.name_26;
        this.arcane::var_1213.var_3262 = this.var_3262;
        this.arcane::var_1213.var_3056 = this.var_3056;
        this.arcane::var_1213.reset();
        var _loc5_: String = (_loc5_ = "") + this.arcane::var_1213.method_2833();
        for each(_loc6_ in this.var_2435) {
            if (_loc6_.priority < const_1763) {
                _loc5_ += _loc6_.method_2174(param1, this.arcane::var_1213);
            }
        }
        _loc5_ += this.arcane::var_1213.method_1282();
        for each(_loc6_ in this.var_2435) {
            if (_loc6_.priority >= const_1763 && _loc6_.priority < const_717) {
                _loc5_ += _loc6_.method_2174(param1, this.arcane::var_1213);
            }
        }
        _loc5_ += this.arcane::var_1213.method_3047();
        for each(_loc6_ in this.var_2435) {
            if (_loc6_.priority >= const_717) {
                _loc5_ += _loc6_.method_2174(param1, this.arcane::var_1213);
            }
        }
        return _loc5_ + this.arcane::var_1213.method_3234();
    }

    public function method_45(param1: class_1774, param2: String, param3: String): String {
        var _loc5_: * = null;
        var _loc4_: String = "";
        if (this.var_4176) {
            this.arcane::var_1213.method_4526(param2, param3);
            _loc4_ += "mov " + this.arcane::var_1213.var_741 + ".xy," + this.arcane::var_1213.var_4345.toString() + "\n";
            for each(_loc5_ in this.var_2435) {
                _loc4_ += _loc5_.method_45(param1, this.arcane::var_1213);
            }
            _loc4_ += "mov " + this.arcane::var_1213.var_2764.toString() + "," + this.arcane::var_1213.var_741 + ".xy\n";
        } else {
            _loc4_ += "mov " + param3 + "," + param2 + "\n";
        }
        return _loc4_;
    }

    public function method_2535(param1: class_1774, param2: String, param3: String): String {
        return this.arcane::var_1213.method_1835(param2);
    }

    public function method_5085(param1: class_1774): void {
        this.arcane::var_1213.method_2643();
        this.arcane::var_1213.method_5167(this.arcane::var_1213.var_4178.index, 0, 1, 2, 0);
    }

    override public function get method_3822(): Boolean {
        return false;
    }

    override public function method_3534(): void {
    }

    override public function dispose(): void {
        var _loc1_: * = null;
        for each(_loc1_ in this.var_4857) {
            _loc1_.dispose();
        }
        super.dispose();
    }

    arcane function method_4865(param1: class_2114): void {
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc6_: Boolean = false;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc14_: * = null;
        var _loc15_: int = 0;
        var _loc16_: int = 0;
        var _loc17_: int = 0;
        var _loc18_: int = 0;
        var _loc19_: * = null;
        var _loc20_: * = 0;
        var _loc21_: * = null;
        var _loc22_: * = 0;
        var _loc23_: * = 0;
        var _loc24_: * = 0;
        if (this.var_2254 == null) {
            throw new Error("no initParticleFunc set");
        }
        var _loc2_: class_2591 = param1.geometry as class_2591;
        if (!_loc2_) {
            throw new Error("Particle animation can only be performed on a ParticleGeometry object");
        }
        _loc3_ = 0;
        for (; _loc3_ < param1.method_3381.length; _loc3_++) {
            _loc7_ = (_loc8_ = param1.method_3381[_loc3_]).subGeometry;
            if (param1.shareAnimationGeometry) {
                if (_loc5_ = this.var_4857[_loc7_]) {
                    _loc8_.var_1937 = _loc5_;
                    continue;
                }
            }
            _loc5_ = _loc8_.var_1937 = new class_2575();
            if (param1.shareAnimationGeometry) {
                this.var_4857[_loc7_] = _loc5_;
            }
            _loc6_ = true;
            _loc5_.method_3092(_loc7_.numVertices, this.var_547);
        }
        if (!_loc6_) {
            return;
        }
        var _loc10_: Vector.<class_2685>;
        var _loc11_: uint = (_loc10_ = _loc2_.particles).length;
        var _loc12_: uint = uint(_loc2_.var_4203);
        var _loc13_: class_2580;
        (_loc13_ = new class_2580()).total = _loc12_;
        _loc13_.startTime = 0;
        _loc13_.duration = 1000;
        _loc13_.delay = 0.1;
        _loc3_ = 0;
        _loc4_ = 0;
        while (_loc3_ < _loc12_) {
            _loc13_.index = _loc3_;
            this.var_2254(_loc13_);
            for each(_loc9_ in this.var_1363) {
                _loc9_.arcane::method_5880(_loc13_);
            }
            while (_loc4_ < _loc11_ && (_loc14_ = _loc10_[_loc4_]).var_2860 == _loc3_) {
                for each(_loc8_ in param1.method_3381) {
                    if (_loc8_.subGeometry == _loc14_.subGeometry) {
                        _loc5_ = _loc8_.var_1937;
                        break;
                    }
                }
                _loc20_ = uint(_loc14_.numVertices);
                _loc21_ = _loc5_.name_104;
                _loc22_ = _loc20_ * Number(this.var_547);
                _loc23_ = Number(_loc5_.var_1472) * Number(this.var_547);
                for each(_loc9_ in this.var_1363) {
                    _loc19_ = _loc9_.method_561;
                    _loc15_ = int(_loc9_.method_3305);
                    _loc16_ = _loc23_ + _loc9_.arcane::var_4676;
                    _loc17_ = 0;
                    while (_loc17_ < _loc22_) {
                        _loc24_ = _loc16_ + _loc17_;
                        _loc18_ = 0;
                        while (_loc18_ < _loc15_) {
                            _loc21_[_loc24_ + _loc18_] = _loc19_[_loc18_];
                            _loc18_++;
                        }
                        _loc17_ += this.var_547;
                    }
                }
                if (this.var_316.length) {
                    _loc5_.var_2059.push(new class_2576(_loc3_, _loc13_.startTime, _loc13_.duration, _loc13_.delay, _loc14_));
                }
                _loc5_.var_1472 += _loc20_;
                _loc4_++;
            }
            _loc3_++;
        }
    }
}
}
