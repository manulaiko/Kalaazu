package package_366 {

import away3d.animators.SkeletonAnimator;
import away3d.animators.class_2119;
import away3d.animators.class_2121;
import away3d.animators.class_2438;
import away3d.animators.class_2439;
import away3d.animators.class_2642;
import away3d.arcane;

import flash.display.BitmapData;
import flash.display.BlendMode;
import flash.display.Sprite;
import flash.geom.ColorTransform;
import flash.geom.Matrix;
import flash.geom.Matrix3D;
import flash.geom.Vector3D;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import flash.utils.Endian;

import package_293.class_1751;
import package_293.class_2131;

import package_294.class_2398;
import package_294.class_2425;
import package_294.class_2429;
import package_294.class_2602;

import package_295.class_1752;

import package_299.class_1757;
import package_299.class_1758;
import package_299.class_2615;
import package_299.class_2643;

import package_304.class_2114;
import package_304.class_2418;

import package_305.class_1767;

import package_307.class_1772;
import package_307.class_1775;
import package_307.class_1776;
import package_307.class_2445;
import package_307.class_2446;
import package_307.class_2448;
import package_307.class_2449;

import package_310.class_1780;
import package_310.class_2245;
import package_310.class_2247;
import package_310.class_2249;
import package_310.class_2484;
import package_310.class_2499;
import package_310.class_2604;
import package_310.class_2605;
import package_310.class_2606;
import package_310.class_2607;
import package_310.class_2609;
import package_310.class_2611;
import package_310.class_2613;
import package_310.class_2616;
import package_310.class_2618;
import package_310.class_2619;
import package_310.class_2620;
import package_310.class_2623;
import package_310.class_2624;
import package_310.class_2625;
import package_310.class_2626;
import package_310.class_2629;
import package_310.class_2630;
import package_310.class_2631;
import package_310.class_2632;
import package_310.class_2633;
import package_310.class_2635;
import package_310.class_2637;
import package_310.class_2638;
import package_310.class_2640;
import package_310.class_2641;

import package_363.class_2100;
import package_363.class_2101;

import package_364.DirectionalLight;
import package_364.PointLight;
import package_364.class_2102;

import package_368.class_2416;

import package_369.class_2115;
import package_369.class_2116;
import package_369.class_2117;
import package_369.class_2118;
import package_369.class_2570;
import package_369.class_2621;
import package_369.class_2622;

import package_386.class_2614;
import package_386.class_2617;
import package_386.class_2627;
import package_386.class_2628;
import package_386.class_2636;

import package_429.CascadeShadowMapper;
import package_429.CubeMapShadowMapper;
import package_429.DirectionalShadowMapper;
import package_429.NearDirectionalShadowMapper;
import package_429.class_2393;

import package_430.class_2437;

import package_431.class_2436;
import package_431.class_2610;
import package_431.class_2639;

import package_434.class_2450;

import package_435.class_2414;

import package_436.CapsuleGeometry;
import package_436.ConeGeometry;
import package_436.CubeGeometry;
import package_436.CylinderGeometry;
import package_436.PlaneGeometry;
import package_436.SphereGeometry;
import package_436.TorusGeometry;
import package_436.class_2417;

import package_441.class_2430;

public class AWD2Parser extends class_2105 {

    public static const const_2525: String = "lzma";

    public static const const_1857: uint = 0;

    public static const const_430: uint = 1;

    public static const const_2359: uint = 2;

    public static const const_587: uint = 1;

    public static const const_1138: uint = 2;

    public static const const_535: uint = 3;

    public static const const_2540: uint = 4;

    public static const const_1815: uint = 5;

    public static const const_1768: uint = 6;

    public static const const_2413: uint = 7;

    public static const const_842: uint = 8;

    public static const const_1351: uint = 21;

    public static const COLOR: uint = 22;

    public static const const_114: uint = 23;

    public static const const_1808: uint = 31;

    public static const const_2105: uint = 32;

    public static const const_916: uint = 41;

    public static const const_2759: uint = 42;

    public static const const_440: uint = 43;

    public static const const_1386: uint = 44;

    public static const const_2992: uint = 45;

    public static const const_1160: uint = 46;

    public static const const_3108: uint = 47;


    private var _debug: Boolean = false;

    private var var_2617: ByteArray;

    private var var_1005: uint;

    private var var_33: Vector.<AWDBlock>;

    private var var_107: ByteArray;

    private var _version: Array;

    private var var_4002: uint;

    private var var_2128: Boolean;

    private var var_4021: Boolean;

    private var var_2320: Boolean;

    private var var_3614: Boolean;

    private var var_599: uint;

    private var var_3981: uint;

    private var var_290: uint;

    private var var_3619: Boolean;

    private var var_2113: Object;

    private var var_4106: ByteArray;

    private var var_2524: class_2117;

    private var var_1730: class_2622;

    private var var_3335: class_1776;

    private var var_1477: Array;

    private var var_240: Vector.<String>;

    private var var_263: Vector.<uint>;

    public function AWD2Parser() {
        super(class_2419.BINARY);
        this.var_240 = new Vector.<String>();
        this.var_240.push(BlendMode.NORMAL);
        this.var_240.push(BlendMode.ADD);
        this.var_240.push(BlendMode.ALPHA);
        this.var_240.push(BlendMode.DARKEN);
        this.var_240.push(BlendMode.DIFFERENCE);
        this.var_240.push(BlendMode.ERASE);
        this.var_240.push(BlendMode.HARDLIGHT);
        this.var_240.push(BlendMode.INVERT);
        this.var_240.push(BlendMode.LAYER);
        this.var_240.push(BlendMode.LIGHTEN);
        this.var_240.push(BlendMode.MULTIPLY);
        this.var_240.push(BlendMode.NORMAL);
        this.var_240.push(BlendMode.OVERLAY);
        this.var_240.push(BlendMode.SCREEN);
        this.var_240.push(BlendMode.SHADER);
        this.var_240.push(BlendMode.OVERLAY);
        this.var_263 = new Vector.<uint>();
        this.var_263.push(256);
        this.var_263.push(512);
        this.var_263.push(2048);
        this.var_263.push(1024);
    }

    public static function supportsType(param1: String): Boolean {
        param1 = param1.toLowerCase();
        return param1 == "awd";
    }

    public static function supportsData(param1: *): Boolean {
        return class_2414.toString(param1, 3) == "AWD";
    }

    override arcane function method_3765(param1: class_2416): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        if (param1.assets.length == 1) {
            _loc2_ = param1.id.split("#");
            _loc3_ = _loc2_[0];
            if (_loc2_.length == 1) {
                if (_loc4_ = param1.assets[0] as class_2116) {
                    (_loc6_ = this.var_33[parseInt(param1.id)]).data = _loc4_;
                    _loc4_.method_4647(_loc6_.name, null, true);
                    _loc6_.name = _loc4_.name;
                    method_3342(_loc4_);
                    if (!this._debug) {
                    }
                }
            }
            if (_loc2_.length > 1) {
                _loc5_ = param1.assets[0] as class_2117;
                this.var_1477[uint(_loc2_[1])] = class_2117(_loc5_).bitmapData;
                this.var_2113[_loc3_].push(1);
                if (!this._debug) {
                }
                if (this.var_2113[_loc3_].length == this.var_1477.length) {
                    _loc4_ = new class_2622(this.var_1477[0], this.var_1477[1], this.var_1477[2], this.var_1477[3], this.var_1477[4], this.var_1477[5]);
                    (_loc6_ = this.var_33[_loc3_]).data = _loc4_;
                    _loc4_.method_4647(_loc6_.name, null, true);
                    _loc6_.name = _loc4_.name;
                    method_3342(_loc4_);
                    if (!this._debug) {
                    }
                }
            }
        }
    }

    override arcane function resolveDependencyFailure(param1: class_2416): void {
    }

    override arcane function method_5931(param1: class_2416, param2: class_1751): String {
        var _loc5_: * = null;
        var _loc3_: String = param2.name;
        if (param2) {
            _loc5_ = this.var_33[parseInt(param1.id)];
            param2.method_4647(_loc5_.name, null, true);
        }
        var _loc4_: String = param2.name;
        param2.name = _loc3_;
        return _loc4_;
    }

    override protected function method_2030(param1: Number): void {
        super.method_2030(param1);
        this.var_2113 = {};
        this.var_2617 = method_5043();
        this.var_33 = new Vector.<AWDBlock>();
        this.var_33[0] = new AWDBlock();
        this.var_33[0].data = null;
        this._version = [];
        this.var_2617.endian = Endian.LITTLE_ENDIAN;
        this.method_6034();
        switch (this.var_4002) {
            case const_430:
                this.var_4106 = new ByteArray();
                this.var_2617.readBytes(this.var_4106, 0, this.var_2617.bytesAvailable);
                this.var_4106.uncompress();
                break;
            case const_2359:
                this.var_4106 = new ByteArray();
                this.var_2617.readBytes(this.var_4106, 0, this.var_2617.bytesAvailable);
                this.var_4106.uncompress(const_2525);
                break;
            case const_1857:
                this.var_4106 = this.var_2617;
        }
        this.var_4106.endian = Endian.LITTLE_ENDIAN;
    }

    override protected function method_196(): Boolean {
        while (this.var_4106.bytesAvailable > 0 && !method_3984 && Boolean(method_2812())) {
            this.method_2968();
        }
        if (this.var_4106.bytesAvailable == 0) {
            return const_2361;
        }
        return const_2971;
    }

    private function method_6034(): void {
        var _loc1_: * = 0;
        var _loc2_: Number = NaN;
        this.var_2617.position = 3;
        this._version[0] = this.var_2617.readUnsignedByte();
        this._version[1] = this.var_2617.readUnsignedByte();
        _loc1_ = uint(this.var_2617.readUnsignedShort());
        this.var_3619 = bitFlags.test(_loc1_, bitFlags.FLAG1);
        if (this._version[0] == 2 && this._version[1] == 1) {
            this.var_4021 = bitFlags.test(_loc1_, bitFlags.FLAG2);
            this.var_2320 = bitFlags.test(_loc1_, bitFlags.FLAG3);
            this.var_3614 = bitFlags.test(_loc1_, bitFlags.FLAG4);
        }
        this.var_3981 = const_2413;
        if (this.var_2320) {
            this.var_3981 = const_842;
        }
        this.var_599 = const_2413;
        if (this.var_4021) {
            this.var_599 = const_842;
        }
        this.var_290 = const_2413;
        if (this.var_3614) {
            this.var_290 = const_842;
        }
        this.var_4002 = this.var_2617.readUnsignedByte();
        if (!this._debug) {
        }
        _loc2_ = Number(this.var_2617.readUnsignedInt());
        if (!this.var_3619 && _loc2_ != this.var_2617.bytesAvailable) {
            method_444("AWD2 body length does not match header integrity field");
        }
    }

    private function method_2968(): void {
        var _loc1_: * = null;
        var _loc3_: Boolean = false;
        var _loc4_: * = 0;
        var _loc5_: * = 0;
        var _loc6_: * = 0;
        var _loc7_: * = 0;
        this.var_1005 = this.var_4106.readUnsignedInt();
        _loc4_ = uint(this.var_4106.readUnsignedByte());
        _loc5_ = uint(this.var_4106.readUnsignedByte());
        _loc6_ = uint(this.var_4106.readUnsignedByte());
        _loc7_ = uint(this.var_4106.readUnsignedInt());
        var _loc8_: Boolean = Boolean(bitFlags.test(_loc6_, bitFlags.FLAG4));
        var _loc9_: Boolean = Boolean(bitFlags.test(_loc6_, bitFlags.FLAG5));
        if (this.var_2128) {
            this.var_4021 = bitFlags.test(_loc6_, bitFlags.FLAG1);
            this.var_2320 = bitFlags.test(_loc6_, bitFlags.FLAG2);
            this.var_3614 = bitFlags.test(_loc6_, bitFlags.FLAG3);
            this.var_3981 = const_2413;
            if (this.var_2320) {
                this.var_3981 = const_842;
            }
            this.var_599 = const_2413;
            if (this.var_4021) {
                this.var_599 = const_842;
            }
            this.var_290 = const_2413;
            if (this.var_3614) {
                this.var_290 = const_842;
            }
        }
        var _loc10_: uint = this.var_4106.position + _loc7_;
        if (_loc7_ > this.var_4106.bytesAvailable) {
            method_444("AWD2 block length is bigger than the bytes that are available!");
            this.var_4106.position += this.var_4106.bytesAvailable;
            return;
        }
        this.var_107 = new ByteArray();
        this.var_4106.readBytes(this.var_107, 0, _loc7_);
        if (_loc8_) {
            if (_loc9_) {
                this.var_107.uncompress(const_2525);
            } else {
                this.var_107.uncompress();
            }
        }
        this.var_107.endian = Endian.LITTLE_ENDIAN;
        this.var_107.position = 0;
        _loc1_ = new AWDBlock();
        _loc1_.len = this.var_107.position + _loc7_;
        _loc1_.id = this.var_1005;
        var _loc11_: uint = this.var_107.position + _loc7_;
        if (_loc8_) {
            _loc11_ = this.var_107.position + this.var_107.length;
            _loc1_.len = _loc11_;
        }
        if (!this._debug) {
        }
        this.var_33[this.var_1005] = _loc1_;
        if (this._version[0] == 2 && this._version[1] == 1) {
            switch (_loc5_) {
                case 11:
                    this.method_5181(this.var_1005);
                    _loc3_ = true;
                    break;
                case 31:
                    this.method_1987(this.var_1005);
                    _loc3_ = true;
                    break;
                case 41:
                    this.method_2823(this.var_1005);
                    _loc3_ = true;
                    break;
                case 42:
                    this.method_2976(this.var_1005);
                    _loc3_ = true;
                    break;
                case 43:
                    this.method_3926(this.var_1005);
                    _loc3_ = true;
                    break;
                case 51:
                    this.method_2270(this.var_1005);
                    _loc3_ = true;
                    break;
                case 81:
                    this.method_4269(this.var_1005);
                    _loc3_ = true;
                    break;
                case 83:
                    this.method_3533(this.var_1005);
                    _loc3_ = true;
                    break;
                case 91:
                    this.method_408(this.var_1005);
                    _loc3_ = true;
                    break;
                case 92:
                    this.method_730(this.var_1005);
                    _loc3_ = true;
                    break;
                case 111:
                    this.method_2854(this.var_1005, true);
                    _loc3_ = true;
                    break;
                case 112:
                    this.method_2854(this.var_1005);
                    _loc3_ = true;
                    break;
                case 113:
                    this.method_5397(this.var_1005);
                    _loc3_ = true;
                    break;
                case 122:
                    this.method_5798(this.var_1005);
                    _loc3_ = true;
                    break;
                case 253:
                    this.method_5916(this.var_1005);
                    _loc3_ = true;
            }
        }
        if (_loc3_ == false) {
            switch (_loc5_) {
                case 1:
                    this.method_1845(this.var_1005);
                    break;
                case 22:
                    this.method_319(this.var_1005);
                    break;
                case 23:
                    this.method_4290(this.var_1005);
                    break;
                case 81:
                    this.method_4352(this.var_1005);
                    break;
                case 82:
                    this.method_1239(this.var_1005);
                    break;
                case 101:
                    this.method_5620(this.var_1005);
                    break;
                case 102:
                    this.method_19(this.var_1005);
                    break;
                case 103:
                    this.method_5718(this.var_1005);
                    break;
                case 121:
                    this.method_6161(this.var_1005);
                    break;
                case 254:
                    this.method_1018(this.var_1005);
                    break;
                case 255:
                    this.method_1734(this.var_1005);
                    break;
                default:
                    if (!this._debug) {
                    }
                    this.var_107.position += _loc7_;
            }
        }
        var _loc12_: Number = 0;
        if (this.var_107.position == _loc11_) {
            if (this._debug) {
                if (_loc1_.errorMessages) {
                    while (_loc12_ < _loc1_.errorMessages.length) {
                        _loc12_++;
                    }
                }
            }
            if (!this._debug) {
            }
        } else if (this._debug) {
            if (_loc1_.errorMessages) {
                while (_loc12_ < _loc1_.errorMessages.length) {
                    _loc12_++;
                }
            }
        }
        this.var_4106.position = _loc10_;
        this.var_107 = null;
    }

    private function method_1845(param1: uint): void {
        var _loc10_: Number = 0;
        var _loc11_: * = 0;
        var _loc12_: * = 0;
        var _loc13_: * = null;
        var _loc14_: * = null;
        var _loc15_: * = null;
        var _loc16_: Number = NaN;
        var _loc17_: Number = NaN;
        var _loc18_: Boolean = false;
        var _loc19_: Number = 0;
        var _loc20_: * = 0;
        var _loc21_: * = 0;
        var _loc22_: * = 0;
        var _loc23_: * = 0;
        var _loc24_: Number = NaN;
        var _loc25_: Number = NaN;
        var _loc26_: Number = NaN;
        var _loc27_: * = null;
        var _loc28_: * = null;
        var _loc29_: * = null;
        var _loc30_: * = null;
        var _loc31_: * = null;
        var _loc32_: * = null;
        var _loc2_: class_2429 = new class_2429();
        var _loc3_: String = this.method_416();
        var _loc4_: uint = uint(this.var_107.readUnsignedShort());
        var _loc5_: AWDProperties;
        var _loc6_: Number = Number((_loc5_ = this.method_4466({
            "1": this.var_3981,
            "2": this.var_3981
        })).method_473(1, 1));
        var _loc7_: Number = Number(_loc5_.method_473(2, 1));
        var _loc8_: Vector.<class_2425> = new Vector.<class_2425>();
        var _loc9_: Number = 0;
        while (_loc9_ < _loc4_) {
            _loc11_ = uint(this.var_107.readUnsignedInt());
            _loc12_ = this.var_107.position + _loc11_;
            _loc15_ = this.method_4466({
                "1": this.var_3981,
                "2": this.var_3981
            });
            while (this.var_107.position < _loc12_) {
                _loc19_ = 0;
                _loc21_ = uint(this.var_107.readUnsignedByte());
                _loc20_ = uint(this.var_107.readUnsignedByte());
                _loc22_ = uint(this.var_107.readUnsignedInt());
                _loc23_ = this.var_107.position + _loc22_;
                if (_loc21_ == 1) {
                    _loc27_ = new Vector.<Number>();
                    while (this.var_107.position < _loc23_) {
                        _loc24_ = Number(this.readNumber(this.var_2320));
                        _loc25_ = Number(this.readNumber(this.var_2320));
                        _loc26_ = Number(this.readNumber(this.var_2320));
                        var _loc33_: *;
                        _loc27_[_loc33_ = _loc19_++] = _loc24_;
                        var _loc34_: *;
                        _loc27_[_loc34_ = _loc19_++] = _loc25_;
                        var _loc35_: *;
                        _loc27_[_loc35_ = _loc19_++] = _loc26_;
                    }
                } else if (_loc21_ == 2) {
                    _loc28_ = new Vector.<uint>();
                    while (this.var_107.position < _loc23_) {
                        _loc28_[_loc33_ = _loc19_++] = this.var_107.readUnsignedShort();
                    }
                } else if (_loc21_ == 3) {
                    _loc29_ = new Vector.<Number>();
                    while (this.var_107.position < _loc23_) {
                        _loc29_[_loc33_ = _loc19_++] = this.readNumber(this.var_2320);
                    }
                } else if (_loc21_ == 4) {
                    _loc30_ = new Vector.<Number>();
                    while (this.var_107.position < _loc23_) {
                        _loc30_[_loc33_ = _loc19_++] = this.readNumber(this.var_2320);
                    }
                } else if (_loc21_ == 5) {
                    _loc31_ = new Vector.<Number>();
                    while (this.var_107.position < _loc23_) {
                        _loc31_[_loc33_ = _loc19_++] = this.readNumber(this.var_2320);
                    }
                } else if (_loc21_ == 6) {
                    _loc13_ = new Vector.<Number>();
                    while (this.var_107.position < _loc23_) {
                        _loc13_[_loc33_ = _loc19_++] = Number(this.var_107.readUnsignedShort()) * 3;
                    }
                } else if (_loc21_ == 7) {
                    _loc14_ = new Vector.<Number>();
                    while (this.var_107.position < _loc23_) {
                        _loc14_[_loc33_ = _loc19_++] = this.readNumber(this.var_2320);
                    }
                } else if (_loc21_ == 8) {
                    _loc32_ = new Vector.<Number>();
                    while (this.var_107.position < _loc23_) {
                        _loc32_[_loc33_ = _loc19_++] = this.readNumber(this.var_2320);
                    }
                } else {
                    this.var_107.position = _loc23_;
                }
            }
            this.method_2421();
            _loc8_ = class_2450.method_5600(_loc27_, _loc28_, _loc29_, _loc30_, _loc31_, _loc14_, _loc13_, _loc32_);
            _loc16_ = Number(_loc15_.method_473(1, 1));
            _loc17_ = Number(_loc15_.method_473(2, 1));
            _loc18_ = false;
            if (_loc6_ != _loc16_ || _loc7_ != _loc17_) {
                _loc18_ = true;
                _loc16_ = _loc6_ / _loc16_;
                _loc17_ = _loc7_ / _loc17_;
            }
            _loc10_ = 0;
            while (_loc10_ < _loc8_.length) {
                if (_loc18_) {
                    _loc8_[_loc10_].method_3965(_loc16_, _loc17_);
                }
                _loc2_.method_1586(_loc8_[_loc10_]);
                _loc10_++;
            }
            _loc9_++;
        }
        if (_loc6_ != 1 || _loc7_ != 1) {
            _loc2_.method_3965(_loc6_, _loc7_);
        }
        this.method_2421();
        method_3342(_loc2_, _loc3_);
        this.var_33[param1].data = _loc2_;
        if (!this._debug) {
        }
    }

    private function method_5181(param1: uint): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = 0;
        var _loc6_: * = null;
        _loc2_ = this.method_416();
        _loc4_ = uint(this.var_107.readUnsignedByte());
        _loc6_ = this.method_4466({
            "101": this.var_3981,
            "102": this.var_3981,
            "103": this.var_3981,
            "110": this.var_3981,
            "111": this.var_3981,
            "301": const_1815,
            "302": const_1815,
            "303": const_1815,
            "701": const_1351,
            "702": const_1351,
            "703": const_1351,
            "704": const_1351
        });
        switch (_loc4_) {
            case 1:
                _loc3_ = new PlaneGeometry(_loc6_.method_473(101, 100), _loc6_.method_473(102, 100), _loc6_.method_473(301, 1), _loc6_.method_473(302, 1), _loc6_.method_473(701, true), _loc6_.method_473(702, false));
                break;
            case 2:
                _loc3_ = new CubeGeometry(_loc6_.method_473(101, 100), _loc6_.method_473(102, 100), _loc6_.method_473(103, 100), _loc6_.method_473(301, 1), _loc6_.method_473(302, 1), _loc6_.method_473(303, 1), _loc6_.method_473(701, true));
                break;
            case 3:
                _loc3_ = new SphereGeometry(_loc6_.method_473(101, 50), _loc6_.method_473(301, 16), _loc6_.method_473(302, 12), _loc6_.method_473(701, true));
                break;
            case 4:
                _loc3_ = new CylinderGeometry(_loc6_.method_473(101, 50), _loc6_.method_473(102, 50), _loc6_.method_473(103, 100), _loc6_.method_473(301, 16), _loc6_.method_473(302, 1), true, true, true);
                if (!_loc6_.method_473(701, true)) {
                    CylinderGeometry(_loc3_).topClosed = false;
                }
                if (!_loc6_.method_473(702, true)) {
                    CylinderGeometry(_loc3_).bottomClosed = false;
                }
                if (!_loc6_.method_473(703, true)) {
                    CylinderGeometry(_loc3_).yUp = false;
                    break;
                }
                break;
            case 5:
                _loc3_ = new ConeGeometry(_loc6_.method_473(101, 50), _loc6_.method_473(102, 100), _loc6_.method_473(301, 16), _loc6_.method_473(302, 1), _loc6_.method_473(701, true), _loc6_.method_473(702, true));
                break;
            case 6:
                _loc3_ = new CapsuleGeometry(_loc6_.method_473(101, 50), _loc6_.method_473(102, 100), _loc6_.method_473(301, 16), _loc6_.method_473(302, 15), _loc6_.method_473(701, true));
                break;
            case 7:
                _loc3_ = new TorusGeometry(_loc6_.method_473(101, 50), _loc6_.method_473(102, 50), _loc6_.method_473(301, 16), _loc6_.method_473(302, 8), _loc6_.method_473(701, true));
                break;
            default:
                _loc3_ = new class_2429();
        }
        if (_loc6_.method_473(110, 1) != 1 || _loc6_.method_473(111, 1) != 1) {
            _loc3_.subGeometries;
            _loc3_.method_3965(_loc6_.method_473(110, 1), _loc6_.method_473(111, 1));
        }
        this.method_2421();
        _loc3_.name = _loc2_;
        method_3342(_loc3_, _loc2_);
        this.var_33[param1].data = _loc3_;
        if (this._debug) {
            if (_loc4_ < 0 || _loc4_ > 7) {
                _loc4_ = 0;
            }
        }
    }

    private function method_319(param1: uint): void {
        var _loc2_: * = null;
        var _loc3_: * = 0;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc9_: * = null;
        _loc3_ = uint(this.var_107.readUnsignedInt());
        _loc4_ = this.method_638();
        _loc2_ = this.method_416();
        var _loc7_: String = "Root (TopLevel)";
        (_loc5_ = new class_1752()).transform = _loc4_;
        var _loc8_: Array;
        if ((_loc8_ = this.method_1083(_loc3_, [class_2131.CONTAINER, class_2131.const_1414, class_2131.const_3013, class_2131.const_2930, class_2131.const_2748]))[0]) {
            class_1752(_loc8_[1]).addChild(_loc5_);
            _loc7_ = class_1752(_loc8_[1]).name;
        } else if (_loc3_ > 0) {
            this.var_33[param1].addError("Could not find a parent for this ObjectContainer3D");
        }
        if (this._version[0] == 2 && this._version[1] == 1) {
            _loc9_ = this.method_4466({
                "1": this.var_599,
                "2": this.var_599,
                "3": this.var_599,
                "4": const_2540
            });
            _loc5_.method_1773 = new Vector3D(_loc9_.method_473(1, 0), _loc9_.method_473(2, 0), _loc9_.method_473(3, 0));
        } else {
            this.method_4466(null);
        }
        _loc5_.extra = this.method_2421();
        method_3342(_loc5_, _loc2_);
        this.var_33[param1].data = _loc5_;
        if (!this._debug) {
        }
    }

    private function method_4290(param1: uint): void {
        var _loc2_: * = 0;
        var _loc3_: Number = 0;
        var _loc10_: * = null;
        var _loc14_: * = null;
        var _loc17_: * = 0;
        var _loc18_: Number = 0;
        var _loc19_: * = null;
        var _loc20_: * = null;
        var _loc21_: int = 0;
        var _loc22_: * = null;
        var _loc23_: * = null;
        var _loc5_: uint = uint(this.var_107.readUnsignedInt());
        var _loc6_: Matrix3D = this.method_638();
        var _loc7_: String = this.method_416();
        var _loc8_: String = "Root (TopLevel)";
        var _loc9_: uint = uint(this.var_107.readUnsignedInt());
        var _loc11_: Array;
        if ((_loc11_ = this.method_1083(_loc9_, [class_2131.GEOMETRY]))[0]) {
            _loc10_ = _loc11_[1] as class_2429;
        } else {
            this.var_33[param1].addError("Could not find a Geometry for this Mesh. A empty Geometry is created!");
            _loc10_ = new class_2429();
        }
        this.var_33[param1].geoID = _loc9_;
        var _loc12_: Vector.<class_1772> = new Vector.<class_1772>();
        _loc2_ = uint(this.var_107.readUnsignedShort());
        var _loc13_: Array = new Array();
        _loc3_ = 0;
        while (_loc3_ < _loc2_) {
            _loc17_ = uint(this.var_107.readUnsignedInt());
            if (!(_loc14_ = this.method_1083(_loc17_, [class_2131.const_808]))[0] && _loc17_ > 0) {
                this.var_33[param1].addError("Could not find Material Nr " + _loc3_ + " (ID = " + _loc17_ + " ) for this Mesh");
            }
            _loc12_.push(_loc14_[1] as class_1772);
            _loc13_.push(class_1772(_loc14_[1]).name);
            _loc3_++;
        }
        var _loc15_: class_2114;
        (_loc15_ = new class_2114(_loc10_, null)).transform = _loc6_;
        var _loc16_: Array;
        if ((_loc16_ = this.method_1083(_loc5_, [class_2131.CONTAINER, class_2131.const_1414, class_2131.const_3013, class_2131.const_2930, class_2131.const_2748]))[0]) {
            class_1752(_loc16_[1]).addChild(_loc15_);
            _loc8_ = class_1752(_loc16_[1]).name;
        } else if (_loc5_ > 0) {
            this.var_33[param1].addError("Could not find a parent for this Mesh");
        }
        if (_loc12_.length >= 1 && _loc15_.method_3381.length == 1) {
            _loc15_.material = _loc12_[0];
        } else if (_loc12_.length > 1) {
            _loc18_ = 0;
            while (_loc18_ < _loc15_.method_3381.length) {
                _loc15_.method_3381[_loc18_].material = _loc12_[Math.min(_loc12_.length - 1, _loc18_)];
                _loc18_++;
            }
        }
        if (this._version[0] == 2 && this._version[1] == 1) {
            _loc19_ = this.method_4466({
                "1": this.var_599,
                "2": this.var_599,
                "3": this.var_599,
                "4": const_2540,
                "5": const_1351,
                "6": this.var_290,
                "7": this.var_290
            });
            _loc15_.method_1773 = new Vector3D(_loc19_.method_473(1, 0), _loc19_.method_473(2, 0), _loc19_.method_473(3, 0));
            _loc15_.method_825 = _loc19_.method_473(5, true);
            if ((_loc20_ = _loc19_.method_473(6, new Array())).length == 0) {
                _loc20_ = _loc19_.method_473(7, new Array());
            }
            if (_loc20_.length > 0) {
                _loc21_ = 0;
                for each(_loc22_ in _loc15_.method_3381) {
                    _loc23_ = new Matrix(_loc20_[_loc21_], _loc20_[_loc21_ + 1], _loc20_[_loc21_ + 2], _loc20_[_loc21_ + 3], _loc20_[_loc21_ + 4], _loc20_[_loc21_ + 5]);
                    if (_loc22_.material is class_1776) {
                        class_1776(_loc22_.material).animateUVs = true;
                    } else if (_loc22_.material is class_2449) {
                        class_2449(_loc22_.material).animateUVs = true;
                    }
                    _loc22_.name_131 = _loc20_[_loc21_ + 4];
                    _loc22_.name_63 = _loc20_[_loc21_ + 5];
                    _loc22_.name_38 = _loc20_[_loc21_];
                    _loc22_.name_72 = _loc20_[_loc21_ + 3];
                    if (_loc21_ < _loc20_.length) {
                        _loc21_ += 6;
                    }
                }
            }
        } else {
            this.method_4466(null);
        }
        _loc15_.extra = this.method_2421();
        method_3342(_loc15_, _loc7_);
        this.var_33[param1].data = _loc15_;
        if (!this._debug) {
        }
    }

    private function method_1987(param1: uint): void {
        var _loc2_: String = this.method_416();
        var _loc3_: uint = uint(this.var_107.readUnsignedInt());
        var _loc4_: Array;
        if (!(_loc4_ = this.method_1083(_loc3_, [class_2131.TEXTURE], "CubeTexture"))[0] && _loc3_ != 0) {
            this.var_33[param1].addError("Could not find the Cubetexture (ID = " + _loc3_ + " ) for this SkyBox");
        }
        var _loc5_: class_2417 = new class_2417(_loc4_[1] as class_2622);
        this.method_4466(null);
        _loc5_.extra = this.method_2421();
        method_3342(_loc5_, _loc2_);
        this.var_33[param1].data = _loc5_;
        if (!this._debug) {
        }
    }

    private function method_2823(param1: uint): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc13_: * = null;
        var _loc4_: uint = uint(this.var_107.readUnsignedInt());
        var _loc5_: Matrix3D = this.method_638();
        var _loc6_: String = this.method_416();
        var _loc7_: uint = uint(this.var_107.readUnsignedByte());
        var _loc8_: AWDProperties;
        var _loc9_: uint = uint((_loc8_ = this.method_4466({
            "1": this.var_290,
            "2": this.var_290,
            "3": COLOR,
            "4": this.var_290,
            "5": this.var_290,
            "6": const_1351,
            "7": COLOR,
            "8": this.var_290,
            "9": const_2540,
            "10": const_2540,
            "11": this.var_290,
            "12": const_1815,
            "21": this.var_599,
            "22": this.var_599,
            "23": this.var_599
        })).method_473(9, 0));
        var _loc10_: String = "Root (TopLevel)";
        if (_loc7_ == 1) {
            _loc2_ = new PointLight();
            PointLight(_loc2_).radius = _loc8_.method_473(1, 90000);
            PointLight(_loc2_).fallOff = _loc8_.method_473(2, 100000);
            if (_loc9_ > 0) {
                if (_loc9_ == 4) {
                    _loc3_ = new CubeMapShadowMapper();
                }
            }
            _loc2_.transform = _loc5_;
        }
        if (_loc7_ == 2) {
            _loc2_ = new DirectionalLight(_loc8_.method_473(21, 0), _loc8_.method_473(22, -1), _loc8_.method_473(23, 1));
            if (_loc9_ > 0) {
                if (_loc9_ == 1) {
                    _loc3_ = new DirectionalShadowMapper();
                }
                if (_loc9_ == 2) {
                    _loc3_ = new NearDirectionalShadowMapper(_loc8_.method_473(11, 0.5));
                }
                if (_loc9_ == 3) {
                    _loc3_ = new CascadeShadowMapper(_loc8_.method_473(12, 3));
                }
            }
        }
        if (_loc7_ != 2 && _loc7_ != 1) {
            this.var_33[param1].addError("Unsuported lighttype = " + _loc7_);
            return;
        }
        _loc2_.color = _loc8_.method_473(3, 16777215);
        _loc2_.specular = _loc8_.method_473(4, 1);
        _loc2_.diffuse = _loc8_.method_473(5, 1);
        _loc2_.ambientColor = _loc8_.method_473(7, 16777215);
        _loc2_.ambient = _loc8_.method_473(8, 0);
        if (_loc3_) {
            if (_loc3_ is CubeMapShadowMapper) {
                if (_loc8_.method_473(10, 1) != 1) {
                    _loc3_.depthMapSize = this.var_263[_loc8_.method_473(10, 1)];
                }
            } else if (_loc8_.method_473(10, 2) != 2) {
                _loc3_.depthMapSize = this.var_263[_loc8_.method_473(10, 2)];
            }
            _loc2_.method_493 = _loc3_;
            _loc2_.method_825 = true;
        }
        if (_loc4_ != 0) {
            if ((_loc13_ = this.method_1083(_loc4_, [class_2131.CONTAINER, class_2131.const_1414, class_2131.const_3013, class_2131.const_2930, class_2131.const_2748]))[0]) {
                class_1752(_loc13_[1]).addChild(_loc2_);
                _loc10_ = class_1752(_loc13_[1]).name;
            } else {
                this.var_33[param1].addError("Could not find a parent for this Light");
            }
        }
        this.method_2421();
        method_3342(_loc2_, _loc6_);
        this.var_33[param1].data = _loc2_;
        if (!this._debug) {
        }
    }

    private function method_2976(param1: uint): void {
        var _loc6_: * = null;
        var _loc2_: uint = uint(this.var_107.readUnsignedInt());
        var _loc3_: Matrix3D = this.method_638();
        var _loc4_: String = this.method_416();
        var _loc5_: String = "Root (TopLevel)";
        this.var_107.readUnsignedByte();
        this.var_107.readShort();
        var _loc7_: uint = uint(this.var_107.readShort());
        var _loc8_: AWDProperties = this.method_4466({
            "101": this.var_290,
            "102": this.var_290,
            "103": this.var_290,
            "104": this.var_290
        });
        switch (_loc7_) {
            case 5001:
                _loc6_ = new class_1758(_loc8_.method_473(101, 60));
                break;
            case 5002:
                _loc6_ = new class_2615(_loc8_.method_473(101, 500));
                break;
            case 5003:
                _loc6_ = new class_2643(_loc8_.method_473(101, -400), _loc8_.method_473(102, 400), _loc8_.method_473(103, -300), _loc8_.method_473(104, 300));
                break;
            default:
                return;
        }
        var _loc9_: class_1767;
        (_loc9_ = new class_1767(_loc6_)).transform = _loc3_;
        var _loc10_: Array;
        if ((_loc10_ = this.method_1083(_loc2_, [class_2131.CONTAINER, class_2131.const_1414, class_2131.const_3013, class_2131.const_2930, class_2131.const_2748]))[0]) {
            class_1752(_loc10_[1]).addChild(_loc9_);
            _loc5_ = class_1752(_loc10_[1]).name;
        } else if (_loc2_ > 0) {
            this.var_33[param1].addError("Could not find a parent for this Camera");
        }
        _loc9_.name = _loc4_;
        _loc8_ = this.method_4466({
            "1": this.var_599,
            "2": this.var_599,
            "3": this.var_599,
            "4": const_2540,
            "101": this.var_290,
            "102": this.var_290
        });
        _loc9_.method_1773 = new Vector3D(_loc8_.method_473(1, 0), _loc8_.method_473(2, 0), _loc8_.method_473(3, 0));
        _loc9_.lens.method_5049 = _loc8_.method_473(101, 20);
        _loc9_.lens.method_1840 = _loc8_.method_473(102, 3000);
        _loc9_.extra = this.method_2421();
        method_3342(_loc9_, _loc4_);
        this.var_33[param1].data = _loc9_;
        if (!this._debug) {
        }
    }

    private function method_3926(param1: uint): void {
        var _loc2_: uint = uint(this.var_107.readUnsignedInt());
        var _loc3_: Matrix3D = this.method_638();
        var _loc4_: String = this.method_416();
        var _loc6_: uint = uint(this.var_107.readUnsignedInt());
        var _loc7_: Array;
        if (!(_loc7_ = this.method_1083(_loc6_, [class_2131.TEXTURE]))[0] && _loc6_ != 0) {
            this.var_33[param1].addError("Could not find the Texture (ID = " + _loc6_ + " ( for this TextureProjector!");
        }
        var _loc8_: class_2418;
        (_loc8_ = new class_2418(_loc7_[1])).name = _loc4_;
        _loc8_.aspectRatio = this.var_107.readFloat();
        _loc8_.fieldOfView = this.var_107.readFloat();
        _loc8_.transform = _loc3_;
        var _loc9_: AWDProperties = this.method_4466({
            "1": this.var_599,
            "2": this.var_599,
            "3": this.var_599,
            "4": const_2540
        });
        _loc8_.method_1773 = new Vector3D(_loc9_.method_473(1, 0), _loc9_.method_473(2, 0), _loc9_.method_473(3, 0));
        _loc8_.extra = this.method_2421();
        method_3342(_loc8_, _loc4_);
        this.var_33[param1].data = _loc8_;
        if (!this._debug) {
        }
    }

    private function method_2270(param1: uint): void {
        var _loc7_: * = null;
        var _loc2_: String = this.method_416();
        var _loc3_: uint = uint(this.var_107.readUnsignedShort());
        var _loc4_: Array = new Array();
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc8_: Array = new Array();
        _loc5_ = 0;
        while (_loc5_ < _loc3_) {
            _loc6_ = int(this.var_107.readUnsignedInt());
            if ((_loc7_ = this.method_1083(_loc6_, [class_2131.const_1414]))[0]) {
                _loc4_.push(_loc7_[1] as class_2102);
                _loc8_.push(class_2102(_loc7_[1]).name);
            } else {
                this.var_33[param1].addError("Could not find a Light Nr " + _loc5_ + " (ID = " + _loc6_ + " ) for this LightPicker");
            }
            _loc5_++;
        }
        if (_loc4_.length == 0) {
            this.var_33[param1].addError("Could not create this LightPicker, cause no Light was found.");
            this.method_2421();
            return;
        }
        var _loc9_: class_2100;
        (_loc9_ = new class_2101(_loc4_)).name = _loc2_;
        this.method_2421();
        method_3342(_loc9_, _loc2_);
        this.var_33[param1].data = _loc9_;
        if (!this._debug) {
        }
    }

    private function method_4352(param1: uint): void {
        var _loc2_: * = null;
        var _loc3_: * = 0;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc8_: * = 0;
        var _loc9_: * = 0;
        var _loc10_: * = null;
        var _loc12_: * = 0;
        var _loc13_: * = 0;
        var _loc14_: * = 0;
        _loc2_ = this.method_416();
        _loc3_ = uint(this.var_107.readUnsignedByte());
        _loc8_ = uint(this.var_107.readUnsignedByte());
        _loc4_ = this.method_4466({
            "1": const_535,
            "2": const_114,
            "10": this.var_290,
            "11": const_1351,
            "12": this.var_290,
            "13": const_1351
        });
        _loc9_ = 0;
        while (_loc9_ < _loc8_) {
            _loc12_ = uint(this.var_107.readUnsignedShort());
            this.method_4466(null);
            this.method_2421();
            _loc9_ += 1;
        }
        var _loc11_: String = "";
        _loc6_ = this.method_2421();
        if (_loc3_ == 1) {
            _loc11_ += "Parsed a ColorMaterial(SinglePass): Name = \'" + _loc2_ + "\' | ";
            _loc13_ = uint(_loc4_.method_473(1, 13421772));
            if (method_810 < 2) {
                _loc5_ = new class_2448(_loc13_, _loc4_.method_473(10, 1));
            } else {
                _loc5_ = new class_2446(_loc13_);
            }
        } else if (_loc3_ == 2) {
            _loc14_ = uint(_loc4_.method_473(2, 0));
            if (!(_loc10_ = this.method_1083(_loc14_, [class_2131.TEXTURE]))[0] && _loc14_ > 0) {
                this.var_33[param1].addError("Could not find the DiffsueTexture (ID = " + _loc14_ + " ) for this Material");
            }
            if (method_810 < 2) {
                _loc5_ = new class_1776(_loc10_[1]);
                class_1776(_loc5_).alphaBlending = _loc4_.method_473(11, false);
                class_1776(_loc5_).alpha = _loc4_.method_473(10, 1);
                _loc11_ += "Parsed a TextureMaterial(SinglePass): Name = \'" + _loc2_ + "\' | Texture-Name = " + _loc5_.name;
            } else {
                _loc5_ = new class_2449(_loc10_[1]);
                _loc11_ += "Parsed a TextureMaterial(MultipAss): Name = \'" + _loc2_ + "\' | Texture-Name = " + _loc5_.name;
            }
        }
        _loc5_.extra = _loc6_;
        if (method_810 < 2) {
            class_1775(_loc5_).alphaThreshold = _loc4_.method_473(12, 0);
        } else {
            class_2445(_loc5_).alphaThreshold = _loc4_.method_473(12, 0);
        }
        _loc5_.repeat = _loc4_.method_473(13, false);
        method_3342(_loc5_, _loc2_);
        this.var_33[param1].data = _loc5_;
        if (!this._debug) {
        }
    }

    private function method_4269(param1: uint): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc12_: * = 0;
        var _loc13_: * = 0;
        var _loc14_: * = 0;
        var _loc15_: * = 0;
        var _loc16_: * = 0;
        var _loc17_: * = 0;
        var _loc18_: * = 0;
        var _loc19_: * = null;
        var _loc20_: * = null;
        var _loc21_: * = 0;
        var _loc22_: * = 0;
        var _loc6_: String = this.method_416();
        var _loc7_: uint = uint(this.var_107.readUnsignedByte());
        var _loc8_: uint = uint(this.var_107.readUnsignedByte());
        var _loc9_: AWDProperties;
        var _loc10_: * = uint((_loc9_ = this.method_4466({
            "1": const_1768,
            "2": const_114,
            "3": const_114,
            "4": const_2540,
            "5": const_1351,
            "6": const_1351,
            "7": const_1351,
            "8": const_1351,
            "9": const_2540,
            "10": this.var_290,
            "11": const_1351,
            "12": this.var_290,
            "13": const_1351,
            "15": this.var_290,
            "16": const_1768,
            "17": const_114,
            "18": this.var_290,
            "19": this.var_290,
            "20": const_1768,
            "21": const_114,
            "22": const_114
        })).method_473(4, 0));
        var _loc11_: * = "";
        if (_loc10_ >= 2) {
            this.var_33[param1].addError("Material-spezialType \'" + _loc10_ + "\' is not supported, can only be 0:singlePass, 1:MultiPass !");
            return;
        }
        if (method_810 == 1) {
            _loc10_ = 0;
        } else if (method_810 == 2) {
            _loc10_ = 1;
        }
        if (_loc10_ < 2) {
            if (_loc7_ == 1) {
                _loc17_ = _loc17_ = uint(_loc9_.method_473(1, 13421772));
                if (_loc10_ == 1) {
                    _loc2_ = new class_2446(_loc17_);
                    _loc11_ += "Parsed a ColorMaterial(MultiPass): Name = \'" + _loc6_ + "\' | ";
                } else {
                    _loc2_ = new class_2448(_loc17_, _loc9_.method_473(10, 1));
                    class_2448(_loc2_).alphaBlending = _loc9_.method_473(11, false);
                    _loc11_ += "Parsed a ColorMaterial(SinglePass): Name = \'" + _loc6_ + "\' | ";
                }
            } else if (_loc7_ == 2) {
                _loc18_ = uint(_loc9_.method_473(2, 0));
                if (!(_loc5_ = this.method_1083(_loc18_, [class_2131.TEXTURE]))[0] && _loc18_ > 0) {
                    this.var_33[param1].addError("Could not find the DiffsueTexture (ID = " + _loc18_ + " ) for this TextureMaterial");
                }
                _loc19_ = _loc5_[1];
                _loc21_ = uint(_loc9_.method_473(17, 0));
                if (!(_loc5_ = this.method_1083(_loc21_, [class_2131.TEXTURE]))[0] && _loc21_ != 0) {
                    this.var_33[param1].addError("Could not find the AmbientTexture (ID = " + _loc21_ + " ) for this TextureMaterial");
                }
                if (_loc5_[0]) {
                    _loc20_ = _loc5_[1];
                }
                if (_loc10_ == 1) {
                    _loc2_ = new class_2449(_loc19_);
                    _loc11_ += "Parsed a TextureMaterial(MultiPass): Name = \'" + _loc6_ + "\' | Texture-Name = " + _loc19_.name;
                    if (_loc20_) {
                        class_2449(_loc2_).ambientTexture = _loc20_;
                        _loc11_ += " | AmbientTexture-Name = " + _loc20_.name;
                    }
                } else {
                    _loc2_ = new class_1776(_loc19_);
                    _loc11_ += "Parsed a TextureMaterial(SinglePass): Name = \'" + _loc6_ + "\' | Texture-Name = " + _loc19_.name;
                    if (_loc20_) {
                        class_1776(_loc2_).ambientTexture = _loc20_;
                        _loc11_ += " | AmbientTexture-Name = " + _loc20_.name;
                    }
                    class_1776(_loc2_).alpha = _loc9_.method_473(10, 1);
                    class_1776(_loc2_).alphaBlending = _loc9_.method_473(11, false);
                }
            }
            _loc12_ = uint(_loc9_.method_473(3, 0));
            if (!(_loc5_ = this.method_1083(_loc12_, [class_2131.TEXTURE]))[0] && _loc12_ != 0) {
                this.var_33[param1].addError("Could not find the NormalTexture (ID = " + _loc12_ + " ) for this TextureMaterial");
            }
            if (_loc5_[0]) {
                _loc3_ = _loc5_[1];
                _loc11_ += " | NormalTexture-Name = " + _loc3_.name;
            }
            _loc13_ = uint(_loc9_.method_473(21, 0));
            if (!(_loc5_ = this.method_1083(_loc13_, [class_2131.TEXTURE]))[0] && _loc13_ != 0) {
                this.var_33[param1].addError("Could not find the SpecularTexture (ID = " + _loc13_ + " ) for this TextureMaterial");
            }
            if (_loc5_[0]) {
                _loc4_ = _loc5_[1];
                _loc11_ += " | SpecularTexture-Name = " + _loc4_.name;
            }
            _loc14_ = uint(_loc9_.method_473(22, 0));
            if (!(_loc5_ = this.method_1083(_loc14_, [class_2131.const_133]))[0] && Boolean(_loc14_)) {
                this.var_33[param1].addError("Could not find the LightPicker (ID = " + _loc14_ + " ) for this TextureMaterial");
            } else {
                class_1772(_loc2_).lightPicker = _loc5_[1] as class_2100;
            }
            class_1772(_loc2_).smooth = _loc9_.method_473(5, true);
            class_1772(_loc2_).mipmap = _loc9_.method_473(6, true);
            class_1772(_loc2_).bothSides = _loc9_.method_473(7, false);
            class_1772(_loc2_).alphaPremultiplied = _loc9_.method_473(8, false);
            class_1772(_loc2_).blendMode = this.var_240[_loc9_.method_473(9, 0)];
            class_1772(_loc2_).repeat = _loc9_.method_473(13, false);
            if (_loc10_ == 0) {
                if (_loc3_) {
                    class_1775(_loc2_).normalMap = _loc3_;
                }
                if (_loc4_) {
                    class_1775(_loc2_).specularMap = _loc4_;
                }
                class_1775(_loc2_).alphaThreshold = _loc9_.method_473(12, 0);
                class_1775(_loc2_).ambient = _loc9_.method_473(15, 1);
                class_1775(_loc2_).ambientColor = _loc9_.method_473(16, 16777215);
                class_1775(_loc2_).specular = _loc9_.method_473(18, 1);
                class_1775(_loc2_).gloss = _loc9_.method_473(19, 50);
                class_1775(_loc2_).specularColor = _loc9_.method_473(20, 16777215);
            } else {
                if (_loc3_) {
                    class_2445(_loc2_).normalMap = _loc3_;
                }
                if (_loc4_) {
                    class_2445(_loc2_).specularMap = _loc4_;
                }
                class_2445(_loc2_).alphaThreshold = _loc9_.method_473(12, 0);
                class_2445(_loc2_).ambient = _loc9_.method_473(15, 1);
                class_2445(_loc2_).ambientColor = _loc9_.method_473(16, 16777215);
                class_2445(_loc2_).specular = _loc9_.method_473(18, 1);
                class_2445(_loc2_).gloss = _loc9_.method_473(19, 50);
                class_2445(_loc2_).specularColor = _loc9_.method_473(20, 16777215);
            }
            _loc15_ = 0;
            while (_loc15_ < _loc8_) {
                _loc22_ = uint(this.var_107.readUnsignedShort());
                _loc9_ = this.method_4466({
                    "1": const_114,
                    "2": const_114,
                    "3": const_114,
                    "101": this.var_290,
                    "102": this.var_290,
                    "103": this.var_290,
                    "201": const_1768,
                    "202": const_1768,
                    "301": const_1815,
                    "302": const_1815,
                    "401": const_2540,
                    "402": const_2540,
                    "601": COLOR,
                    "602": COLOR,
                    "701": const_1351,
                    "702": const_1351,
                    "801": const_3108
                });
                switch (_loc22_) {
                    case 999:
                        _loc16_ = uint(_loc9_.method_473(1, 0));
                        if (!(_loc5_ = this.method_1083(_loc16_, [class_2131.const_1565]))[0]) {
                            this.var_33[param1].addError("Could not find the EffectMethod (ID = " + _loc16_ + " ) for this Material");
                        } else {
                            if (_loc10_ == 0) {
                                class_1775(_loc2_).addMethod(_loc5_[1]);
                            }
                            if (_loc10_ == 1) {
                                class_2445(_loc2_).addMethod(_loc5_[1]);
                            }
                            _loc11_ += " | EffectMethod-Name = " + class_1780(_loc5_[1]).name;
                        }
                        break;
                    case 998:
                        _loc16_ = uint(_loc9_.method_473(1, 0));
                        if (!(_loc5_ = this.method_1083(_loc16_, [class_2131.const_3103]))[0]) {
                            this.var_33[param1].addError("Could not find the ShadowMethod (ID = " + _loc16_ + " ) for this Material");
                        } else {
                            if (_loc10_ == 0) {
                                class_1775(_loc2_).shadowMethod = _loc5_[1];
                            }
                            if (_loc10_ == 1) {
                                class_2445(_loc2_).shadowMethod = _loc5_[1];
                            }
                            _loc11_ += " | ShadowMethod-Name = " + class_2245(_loc5_[1]).name;
                        }
                        break;
                    case 1:
                        _loc16_ = uint(_loc9_.method_473(1, 0));
                        if (!(_loc5_ = this.method_1083(_loc16_, [class_2131.TEXTURE], "CubeTexture"))[0]) {
                            this.var_33[param1].addError("Could not find the EnvMap (ID = " + _loc16_ + " ) for this EnvMapAmbientMethodMaterial");
                        }
                        if (_loc10_ == 0) {
                            class_1775(_loc2_).ambientMethod = new class_2632(_loc5_[1]);
                        }
                        if (_loc10_ == 1) {
                            class_2445(_loc2_).ambientMethod = new class_2632(_loc5_[1]);
                        }
                        _loc11_ += " | EnvMapAmbientMethod | EnvMap-Name =" + class_2570(_loc5_[1]).name;
                        break;
                    case 51:
                        if (_loc10_ == 0) {
                            class_1775(_loc2_).diffuseMethod = new class_2606();
                        }
                        if (_loc10_ == 1) {
                            class_2445(_loc2_).diffuseMethod = new class_2606();
                        }
                        _loc11_ += " | DepthDiffuseMethod";
                        break;
                    case 52:
                        _loc16_ = uint(_loc9_.method_473(1, 0));
                        if (!(_loc5_ = this.method_1083(_loc16_, [class_2131.TEXTURE]))[0]) {
                            this.var_33[param1].addError("Could not find the GradientDiffuseTexture (ID = " + _loc16_ + " ) for this GradientDiffuseMethod");
                        }
                        if (_loc10_ == 0) {
                            class_1775(_loc2_).diffuseMethod = new class_2631(_loc5_[1]);
                        }
                        if (_loc10_ == 1) {
                            class_2445(_loc2_).diffuseMethod = new class_2631(_loc5_[1]);
                        }
                        _loc11_ += " | GradientDiffuseMethod | GradientDiffuseTexture-Name =" + class_2116(_loc5_[1]).name;
                        break;
                    case 53:
                        if (_loc10_ == 0) {
                            class_1775(_loc2_).diffuseMethod = new class_2611(_loc9_.method_473(101, 5));
                        }
                        if (_loc10_ == 1) {
                            class_2445(_loc2_).diffuseMethod = new class_2611(_loc9_.method_473(101, 5));
                        }
                        _loc11_ += " | WrapDiffuseMethod";
                        break;
                    case 54:
                        _loc16_ = uint(_loc9_.method_473(1, 0));
                        if (!(_loc5_ = this.method_1083(_loc16_, [class_2131.TEXTURE]))[0]) {
                            this.var_33[param1].addError("Could not find the LightMap (ID = " + _loc16_ + " ) for this LightMapDiffuseMethod");
                        }
                        if (_loc10_ == 0) {
                            class_1775(_loc2_).diffuseMethod = new class_2613(_loc5_[1], this.var_240[_loc9_.method_473(401, 10)], false, class_1775(_loc2_).diffuseMethod);
                        }
                        if (_loc10_ == 1) {
                            class_2445(_loc2_).diffuseMethod = new class_2613(_loc5_[1], this.var_240[_loc9_.method_473(401, 10)], false, class_2445(_loc2_).diffuseMethod);
                        }
                        _loc11_ += " | LightMapDiffuseMethod | LightMapTexture-Name =" + class_2116(_loc5_[1]).name;
                        break;
                    case 55:
                        if (_loc10_ == 0) {
                            class_1775(_loc2_).diffuseMethod = new class_2626(_loc9_.method_473(401, 3), class_1775(_loc2_).diffuseMethod);
                            class_2626(class_1775(_loc2_).diffuseMethod).smoothness = _loc9_.method_473(101, 0.1);
                        }
                        if (_loc10_ == 1) {
                            class_2445(_loc2_).diffuseMethod = new class_2626(_loc9_.method_473(401, 3), class_2445(_loc2_).diffuseMethod);
                            class_2626(class_2445(_loc2_).diffuseMethod).smoothness = _loc9_.method_473(101, 0.1);
                        }
                        _loc11_ += " | CelDiffuseMethod";
                        break;
                    case 56:
                        if (_loc10_ == 0) {
                            class_1775(_loc2_).diffuseMethod = new class_2623();
                            class_2623(class_1775(_loc2_).diffuseMethod).scattering = _loc9_.method_473(101, 0.2);
                            class_2623(class_1775(_loc2_).diffuseMethod).translucency = _loc9_.method_473(102, 1);
                            class_2623(class_1775(_loc2_).diffuseMethod).scatterColor = _loc9_.method_473(601, 16777215);
                        }
                        if (_loc10_ == 1) {
                            class_2445(_loc2_).diffuseMethod = new class_2623();
                            class_2623(class_2445(_loc2_).diffuseMethod).scattering = _loc9_.method_473(101, 0.2);
                            class_2623(class_2445(_loc2_).diffuseMethod).translucency = _loc9_.method_473(102, 1);
                            class_2623(class_2445(_loc2_).diffuseMethod).scatterColor = _loc9_.method_473(601, 16777215);
                        }
                        _loc11_ += " | SubSurfaceScatteringMethod";
                        break;
                    case 101:
                        if (_loc10_ == 0) {
                            class_1775(_loc2_).specularMethod = new class_2630();
                        }
                        if (_loc10_ == 1) {
                            class_2445(_loc2_).specularMethod = new class_2630();
                        }
                        _loc11_ += " | AnisotropicSpecularMethod";
                        break;
                    case 102:
                        if (_loc10_ == 0) {
                            class_1775(_loc2_).specularMethod = new class_2629();
                        }
                        if (_loc10_ == 1) {
                            class_2445(_loc2_).specularMethod = new class_2629();
                        }
                        _loc11_ += " | PhongSpecularMethod";
                        break;
                    case 103:
                        if (_loc10_ == 0) {
                            class_1775(_loc2_).specularMethod = new class_2635(_loc9_.method_473(101, 0.5), class_1775(_loc2_).specularMethod);
                            class_2635(class_1775(_loc2_).specularMethod).smoothness = _loc9_.method_473(102, 0.1);
                        }
                        if (_loc10_ == 1) {
                            class_2445(_loc2_).specularMethod = new class_2635(_loc9_.method_473(101, 0.5), class_2445(_loc2_).specularMethod);
                            class_2635(class_2445(_loc2_).specularMethod).smoothness = _loc9_.method_473(102, 0.1);
                        }
                        _loc11_ += " | CellSpecularMethod";
                        break;
                    case 104:
                        if (_loc10_ == 0) {
                            class_1775(_loc2_).specularMethod = new class_2638(_loc9_.method_473(701, true), class_1775(_loc2_).specularMethod);
                            class_2638(class_1775(_loc2_).specularMethod).fresnelPower = _loc9_.method_473(101, 5);
                            class_2638(class_1775(_loc2_).specularMethod).normalReflectance = _loc9_.method_473(102, 0.1);
                        }
                        if (_loc10_ == 1) {
                            class_2445(_loc2_).specularMethod = new class_2638(_loc9_.method_473(701, true), class_2445(_loc2_).specularMethod);
                            class_2638(class_2445(_loc2_).specularMethod).fresnelPower = _loc9_.method_473(101, 5);
                            class_2638(class_2445(_loc2_).specularMethod).normalReflectance = _loc9_.method_473(102, 0.1);
                        }
                        _loc11_ += " | FresnelSpecularMethod";
                        break;
                    case 152:
                        _loc16_ = uint(_loc9_.method_473(1, 0));
                        if (!(_loc5_ = this.method_1083(_loc16_, [class_2131.TEXTURE]))[0]) {
                            this.var_33[param1].addError("Could not find the SecoundNormalMap (ID = " + _loc16_ + " ) for this SimpleWaterNormalMethod");
                        }
                        if (_loc10_ == 0) {
                            if (!class_1775(_loc2_).normalMap) {
                                this.var_33[param1].addError("Could not find a normal Map on this Material to use with this SimpleWaterNormalMethod");
                                class_1775(_loc2_).normalMap = _loc5_[1];
                            }
                            class_1775(_loc2_).normalMethod = new class_2619(class_1775(_loc2_).normalMap, _loc5_[1]);
                        }
                        if (_loc10_ == 1) {
                            if (!class_2445(_loc2_).normalMap) {
                                this.var_33[param1].addError("Could not find a normal Map on this Material to use with this SimpleWaterNormalMethod");
                                class_2445(_loc2_).normalMap = _loc5_[1];
                            }
                            class_2445(_loc2_).normalMethod = new class_2619(class_2445(_loc2_).normalMap, _loc5_[1]);
                        }
                        _loc11_ += " | SimpleWaterNormalMethod | Second-NormalTexture-Name = " + class_2116(_loc5_[1]).name;
                        break;
                }
                this.method_2421();
                _loc15_ += 1;
            }
        }
        class_1772(_loc2_).extra = this.method_2421();
        method_3342(_loc2_, _loc6_);
        this.var_33[param1].data = _loc2_;
        if (!this._debug) {
        }
    }

    private function method_1239(param1: uint): void {
        var _loc4_: * = 0;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        this.var_33[param1].name = this.method_416();
        var _loc3_: uint = uint(this.var_107.readUnsignedByte());
        this.var_2113[this.var_1005.toString()] = [];
        if (_loc3_ == 0) {
            _loc4_ = uint(this.var_107.readUnsignedInt());
            _loc5_ = this.var_107.readUTFBytes(_loc4_);
            method_597(this.var_1005.toString(), new URLRequest(_loc5_), false, null, true);
        } else {
            _loc4_ = uint(this.var_107.readUnsignedInt());
            _loc6_ = new ByteArray();
            this.var_107.readBytes(_loc6_, 0, _loc4_);
            method_597(this.var_1005.toString(), null, false, _loc6_, true);
        }
        this.method_4466(null);
        this.var_33[param1].extras = this.method_2421();
        method_1516();
        this.var_33[param1].data = null;
        if (this._debug) {
            _loc7_ = ["external", "embed"];
        }
    }

    private function method_3533(param1: uint): void {
        var _loc2_: * = 0;
        var _loc4_: int = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        this.var_1477 = new Array();
        this.var_2113[this.var_1005.toString()] = [];
        var _loc5_: uint = uint(this.var_107.readUnsignedByte());
        this.var_33[param1].name = this.method_416();
        _loc4_ = 0;
        while (_loc4_ < 6) {
            this.var_2113[this.var_1005.toString()] = [];
            this.var_1477.push(null);
            if (_loc5_ == 0) {
                _loc2_ = uint(this.var_107.readUnsignedInt());
                _loc6_ = this.var_107.readUTFBytes(_loc2_);
                method_597(this.var_1005.toString() + "#" + _loc4_, new URLRequest(_loc6_), false, null, true);
            } else {
                _loc2_ = uint(this.var_107.readUnsignedInt());
                _loc7_ = new ByteArray();
                this.var_107.readBytes(_loc7_, 0, _loc2_);
                method_597(this.var_1005.toString() + "#" + _loc4_, null, false, _loc7_, true);
            }
            _loc4_++;
        }
        this.method_4466(null);
        this.var_33[param1].extras = this.method_2421();
        method_1516();
        this.var_33[param1].data = null;
        if (this._debug) {
            _loc8_ = ["external", "embed"];
        }
    }

    private function method_408(param1: uint): void {
        var _loc2_: * = null;
        this.var_33[param1].name = this.method_416();
        _loc2_ = this.method_3974(param1);
        this.method_2421();
        this.var_33[param1].data = _loc2_;
        method_3342(_loc2_, this.var_33[param1].name);
        this.var_33[param1].data = _loc2_;
        if (!this._debug) {
        }
    }

    private function method_3974(param1: uint): class_1780 {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = 0;
        var _loc6_: * = null;
        var _loc7_: * = 0;
        var _loc8_: * = null;
        var _loc2_: uint = uint(this.var_107.readUnsignedShort());
        _loc4_ = this.method_4466({
            "1": const_114,
            "2": const_114,
            "3": const_114,
            "101": this.var_290,
            "102": this.var_290,
            "103": this.var_290,
            "104": this.var_290,
            "105": this.var_290,
            "106": this.var_290,
            "107": this.var_290,
            "201": const_1768,
            "202": const_1768,
            "301": const_1815,
            "302": const_1815,
            "401": const_2540,
            "402": const_2540,
            "601": COLOR,
            "602": COLOR,
            "701": const_1351,
            "702": const_1351
        });
        switch (_loc2_) {
            case 401:
                _loc3_ = new class_2637(_loc4_.method_473(101, new Array(0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)));
                break;
            case 402:
                _loc3_ = new class_2499();
                _loc7_ = uint(_loc4_.method_473(601, 0));
                _loc8_ = new ColorTransform(_loc4_.method_473(102, 1), _loc4_.method_473(103, 1), _loc4_.method_473(104, 1), _loc4_.method_473(101, 1), _loc7_ >> 16 & 255, _loc7_ >> 8 & 255, _loc7_ & 255, _loc7_ >> 24 & 255);
                class_2499(_loc3_).colorTransform = _loc8_;
                break;
            case 403:
                _loc5_ = uint(_loc4_.method_473(1, 0));
                if (!(_loc6_ = this.method_1083(_loc5_, [class_2131.TEXTURE], "CubeTexture"))[0]) {
                    this.var_33[param1].addError("Could not find the EnvMap (ID = " + _loc5_ + " ) for this EnvMapMethod");
                }
                _loc3_ = new class_2604(_loc6_[1], _loc4_.method_473(101, 1));
                if ((_loc5_ = uint(_loc4_.method_473(2, 0))) > 0) {
                    if (!(_loc6_ = this.method_1083(_loc5_, [class_2131.TEXTURE]))[0]) {
                        this.var_33[param1].addError("Could not find the Mask-texture (ID = " + _loc5_ + " ) for this EnvMapMethod");
                    }
                    class_2604(_loc3_).mask = _loc6_[1];
                    break;
                }
                break;
            case 404:
                _loc5_ = uint(_loc4_.method_473(1, 0));
                if (!(_loc6_ = this.method_1083(_loc5_, [class_2131.TEXTURE]))[0]) {
                    this.var_33[param1].addError("Could not find the LightMap (ID = " + _loc5_ + " ) for this LightMapMethod");
                }
                _loc3_ = new class_2641(_loc6_[1], this.var_240[_loc4_.method_473(401, 10)], _loc4_.method_473(701, false));
                break;
            case 405:
                _loc5_ = uint(_loc4_.method_473(1, 0));
                if (!(_loc6_ = this.method_1083(_loc5_, [class_2131.const_2510]))[0]) {
                    this.var_33[param1].addError("Could not find the TextureProjector (ID = " + _loc5_ + " ) for this ProjectiveTextureMethod");
                }
                _loc3_ = new class_2605(_loc6_[1], this.var_240[_loc4_.method_473(401, 10)]);
                break;
            case 406:
                _loc3_ = new class_2249(_loc4_.method_473(601, 16777215), _loc4_.method_473(101, 0.4), _loc4_.method_473(102, 2));
                break;
            case 407:
                _loc5_ = uint(_loc4_.method_473(1, 0));
                if (!(_loc6_ = this.method_1083(_loc5_, [class_2131.TEXTURE]))[0]) {
                    this.var_33[param1].addError("Could not find the Alpha-texture (ID = " + _loc5_ + " ) for this AlphaMaskMethod");
                }
                _loc3_ = new class_2247(_loc6_[1], _loc4_.method_473(701, false));
                break;
            case 408:
                _loc5_ = uint(_loc4_.method_473(1, 0));
                if (!(_loc6_ = this.method_1083(_loc5_, [class_2131.TEXTURE], "CubeTexture"))[0]) {
                    this.var_33[param1].addError("Could not find the EnvMap (ID = " + _loc5_ + " ) for this RefractionEnvMapMethod");
                }
                _loc3_ = new class_2618(_loc6_[1], _loc4_.method_473(101, 0.1), _loc4_.method_473(102, 0.01), _loc4_.method_473(103, 0.01), _loc4_.method_473(104, 0.01));
                class_2618(_loc3_).alpha = _loc4_.method_473(105, 1);
                break;
            case 409:
                _loc3_ = new class_2484(_loc4_.method_473(601, 0), _loc4_.method_473(101, 1), _loc4_.method_473(701, true), _loc4_.method_473(702, false));
                break;
            case 410:
                _loc5_ = uint(_loc4_.method_473(1, 0));
                if (!(_loc6_ = this.method_1083(_loc5_, [class_2131.TEXTURE], "CubeTexture"))[0]) {
                    this.var_33[param1].addError("Could not find the EnvMap (ID = " + _loc5_ + " ) for this FresnelEnvMapMethod");
                }
                _loc3_ = new class_2640(_loc6_[1], _loc4_.method_473(101, 1));
                break;
            case 411:
                _loc3_ = new class_2607(_loc4_.method_473(101, 0), _loc4_.method_473(102, 1000), _loc4_.method_473(601, 8421504));
        }
        this.method_2421();
        return _loc3_;
    }

    private function method_730(param1: uint): void {
        var _loc4_: * = null;
        var _loc5_: * = 0;
        this.var_33[param1].name = this.method_416();
        _loc5_ = uint(this.var_107.readUnsignedInt());
        var _loc6_: Array;
        if (!(_loc6_ = this.method_1083(_loc5_, [class_2131.const_1414]))[0]) {
            this.var_33[param1].addError("Could not find the TargetLight (ID = " + _loc5_ + " ) for this ShadowMethod - ShadowMethod not created");
            return;
        }
        if (!(_loc4_ = this.method_3596(_loc6_[1] as class_2102, param1))) {
            return;
        }
        this.method_2421();
        method_3342(_loc4_, this.var_33[param1].name);
        this.var_33[param1].data = _loc4_;
        if (!this._debug) {
        }
    }

    private function method_3596(param1: class_2102, param2: uint): class_2245 {
        var _loc4_: * = null;
        var _loc6_: * = 0;
        var _loc7_: * = null;
        var _loc3_: uint = uint(this.var_107.readUnsignedShort());
        var _loc5_: AWDProperties = this.method_4466({
            "1": const_114,
            "2": const_114,
            "3": const_114,
            "101": this.var_290,
            "102": this.var_290,
            "103": this.var_290,
            "201": const_1768,
            "202": const_1768,
            "301": const_1815,
            "302": const_1815,
            "401": const_2540,
            "402": const_2540,
            "601": COLOR,
            "602": COLOR,
            "701": const_1351,
            "702": const_1351,
            "801": const_3108
        });
        switch (_loc3_) {
            case 1001:
                _loc6_ = uint(_loc5_.method_473(1, 0));
                if (!(_loc7_ = this.method_1083(_loc6_, [class_2131.const_3103]))[0]) {
                    this.var_33[param2].addError("Could not find the ShadowBaseMethod (ID = " + _loc6_ + " ) for this CascadeShadowMapMethod - ShadowMethod not created");
                    return _loc4_;
                }
                _loc4_ = new class_2624(_loc7_[1]);
                break;
            case 1002:
                _loc6_ = uint(_loc5_.method_473(1, 0));
                if (!(_loc7_ = this.method_1083(_loc6_, [class_2131.const_3103]))[0]) {
                    this.var_33[param2].addError("Could not find the ShadowBaseMethod (ID = " + _loc6_ + " ) for this NearShadowMapMethod - ShadowMethod not created");
                    return _loc4_;
                }
                _loc4_ = new class_2609(_loc7_[1]);
                break;
            case 1101:
                _loc4_ = new class_2625(DirectionalLight(param1));
                class_2625(_loc4_).alpha = _loc5_.method_473(101, 1);
                class_2625(_loc4_).epsilon = _loc5_.method_473(102, 0.002);
                break;
            case 1102:
                _loc4_ = new class_2616(DirectionalLight(param1), _loc5_.method_473(201, 5));
                class_2616(_loc4_).alpha = _loc5_.method_473(101, 1);
                class_2616(_loc4_).epsilon = _loc5_.method_473(102, 0.002);
                class_2616(_loc4_).range = _loc5_.method_473(103, 1);
                break;
            case 1103:
                _loc4_ = new class_2633(DirectionalLight(param1), _loc5_.method_473(201, 5));
                class_2633(_loc4_).alpha = _loc5_.method_473(101, 1);
                class_2633(_loc4_).epsilon = _loc5_.method_473(102, 0.002);
                class_2633(_loc4_).range = _loc5_.method_473(103, 1);
                break;
            case 1104:
                _loc4_ = new class_2620(param1);
                class_2620(_loc4_).alpha = _loc5_.method_473(101, 1);
                class_2620(_loc4_).epsilon = _loc5_.method_473(102, 0.002);
        }
        this.method_2421();
        return _loc4_;
    }

    private function method_5620(param1: uint): void {
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc2_: String = this.method_416();
        var _loc3_: uint = uint(this.var_107.readUnsignedShort());
        var _loc4_: class_2614 = new class_2614();
        this.method_4466(null);
        var _loc5_: Number = 0;
        while (_loc5_ < _loc3_) {
            this.var_107.readUnsignedShort();
            (_loc6_ = new class_2628()).var_2665 = this.var_107.readUnsignedShort() - 1;
            _loc6_.name = this.method_416();
            _loc7_ = this.method_638();
            _loc6_.var_4759 = _loc7_.rawData;
            this.method_4466(null);
            this.method_2421();
            _loc4_.joints.push(_loc6_);
            _loc5_++;
        }
        this.method_2421();
        method_3342(_loc4_, _loc2_);
        this.var_33[param1].data = _loc4_;
        if (!this._debug) {
        }
    }

    private function method_19(param1: uint): void {
        var _loc6_: * = null;
        var _loc7_: * = 0;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc2_: String = this.method_416();
        var _loc3_: uint = uint(this.var_107.readUnsignedShort());
        this.method_4466(null);
        var _loc4_: class_2636 = new class_2636();
        var _loc5_: Number = 0;
        while (_loc5_ < _loc3_) {
            _loc6_ = new class_2627();
            if ((_loc7_ = uint(this.var_107.readUnsignedByte())) == 1) {
                _loc8_ = this.method_3589();
                _loc9_ = new Matrix3D(_loc8_);
                _loc6_.orientation.method_767(_loc9_);
                _loc6_.var_2277.copyFrom(_loc9_.position);
                _loc4_.var_3009[_loc5_] = _loc6_;
            }
            _loc5_++;
        }
        this.method_2421();
        method_3342(_loc4_, _loc2_);
        this.var_33[param1].data = _loc4_;
        if (!this._debug) {
        }
    }

    private function method_5718(param1: uint): void {
        var _loc2_: Number = NaN;
        var _loc3_: * = 0;
        var _loc8_: * = null;
        var _loc4_: String = this.method_416();
        var _loc5_: class_2639 = new class_2639();
        var _loc6_: uint = uint(this.var_107.readUnsignedShort());
        this.method_4466(null);
        var _loc7_: Number = 0;
        while (_loc7_ < _loc6_) {
            _loc3_ = uint(this.var_107.readUnsignedInt());
            _loc2_ = Number(this.var_107.readUnsignedShort());
            if (!(_loc8_ = this.method_1083(_loc3_, [class_2131.const_3077]))[0]) {
                this.var_33[param1].addError("Could not find the SkeletonPose Frame # " + _loc7_ + " (ID = " + _loc3_ + " ) for this SkeletonClipNode");
            } else {
                _loc5_.addFrame(this.var_33[_loc3_].data as class_2636, _loc2_);
            }
            _loc7_++;
        }
        if (_loc5_.frames.length == 0) {
            this.var_33[param1].addError("Could not this SkeletonClipNode, because no Frames where set.");
            return;
        }
        this.method_2421();
        method_3342(_loc5_, _loc4_);
        this.var_33[param1].data = _loc5_;
        if (!this._debug) {
        }
    }

    private function method_2854(param1: uint, param2: Boolean = false): void {
        var _loc4_: * = 0;
        var _loc5_: Number = 0;
        var _loc6_: Number = 0;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        var _loc13_: * = null;
        var _loc14_: * = null;
        var _loc17_: * = null;
        var _loc18_: * = null;
        var _loc22_: * = null;
        var _loc3_: * = 1;
        var _loc15_: int = 0;
        var _loc16_: class_2436 = new class_2436();
        var _loc19_: int = 0;
        var _loc20_: int = 0;
        var _loc21_: Vector.<int> = new Vector.<int>();
        var _loc24_: String = this.method_416();
        var _loc25_: int = int(this.var_107.readUnsignedInt());
        var _loc26_: Array;
        if (!(_loc26_ = this.method_1083(_loc25_, [class_2131.GEOMETRY]))[0]) {
            this.var_33[param1].addError("Could not find the target-Geometry-Object " + _loc25_ + " ) for this VertexClipNode");
            return;
        }
        var _loc27_: Vector.<Vector.<Number>> = this.method_3729(_loc25_);
        if (!param2) {
            _loc3_ = uint(this.var_107.readUnsignedShort());
        }
        _loc4_ = uint(this.var_107.readUnsignedShort());
        _loc19_ = int(this.var_107.readUnsignedShort());
        _loc20_ = 0;
        while (_loc20_ < _loc19_) {
            _loc21_.push(this.var_107.readUnsignedShort());
            _loc20_++;
        }
        _loc22_ = this.method_4466({
            "1": const_1351,
            "2": const_1351
        });
        _loc16_.method_3310 = _loc22_.method_473(1, true);
        _loc16_.method_6520 = _loc22_.method_473(2, false);
        _loc5_ = 0;
        while (_loc5_ < _loc3_) {
            _loc7_ = Number(this.var_107.readUnsignedShort());
            _loc13_ = new class_2429();
            _loc6_ = 0;
            while (_loc6_ < _loc4_) {
                _loc20_ = 0;
                _loc11_ = Number(this.var_107.readUnsignedInt());
                _loc12_ = this.var_107.position + _loc11_;
                while (_loc20_ < _loc19_) {
                    if (_loc21_[_loc20_] == 1) {
                        _loc17_ = _loc26_[1].subGeometries[_loc6_].indexData;
                        _loc18_ = new Vector.<Number>();
                        _loc15_ = 0;
                        while (this.var_107.position < _loc12_) {
                            _loc8_ = Number(this.readNumber(this.var_2320));
                            _loc9_ = Number(this.readNumber(this.var_2320));
                            _loc10_ = Number(this.readNumber(this.var_2320));
                            var _loc28_: *;
                            _loc18_[_loc28_ = _loc15_++] = _loc8_;
                            var _loc29_: *;
                            _loc18_[_loc29_ = _loc15_++] = _loc9_;
                            var _loc30_: *;
                            _loc18_[_loc30_ = _loc15_++] = _loc10_;
                        }
                        (_loc14_ = new class_2602()).method_5600(_loc18_, _loc27_[_loc6_], null, null);
                        _loc14_.updateIndexData(_loc17_);
                        _loc14_.method_4313;
                        _loc14_.method_303;
                        _loc14_.method_251 = false;
                        _loc14_.method_5188 = false;
                        _loc6_++;
                        _loc13_.method_1586(_loc14_);
                    } else {
                        this.var_107.position = _loc12_;
                    }
                    _loc20_++;
                }
            }
            _loc16_.addFrame(new class_2437(_loc13_, _loc7_));
            _loc5_++;
        }
        this.method_2421();
        method_3342(_loc16_, _loc24_);
        this.var_33[param1].data = _loc16_;
        if (!this._debug) {
        }
    }

    private function method_5397(param1: uint): void {
        var _loc2_: int = 0;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc14_: * = null;
        var _loc4_: String = this.method_416();
        var _loc5_: uint = uint(this.var_107.readUnsignedShort());
        var _loc6_: AWDProperties = this.method_4466({"1": const_1815});
        var _loc7_: Number = 0;
        var _loc8_: Vector.<class_2639> = new Vector.<class_2639>();
        var _loc9_: Vector.<class_2436> = new Vector.<class_2436>();
        while (_loc7_ < _loc5_) {
            _loc2_ = int(this.var_107.readUnsignedInt());
            if (!(_loc10_ = this.method_1083(_loc2_, [class_2131.const_800]))[0]) {
                this.var_33[param1].addError("Could not find the AnimationClipNode Nr " + _loc7_ + " ( " + _loc2_ + " ) for this AnimationSet");
            } else {
                if (_loc10_[1] is class_2436) {
                    _loc9_.push(_loc10_[1]);
                }
                if (_loc10_[1] is class_2639) {
                    _loc8_.push(_loc10_[1]);
                }
            }
            _loc7_++;
        }
        if (_loc9_.length == 0 && _loc8_.length == 0) {
            this.var_33[param1].addError("Could not create this AnimationSet, because it contains no animations");
            return;
        }
        this.method_2421();
        if (_loc9_.length > 0) {
            _loc11_ = new class_2439();
            for each(_loc12_ in _loc9_) {
                _loc11_.addAnimation(_loc12_);
            }
            method_3342(_loc11_, _loc4_);
            this.var_33[param1].data = _loc11_;
            if (!this._debug) {
            }
        } else if (_loc8_.length > 0) {
            _loc10_ = this.method_1083(_loc2_, [class_2131.const_800]);
            _loc13_ = new class_2642(_loc6_.method_473(1, 4));
            for each(_loc14_ in _loc8_) {
                _loc13_.addAnimation(_loc14_);
            }
            method_3342(_loc13_, _loc4_);
            this.var_33[param1].data = _loc13_;
            if (!this._debug) {
            }
        }
    }

    private function method_6161(param1: uint): void {
        var _loc8_: * = null;
        var _loc9_: * = 0;
        var _loc10_: * = null;
        var _loc2_: String = this.method_416();
        var _loc3_: uint = uint(this.var_107.readUnsignedShort());
        var _loc4_: AWDProperties = this.method_4466(null);
        var _loc5_: class_2610 = new class_2610();
        var _loc6_: Sprite = new Sprite();
        var _loc7_: Number = 0;
        while (_loc7_ < _loc3_) {
            (_loc8_ = this.method_1961()).scale(100, 100);
            _loc6_.transform.matrix = _loc8_;
            _loc9_ = uint(this.var_107.readUnsignedShort());
            _loc10_ = new class_2617(_loc6_.x * 0.01, _loc6_.y * 0.01, _loc6_.scaleX / 100, _loc6_.scaleY / 100, _loc6_.rotation);
            _loc5_.addFrame(_loc10_, _loc9_);
            _loc7_++;
        }
        this.method_2421();
        method_3342(_loc5_, _loc2_);
        this.var_33[param1].data = _loc5_;
        if (!this._debug) {
        }
    }

    private function method_5798(param1: uint): void {
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc14_: * = null;
        var _loc16_: * = null;
        var _loc6_: String = this.method_416();
        var _loc7_: uint = uint(this.var_107.readUnsignedShort());
        var _loc8_: AWDProperties = this.method_4466({"1": const_114});
        _loc3_ = int(this.var_107.readUnsignedInt());
        var _loc9_: uint = uint(this.var_107.readUnsignedShort());
        var _loc10_: Vector.<uint> = new Vector.<uint>();
        var _loc11_: int = 0;
        while (_loc11_ < _loc9_) {
            _loc10_.push(this.var_107.readUnsignedInt());
            _loc11_++;
        }
        var _loc12_: uint = uint(this.var_107.readUnsignedShort());
        var _loc13_: Boolean = Boolean(this.var_107.readUnsignedByte());
        this.method_2421();
        this.method_2421();
        var _loc15_: Vector.<class_2114> = new Vector.<class_2114>();
        _loc11_ = 0;
        while (_loc11_ < _loc10_.length) {
            if ((_loc14_ = this.method_1083(_loc10_[_loc11_], [class_2131.const_3013]))[0]) {
                _loc15_.push(_loc14_[1] as class_2114);
            }
            _loc11_++;
        }
        if (!(_loc14_ = this.method_1083(_loc3_, [class_2131.const_2058]))[0]) {
            this.var_33[param1].addError("Could not find the AnimationSet ( " + _loc3_ + " ) for this Animator");
            return;
        }
        _loc4_ = _loc14_[1] as class_2438;
        if (_loc7_ == 1) {
            if (!(_loc14_ = this.method_1083(_loc8_.method_473(1, 0), [class_2131.const_1226]))[0]) {
                this.var_33[param1].addError("Could not find the Skeleton ( " + _loc8_.method_473(1, 0) + " ) for this Animator");
                return;
            }
            _loc16_ = new SkeletonAnimator(_loc4_ as class_2642, _loc14_[1] as class_2614);
        } else if (_loc7_ == 2) {
            _loc16_ = new class_2121(_loc4_ as class_2439);
        }
        method_3342(_loc16_, _loc6_);
        this.var_33[param1].data = _loc16_;
        _loc11_ = 0;
        while (_loc11_ < _loc15_.length) {
            if (_loc7_ == 1) {
                _loc15_[_loc11_].animator = SkeletonAnimator(_loc16_);
            }
            if (_loc7_ == 2) {
                _loc15_[_loc11_].animator = class_2121(_loc16_);
            }
            _loc11_++;
        }
        if (!this._debug) {
        }
    }

    private function method_5916(param1: uint): void {
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = 0;
        var _loc13_: * = null;
        var _loc2_: Boolean = Boolean(this.var_107.readUnsignedByte());
        var _loc3_: uint = uint(this.var_107.readUnsignedInt());
        var _loc4_: Matrix3D = this.method_638();
        var _loc5_: String = this.method_416();
        var _loc8_: Array;
        if ((_loc8_ = this.method_1083(_loc3_, [class_2131.CONTAINER, class_2131.const_1414, class_2131.const_3013, class_2131.const_2930, class_2131.const_2748]))[0]) {
            _loc6_ = class_1752(_loc8_[1]);
        }
        var _loc9_: uint = uint(this.var_107.readShort());
        var _loc10_: uint = uint(this.var_107.readShort());
        _loc11_ = this.method_4466({"1": const_114});
        switch (_loc10_) {
            case 1:
                _loc12_ = uint(_loc11_.method_473(1, 0));
                if (!(_loc13_ = this.method_1083(_loc12_, [class_2131.const_1414, class_2131.const_2510]))[0] && _loc12_ != 0) {
                    this.var_33[param1].addError("Could not find the light (ID = " + _loc12_ + " ( for this CommandBock!");
                    return;
                }
                _loc7_ = _loc13_[1];
                if (_loc6_) {
                    _loc6_.addChild(_loc7_);
                }
                _loc7_.transform = _loc4_;
                break;
        }
        if (_loc7_) {
            _loc11_ = this.method_4466({
                "1": this.var_599,
                "2": this.var_599,
                "3": this.var_599,
                "4": const_2540
            });
            _loc7_.method_1773 = new Vector3D(_loc11_.method_473(1, 0), _loc11_.method_473(2, 0), _loc11_.method_473(3, 0));
            _loc7_.extra = this.method_2421();
        }
        this.var_33[param1].data = _loc7_;
        if (!this._debug) {
        }
    }

    private function method_1018(param1: uint): void {
        var _loc2_: uint = uint(this.var_107.readUnsignedByte());
        var _loc3_: String = this.method_416();
        if (!this._debug) {
        }
    }

    private function method_1734(param1: uint): void {
        var _loc2_: AWDProperties = this.method_4466({
            "1": const_1768,
            "2": const_1808,
            "3": const_1808,
            "4": const_1808,
            "5": const_1808
        });
        if (!this._debug) {
        }
    }

    private function method_3729(param1: uint): Vector.<Vector.<Number>> {
        var _loc4_: * = null;
        var _loc5_: * = 0;
        var _loc6_: * = 0;
        var _loc7_: * = 0;
        var _loc8_: int = 0;
        var _loc9_: * = null;
        if (this.var_33[param1].data is class_2114) {
            param1 = uint(this.var_33[param1].geoID);
        }
        if (this.var_33[param1].uvsForVertexAnimation) {
            return this.var_33[param1].uvsForVertexAnimation;
        }
        var _loc2_: class_2429 = class_2429(this.var_33[[param1]].data);
        var _loc3_: int = 0;
        this.var_33[param1].uvsForVertexAnimation = new Vector.<Vector.<Number>>();
        while (_loc3_ < _loc2_.subGeometries.length) {
            _loc9_ = new Vector.<Number>();
            _loc7_ = uint(_loc2_.subGeometries[_loc3_].numVertices);
            _loc4_ = _loc2_.subGeometries[_loc3_].method_868;
            _loc5_ = uint(_loc2_.subGeometries[_loc3_].method_2639);
            _loc6_ = uint(_loc2_.subGeometries[_loc3_].method_2585);
            _loc8_ = 0;
            while (_loc8_ < _loc7_) {
                _loc9_.push(_loc4_[_loc6_ + _loc8_ * _loc5_ + 0]);
                _loc9_.push(_loc4_[_loc6_ + _loc8_ * _loc5_ + 1]);
                _loc8_++;
            }
            this.var_33[param1].uvsForVertexAnimation.push(_loc9_);
            _loc3_++;
        }
        return this.var_33[param1].uvsForVertexAnimation;
    }

    private function method_416(): String {
        var _loc1_: uint = uint(this.var_107.readUnsignedShort());
        return this.var_107.readUTFBytes(_loc1_);
    }

    private function method_4466(param1: Object): AWDProperties {
        var _loc2_: * = 0;
        var _loc3_: * = 0;
        var _loc6_: * = 0;
        var _loc7_: * = 0;
        var _loc8_: * = 0;
        var _loc4_: * = 0;
        var _loc5_: AWDProperties = new AWDProperties();
        _loc3_ = uint(this.var_107.readUnsignedInt());
        _loc2_ = this.var_107.position + _loc3_;
        if (param1) {
            while (this.var_107.position < _loc2_) {
                _loc7_ = uint(this.var_107.readUnsignedShort());
                _loc6_ = uint(this.var_107.readUnsignedInt());
                if (this.var_107.position + _loc6_ > _loc2_) {
                    this.var_107.position = _loc2_;
                    return _loc5_;
                }
                if (param1.hasOwnProperty(_loc7_.toString())) {
                    _loc8_ = uint(param1[_loc7_]);
                    _loc5_.method_1796(_loc7_, this.method_3667(_loc8_, _loc6_));
                } else {
                    this.var_107.position += _loc6_;
                }
                _loc4_ += 1;
            }
        } else {
            this.var_107.position = _loc2_;
        }
        return _loc5_;
    }

    private function method_2421(): Object {
        var _loc1_: * = null;
        var _loc2_: * = 0;
        var _loc3_: * = 0;
        var _loc4_: * = 0;
        var _loc5_: * = 0;
        var _loc6_: * = null;
        var _loc7_: * = 0;
        var _loc8_: * = 0;
        var _loc9_: * = undefined;
        _loc2_ = uint(this.var_107.readUnsignedInt());
        if (_loc2_ > 0) {
            _loc1_ = {};
            _loc4_ = this.var_107.position + _loc2_;
            while (this.var_107.position < _loc4_) {
                _loc5_ = uint(this.var_107.readUnsignedByte());
                _loc6_ = this.method_416();
                _loc7_ = uint(this.var_107.readUnsignedByte());
                _loc8_ = uint(this.var_107.readUnsignedInt());
                if (this.var_107.position + _loc8_ > _loc4_) {
                    this.var_107.position = _loc4_;
                    return _loc1_;
                }
                switch (_loc7_) {
                    case const_1808:
                        _loc9_ = this.var_107.readUTFBytes(_loc8_);
                        break;
                    case const_587:
                        _loc9_ = this.var_107.readByte();
                        break;
                    case const_1138:
                        _loc9_ = this.var_107.readShort();
                        break;
                    case const_535:
                        _loc9_ = this.var_107.readInt();
                        break;
                    case const_1351:
                    case const_2540:
                        _loc9_ = this.var_107.readUnsignedByte();
                        break;
                    case const_1815:
                        _loc9_ = this.var_107.readUnsignedShort();
                        break;
                    case const_1768:
                    case const_114:
                        _loc9_ = this.var_107.readUnsignedInt();
                        break;
                    case const_2413:
                        _loc9_ = this.var_107.readFloat();
                        break;
                    case const_842:
                        _loc9_ = this.var_107.readDouble();
                        break;
                    default:
                        _loc9_ = "unimplemented attribute type " + _loc7_;
                        this.var_107.position += _loc8_;
                }
                if (!this._debug) {
                }
                _loc1_[_loc6_] = _loc9_;
                _loc3_ += 1;
            }
        }
        return _loc1_;
    }

    private function method_782(): class_1751 {
        if (!this.var_3335) {
            this.var_3335 = class_2430.method_782();
        }
        return this.var_3335;
    }

    private function method_1959(): class_1751 {
        if (!this.var_2524) {
            this.var_2524 = class_2430.method_1959();
        }
        return this.var_2524;
    }

    private function method_452(): class_1751 {
        var _loc1_: * = null;
        if (!this.var_1730) {
            if (!this.var_2524) {
                this.var_2524 = class_2430.method_1959();
            }
            _loc1_ = this.var_2524.bitmapData;
            this.var_1730 = new class_2622(_loc1_, _loc1_, _loc1_, _loc1_, _loc1_, _loc1_);
            this.var_1730.name = "defaultTexture";
        }
        return this.var_1730;
    }

    private function method_5260(param1: String, param2: String): class_1751 {
        switch (true) {
            case param1 == class_2131.TEXTURE:
                if (param2 == "CubeTexture") {
                    return this.method_452();
                }
                if (param2 == "SingleTexture") {
                    return this.method_1959();
                }
                break;
            case param1 == class_2131.const_808:
                return this.method_782();
        }
        return null;
    }

    private function method_1083(param1: uint, param2: Array, param3: String = "SingleTexture"): Array {
        var _loc4_: Array = new Array();
        var _loc5_: int = 0;
        if (param1 > 0) {
            if (this.var_33[param1]) {
                if (this.var_33[param1].data) {
                    while (_loc5_ < param2.length) {
                        if (class_1751(this.var_33[param1].data).assetType == param2[_loc5_]) {
                            if (param2[_loc5_] == class_2131.TEXTURE && param3 == "CubeTexture") {
                                if (this.var_33[param1].data is class_2622 || this.var_33[param1].data is class_2621) {
                                    _loc4_.push(true);
                                    _loc4_.push(this.var_33[param1].data);
                                    return _loc4_;
                                }
                            }
                            if (!(param2[_loc5_] == class_2131.TEXTURE && param3 == "SingleTexture")) {
                                _loc4_.push(true);
                                _loc4_.push(this.var_33[param1].data);
                                return _loc4_;
                            }
                            if (this.var_33[param1].data is class_2117 || this.var_33[param1].data is class_2118) {
                                _loc4_.push(true);
                                _loc4_.push(this.var_33[param1].data);
                                return _loc4_;
                            }
                        }
                        if (param2[_loc5_] == class_2131.GEOMETRY && class_1751(this.var_33[param1].data).assetType == class_2131.const_3013) {
                            _loc4_.push(true);
                            _loc4_.push(class_2114(this.var_33[param1].data).geometry);
                            return _loc4_;
                        }
                        _loc5_++;
                    }
                }
            }
        }
        _loc4_.push(false);
        _loc4_.push(this.method_5260(param2[0], param3));
        return _loc4_;
    }

    private function method_3667(param1: uint, param2: uint): * {
        var _loc3_: Number = 0;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: Number = 0;
        var _loc7_: * = 0;
        var _loc8_: * = undefined;
        switch (param1) {
            case const_1351:
            case const_587:
                _loc3_ = 1;
                _loc4_ = this.var_107.readByte;
                break;
            case const_1138:
                _loc3_ = 2;
                _loc4_ = this.var_107.readShort;
                break;
            case const_535:
                _loc3_ = 4;
                _loc4_ = this.var_107.readInt;
                break;
            case const_2540:
                _loc3_ = 1;
                _loc4_ = this.var_107.readUnsignedByte;
                break;
            case const_1815:
                _loc3_ = 2;
                _loc4_ = this.var_107.readUnsignedShort;
                break;
            case const_1768:
            case COLOR:
            case const_114:
                _loc3_ = 4;
                _loc4_ = this.var_107.readUnsignedInt;
                break;
            case const_2413:
                _loc3_ = 4;
                _loc4_ = this.var_107.readFloat;
                break;
            case const_842:
                _loc3_ = 8;
                _loc4_ = this.var_107.readDouble;
                break;
            case const_1808:
                return this.var_107.readUTFBytes(param2);
            case const_916:
            case const_2759:
            case const_440:
            case const_1386:
            case const_2992:
            case const_1160:
            case const_3108:
                _loc3_ = 8;
                _loc4_ = this.var_107.readDouble;
        }
        if (_loc3_ < param2) {
            _loc5_ = [];
            _loc6_ = 0;
            _loc7_ = param2 / _loc3_;
            while (_loc6_ < _loc7_) {
                _loc5_.push(_loc4_());
                _loc6_++;
            }
            return _loc5_;
        }
        return _loc4_();
    }

    private function method_1961(): Matrix {
        var _loc1_: * = null;
        var _loc2_: Vector.<Number> = this.method_2631();
        return new Matrix(_loc2_[0], _loc2_[1], _loc2_[2], _loc2_[3], _loc2_[4], _loc2_[5]);
    }

    private function method_638(): Matrix3D {
        return new Matrix3D(this.method_3589());
    }

    private function method_2631(): Vector.<Number> {
        var _loc1_: Number = 0;
        var _loc2_: Vector.<Number> = new Vector.<Number>(6, true);
        _loc1_ = 0;
        while (_loc1_ < 6) {
            _loc2_[_loc1_] = this.var_107.readFloat();
            _loc1_++;
        }
        return _loc2_;
    }

    private function readNumber(param1: Boolean = false): Number {
        if (param1) {
            return this.var_107.readDouble();
        }
        return this.var_107.readFloat();
    }

    private function method_3589(): Vector.<Number> {
        var _loc1_: Vector.<Number> = new Vector.<Number>(16, true);
        _loc1_[0] = this.readNumber(this.var_4021);
        _loc1_[1] = this.readNumber(this.var_4021);
        _loc1_[2] = this.readNumber(this.var_4021);
        _loc1_[3] = 0;
        _loc1_[4] = this.readNumber(this.var_4021);
        _loc1_[5] = this.readNumber(this.var_4021);
        _loc1_[6] = this.readNumber(this.var_4021);
        _loc1_[7] = 0;
        _loc1_[8] = this.readNumber(this.var_4021);
        _loc1_[9] = this.readNumber(this.var_4021);
        _loc1_[10] = this.readNumber(this.var_4021);
        _loc1_[11] = 0;
        _loc1_[12] = this.readNumber(this.var_4021);
        _loc1_[13] = this.readNumber(this.var_4021);
        _loc1_[14] = this.readNumber(this.var_4021);
        _loc1_[15] = 1;
        if (isNaN(_loc1_[0])) {
            _loc1_[0] = 1;
            _loc1_[1] = 0;
            _loc1_[2] = 0;
            _loc1_[4] = 0;
            _loc1_[5] = 1;
            _loc1_[6] = 0;
            _loc1_[8] = 0;
            _loc1_[9] = 0;
            _loc1_[10] = 1;
            _loc1_[12] = 0;
            _loc1_[13] = 0;
            _loc1_[14] = 0;
        }
        return _loc1_;
    }
}
}

