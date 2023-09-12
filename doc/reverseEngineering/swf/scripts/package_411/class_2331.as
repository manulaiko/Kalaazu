package package_411 {

import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.TimerEvent;
import flash.filters.GlowFilter;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.utils.Timer;

public class class_2331 extends Sprite {


    public var var_3227: Boolean = false;

    private const const_2765: uint = 8421504;

    private var var_2282: Sprite;

    private var var_417: BitmapData;

    private var var_2391: BitmapData;

    private var var_1445: Array;

    private var var_780: Array;

    private var glow: GlowFilter;

    public var var_1903: Number;

    private var var_1432: Timer;

    public var startX: Number;

    public var startY: Number;

    public var endX: Number;

    public var endY: Number;

    public var len: Number;

    public var var_2660: Number;

    public var var_1250: Number;

    public var var_4479: uint;

    public var var_2958: Number;

    private var var_564: uint;

    private var var_2394: uint;

    public var smooth: Sprite;

    public var var_3512: Sprite;

    public var var_604: Array;

    public var var_833: uint = 50;

    public var var_1668: uint;

    public var _color: uint;

    private var generation: uint;

    private var var_1491: uint = 3;

    private var var_4131: Number = 0.025;

    private var var_2294: Number = 0;

    private var var_2921: uint = 4;

    private var var_3920: Number = 0.5;

    private var var_4554: Number = 0;

    private var var_2208: Number = 60;

    private var var_4902: Number = 0;

    private var var_26: Number = 0;

    private var var_4617: Boolean = false;

    private var var_1526: Number = 0;

    private var var_4794: Number = 0;

    public var _isVisible: Boolean = true;

    public var var_1381: Boolean = true;

    public var var_445: class_2331;

    private var var_125: Number;

    private var var_1855: Number;

    private var initialized: Boolean = false;

    private var var_2119: Number = 0.3;

    private var var_4764: Number = 0.5;

    private var var_803: Number = 1;

    private var var_3220: Number;

    private var var_1679: Number;

    public var var_2690: String;

    public var var_1645: String;

    private var position: Number = 0;

    private var absolutePosition: Number = 1;

    private var var_1907: Number;

    private var var_4774: Number;

    private var var_184: Number;

    private var var_452: Number;

    private var var_2213: Number;

    private var var_609: Number;

    private var var_4594: Number;

    private var var_74: Number;

    private var angle: Number;

    private var tx: Number;

    private var ty: Number;

    private const RADTODEG: Number = 57.29577951308232;

    public function class_2331(param1: uint = 16777215, param2: Number = 2, param3: uint = 0) {
        this.var_604 = [];
        super();
        mouseEnabled = false;
        this._color = param1;
        this.var_125 = param2;
        this.var_2690 = class_2330.const_2057;
        this.var_1645 = class_2330.NONE;
        this.generation = param3;
        if (this.generation == 0) {
            this.init();
        }
    }

    private function init(): void {
        this.method_2034();
        if (this.var_1903 > 0) {
            this.method_6091();
        }
        this.var_1250 = 0.03;
        this.var_2282 = new Sprite();
        this.var_2282.mouseEnabled = false;
        this.startX = 50;
        this.startY = 200;
        this.endX = 50;
        this.endY = 600;
        this.var_2958 = 4;
        this.var_4479 = 50;
        this.var_417 = new BitmapData(this.var_4479, 1, false);
        this.var_2391 = new BitmapData(this.var_4479, 1, false);
        this.var_1445 = [new Point(0, 0), new Point(0, 0)];
        this.var_780 = [new Point(0, 0), new Point(0, 0)];
        if (this.generation == 0) {
            this.smooth = new Sprite();
            this.var_3512 = new Sprite();
            this.method_1119 = 50;
            this.method_6232 = 50;
        } else {
            this.smooth = this.var_3512 = this.var_445.var_3512;
        }
        this.steps = 100;
        this.method_3399 = 0.5;
        addChild(this.var_2282);
        this.initialized = true;
    }

    private function method_2034(): void {
        this.var_564 = Math.random() * 100;
        this.var_2394 = Math.random() * 100;
    }

    public function set steps(param1: uint): void {
        if (param1 < 2) {
            param1 = 2;
        }
        if (param1 > 2880) {
            param1 = 2880;
        }
        this.var_4479 = param1;
        this.var_417 = new BitmapData(this.var_4479, 1, false);
        this.var_2391 = new BitmapData(this.var_4479, 1, false);
        if (this.generation == 0) {
            this.method_1119 = this.method_1119;
        }
    }

    public function get steps(): uint {
        return this.var_4479;
    }

    public function method_6091(): void {
        this.var_1432 = new Timer(Number(this.var_1903) * 1000, 1);
        this.var_1432.start();
        this.var_1432.addEventListener(TimerEvent.TIMER, this.method_431);
    }

    private function method_431(param1: TimerEvent): void {
        this.kill();
    }

    public function kill(): void {
        var _loc1_: Number = 0;
        var _loc2_: * = null;
        var _loc3_: * = null;
        this.method_1157();
        if (this.var_1432) {
            this.var_1432.removeEventListener(TimerEvent.TIMER, this.kill);
            this.var_1432.stop();
        }
        if (this.var_445 != null) {
            _loc1_ = 0;
            _loc2_ = this.parent as class_2331;
            for each(_loc3_ in _loc2_.var_604) {
                if (_loc3_.instance == this) {
                    _loc2_.var_604.splice(_loc1_, 1);
                }
                _loc1_++;
            }
        }
        this.parent.removeChild(this);
        delete global[this];
    }

    public function method_1157(): void {
        var _loc1_: * = null;
        while (this.var_604.length > 0) {
            _loc1_ = this.var_604[0].instance;
            _loc1_.kill();
        }
    }

    public function method_3680(param1: uint = 1, param2: Boolean = false): void {
        var _loc3_: * = 0;
        var _loc4_: Number = 0;
        var _loc5_: * = 0;
        var _loc6_: * = 0;
        var _loc7_: Number = NaN;
        var _loc8_: * = null;
        if (this.generation < this.method_5955 && this.var_604.length < this.method_4801) {
            _loc3_ = Number(this.steps) * Number(this.method_3399);
            if (_loc3_ >= 2) {
                _loc4_ = 0;
                while (_loc4_ < param1) {
                    _loc5_ = Math.random() * Number(this.steps);
                    _loc6_ = Math.random() * Number(this.steps);
                    while (_loc6_ == _loc5_) {
                        _loc6_ = Math.random() * Number(this.steps);
                    }
                    _loc7_ = Math.random() * Number(this.childrenAngleVariation) - Number(this.childrenAngleVariation) / 2;
                    (_loc8_ = new class_2331(this.color, this.thickness, this.generation + 1)).var_445 = this;
                    _loc8_.var_1903 = Math.random() * (Number(this.method_2031) - Number(this.method_2821)) + this.method_2821;
                    _loc8_.position = 1 - _loc5_ / Number(this.steps);
                    _loc8_.absolutePosition = Number(this.absolutePosition) * Number(_loc8_.position);
                    _loc8_.var_2690 = this.var_2690;
                    _loc8_.var_1645 = this.var_1645;
                    if (this.var_2690 == class_2330.const_2057) {
                        _loc8_.alpha = 1 - 1 / (this.method_5955 + 1) * Number(_loc8_.generation);
                    }
                    if (this.var_1645 == class_2330.const_2057) {
                        _loc8_.thickness = Number(this.thickness) - this.thickness / (this.method_5955 + 1) * Number(_loc8_.generation);
                    }
                    _loc8_.method_5955 = this.method_5955;
                    _loc8_.method_4801 = Number(this.method_4801) * (1 - Number(this.method_3470));
                    _loc8_.method_2950 = Number(this.method_2950) * (1 - Number(this.method_3263));
                    _loc8_.method_3263 = this.method_3263;
                    _loc8_.method_3399 = this.method_3399;
                    _loc8_.method_2815 = this.method_2815;
                    _loc8_.wavelength = this.wavelength;
                    _loc8_.amplitude = this.amplitude;
                    _loc8_.speed = this.speed;
                    _loc8_.init();
                    this.var_604.push({
                        "instance": _loc8_,
                        "startStep": _loc5_,
                        "endStep": _loc6_,
                        "detachedEnd": this.method_2815,
                        "childAngle": _loc7_
                    });
                    addChild(_loc8_);
                    _loc8_.steps = Number(this.steps) * (1 - Number(this.method_3399));
                    if (param2) {
                        _loc8_.method_3680(param1, true);
                    }
                    _loc4_++;
                }
            }
        }
    }

    public function update(): void {
        var _loc1_: Number = NaN;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: Number = NaN;
        if (this.initialized) {
            this.var_1907 = Number(this.endX) - Number(this.startX);
            this.var_4774 = Number(this.endY) - Number(this.startY);
            this.len = Math.sqrt(Number(this.var_1907) * Number(this.var_1907) + Number(this.var_4774) * Number(this.var_4774));
            this.var_1445[0].x += Number(this.steps) / 100 * Number(this.speed);
            this.var_1445[0].y += Number(this.steps) / 100 * Number(this.speed);
            this.var_417.perlinNoise(Number(this.steps) / 20, Number(this.steps) / 20, 1, this.var_564, false, true, 7, true, this.var_1445);
            this.var_3220 = Number(this.steps) * Number(this.wavelength);
            this.var_1679 = Number(this.var_3220) * 0.1 * Number(this.speed);
            this.var_780[0].x -= this.var_1679;
            this.var_780[0].y += this.var_1679;
            this.var_2391.perlinNoise(this.var_3220, this.var_3220, 1, this.var_2394, false, true, 7, true, this.var_780);
            if (this.method_1119 > 0) {
                _loc3_ = new Matrix();
                _loc3_.scale(Number(this.steps) / Number(this.smooth.width), 1);
                this.var_2391.draw(this.smooth, _loc3_);
            }
            if (this.var_445 != null) {
                this.isVisible = this.var_445.isVisible;
            } else if (this.maxLength == 0) {
                this.isVisible = true;
            } else {
                if (this.len <= this.maxLength) {
                    _loc4_ = 1;
                } else if (this.len > this.maxLength + this.method_1075) {
                    _loc4_ = 0;
                } else {
                    _loc4_ = 1 - (Number(this.len) - Number(this.maxLength)) / Number(this.method_1075);
                }
                this.isVisible = Math.random() < _loc4_ ? true : false;
            }
            _loc1_ = Math.random();
            if (_loc1_ < this.method_2950) {
                this.method_3680();
            }
            if (this.isVisible) {
                this.render();
            }
            for each(_loc2_ in this.var_604) {
                _loc2_.instance.update();
            }
        }
    }

    public function render(): void {
        var _loc1_: * = null;
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        this.var_2282.graphics.clear();
        this.var_2282.graphics.lineStyle(this.thickness, this._color);
        this.angle = Math.atan2(Number(this.endY) - Number(this.startY), Number(this.endX) - Number(this.startX));
        var _loc2_: Number = 0;
        while (_loc2_ < this.steps) {
            _loc3_ = 1 / Number(this.steps) * (Number(this.steps) - _loc2_);
            _loc4_ = 1;
            _loc5_ = Number(this.thickness);
            if (this.var_2690 == class_2330.const_193) {
                _loc4_ = Number(this.absolutePosition) * _loc3_;
            }
            if (this.var_1645 == class_2330.const_193) {
                _loc5_ = Number(this.thickness) * (Number(this.absolutePosition) * _loc3_);
            }
            if (this.var_2690 == class_2330.const_193 || this.var_1645 == class_2330.const_193) {
                this.var_2282.graphics.lineStyle(int(_loc5_), this._color, _loc4_);
            }
            this.var_184 = (Number(this.var_417.getPixel(_loc2_, 0)) - 8421504) / 16777215 * Number(this.len) * Number(this.var_1250);
            this.var_452 = Math.sin(this.angle) * Number(this.var_184);
            this.var_2213 = Math.cos(this.angle) * Number(this.var_184);
            this.var_609 = (Number(this.var_2391.getPixel(_loc2_, 0)) - 8421504) / 16777215 * Number(this.len) * Number(this.amplitude);
            this.var_4594 = Math.sin(this.angle) * Number(this.var_609);
            this.var_74 = Math.cos(this.angle) * Number(this.var_609);
            this.tx = this.startX + this.var_1907 / (this.steps - 1) * _loc2_ + this.var_452 + this.var_4594;
            this.ty = this.startY + this.var_4774 / (this.steps - 1) * _loc2_ - Number(this.var_2213) - Number(this.var_74);
            if (_loc2_ == 0) {
                this.var_2282.graphics.moveTo(this.tx, this.ty);
            }
            this.var_2282.graphics.lineTo(this.tx, this.ty);
            for each(_loc1_ in this.var_604) {
                if (_loc1_.startStep == _loc2_) {
                    _loc1_.instance.startX = this.tx;
                    _loc1_.instance.startY = this.ty;
                }
                if (_loc1_.detachedEnd) {
                    _loc6_ = this.angle + Number(_loc1_.childAngle) / 57.29577951308232;
                    _loc7_ = Number(this.len) * Number(this.method_3399);
                    _loc1_.instance.endX = _loc1_.instance.startX + Math.cos(_loc6_) * _loc7_;
                    _loc1_.instance.endY = _loc1_.instance.startY + Math.sin(_loc6_) * _loc7_;
                } else if (_loc1_.endStep == _loc2_) {
                    _loc1_.instance.endX = this.tx;
                    _loc1_.instance.endY = this.ty;
                }
            }
            _loc2_++;
        }
    }

    public function method_5863(): void {
        var _loc1_: * = null;
        while (this.var_604.length > this.method_4801) {
            _loc1_ = this.var_604[this.var_604.length - 1].instance;
            _loc1_.kill();
        }
    }

    public function set method_1119(param1: Number): void {
        var _loc2_: * = null;
        var _loc3_: * = 0;
        if (this.smooth) {
            this.var_833 = param1;
            _loc2_ = new Matrix();
            _loc2_.createGradientBox(this.steps, 1);
            _loc3_ = Number(this.var_833) / 100 * 128;
            this.smooth.graphics.clear();
            this.smooth.graphics.beginGradientFill("linear", [8421504, 8421504, 8421504, 8421504], [1, 0, 0, 1], [0, _loc3_, 255 - _loc3_, 255], _loc2_);
            this.smooth.graphics.drawRect(0, 0, this.steps, 1);
            this.smooth.graphics.endFill();
        }
    }

    public function set method_6232(param1: Number): void {
        this.var_1668 = param1;
        var _loc2_: Matrix = new Matrix();
        _loc2_.createGradientBox(this.steps, 1);
        var _loc3_: uint = Number(this.var_1668) / 100 * 128;
        this.var_3512.graphics.clear();
        this.var_3512.graphics.beginGradientFill("linear", [8421504, 8421504, 8421504, 8421504], [1, 0, 0, 1], [0, _loc3_, 255 - _loc3_, 255], _loc2_);
        this.var_3512.graphics.drawRect(0, 0, this.steps, 1);
        this.var_3512.graphics.endFill();
    }

    public function get method_1119(): Number {
        return this.var_833;
    }

    public function get method_6232(): Number {
        return this.var_1668;
    }

    public function set color(param1: uint): void {
        var _loc2_: * = null;
        this._color = param1;
        this.glow.color = param1;
        this.var_2282.filters = [this.glow];
        for each(_loc2_ in this.var_604) {
            _loc2_.instance.color = param1;
        }
    }

    public function get color(): uint {
        return this._color;
    }

    public function set method_2950(param1: Number): void {
        if (param1 > 1) {
            param1 = 1;
        } else if (param1 < 0) {
            param1 = 0;
        }
        this.var_4131 = param1;
    }

    public function get method_2950(): Number {
        return this.var_4131;
    }

    public function set method_3263(param1: Number): void {
        if (param1 > 1) {
            param1 = 1;
        } else if (param1 < 0) {
            param1 = 0;
        }
        this.var_2294 = param1;
    }

    public function get method_3263(): Number {
        return this.var_2294;
    }

    public function set maxLength(param1: Number): void {
        this.var_1526 = param1;
    }

    public function get maxLength(): Number {
        return this.var_1526;
    }

    public function set method_1075(param1: Number): void {
        this.var_4794 = param1;
    }

    public function get method_1075(): Number {
        return this.var_4794;
    }

    public function set thickness(param1: Number): void {
        if (param1 < 0) {
            param1 = 0;
        }
        this.var_125 = param1;
    }

    public function get thickness(): Number {
        return this.var_125;
    }

    public function set method_3645(param1: Number): void {
        if (param1 > 1) {
            param1 = 1;
        } else if (param1 < 0) {
            param1 = 0;
        }
        this.var_1855 = param1;
    }

    public function get method_3645(): Number {
        return this.var_1855;
    }

    public function set method_3399(param1: Number): void {
        if (param1 > 1) {
            param1 = 1;
        } else if (param1 < 0) {
            param1 = 0;
        }
        this.var_4554 = param1;
    }

    public function get method_3399(): Number {
        return this.var_4554;
    }

    public function set method_5955(param1: uint): void {
        this.var_1491 = param1;
        this.method_5863();
    }

    public function get method_5955(): uint {
        return this.var_1491;
    }

    public function set method_4801(param1: uint): void {
        this.var_2921 = param1;
        this.method_5863();
    }

    public function get method_4801(): uint {
        return this.var_2921;
    }

    public function set method_3470(param1: Number): void {
        if (param1 > 1) {
            param1 = 1;
        } else if (param1 < 0) {
            param1 = 0;
        }
        this.var_3920 = param1;
    }

    public function get method_3470(): Number {
        return this.var_3920;
    }

    public function set childrenAngleVariation(param1: Number): void {
        var _loc2_: * = null;
        this.var_2208 = param1;
        for each(_loc2_ in this.var_604) {
            _loc2_.childAngle = Math.random() * param1 - param1 / 2;
            _loc2_.instance.childrenAngleVariation = param1;
        }
    }

    public function get childrenAngleVariation(): Number {
        return this.var_2208;
    }

    public function set method_2821(param1: Number): void {
        this.var_4902 = param1;
    }

    public function get method_2821(): Number {
        return this.var_4902;
    }

    public function set method_2031(param1: Number): void {
        this.var_26 = param1;
    }

    public function get method_2031(): Number {
        return this.var_26;
    }

    public function set method_2815(param1: Boolean): void {
        this.var_4617 = param1;
    }

    public function get method_2815(): Boolean {
        return this.var_4617;
    }

    public function set wavelength(param1: Number): void {
        var _loc2_: * = null;
        this.var_2119 = param1;
        for each(_loc2_ in this.var_604) {
            _loc2_.instance.wavelength = param1;
        }
    }

    public function get wavelength(): Number {
        return this.var_2119;
    }

    public function set amplitude(param1: Number): void {
        var _loc2_: * = null;
        this.var_4764 = param1;
        for each(_loc2_ in this.var_604) {
            _loc2_.instance.amplitude = param1;
        }
    }

    public function get amplitude(): Number {
        return this.var_4764;
    }

    public function set speed(param1: Number): void {
        var _loc2_: * = null;
        this.var_803 = param1;
        for each(_loc2_ in this.var_604) {
            _loc2_.instance.speed = param1;
        }
    }

    public function get speed(): Number {
        return this.var_803;
    }

    public function set isVisible(param1: Boolean): void {
        this._isVisible = visible = param1;
    }

    public function get isVisible(): Boolean {
        return this._isVisible;
    }
}
}