import flash.utils.ByteArray;

class AWDBlock {


    public var id: uint;

    public var name: String;

    public var data;

    public var len;

    public var geoID: uint;

    public var extras: Object;

    public var bytes: ByteArray;

    public var errorMessages: Vector.<String>;

    public var uvsForVertexAnimation: Vector.<Vector.<Number>>;

    function AWDBlock() {
        super();
    }

    public function addError(param1: String): void {
        if (!this.errorMessages) {
            this.errorMessages = new Vector.<String>();
        }
        this.errorMessages.push(param1);
    }
}

class bitFlags {

    public static const FLAG1: uint = 1;

    public static const FLAG2: uint = 2;

    public static const FLAG3: uint = 4;

    public static const FLAG4: uint = 8;

    public static const FLAG5: uint = 16;

    public static const FLAG6: uint = 32;

    public static const FLAG7: uint = 64;

    public static const FLAG8: uint = 128;

    public static const FLAG9: uint = 256;

    public static const FLAG10: uint = 512;

    public static const FLAG11: uint = 1024;

    public static const FLAG12: uint = 2048;

    public static const FLAG13: uint = 4096;

    public static const FLAG14: uint = 8192;

    public static const FLAG15: uint = 16384;

    public static const FLAG16: uint = 32768;


    function bitFlags() {
        super();
    }

    public static function test(param1: uint, param2: uint): Boolean {
        return (param1 & param2) == param2;
    }
}

dynamic class AWDProperties {


    function AWDProperties() {
        super();
    }

    public function method_1796(param1: uint, param2: *): void {
        this[param1.toString()] = param2;
    }

    public function method_473(param1: uint, param2: *): * {
        if (this.hasOwnProperty(param1.toString())) {
            return this[param1.toString()];
        }
        return param2;
    }
}
