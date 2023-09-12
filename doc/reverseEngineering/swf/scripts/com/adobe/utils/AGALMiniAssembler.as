package com.adobe.utils {

import flash.display3D.Context3D;
import flash.display3D.Program3D;
import flash.utils.ByteArray;
import flash.utils.Dictionary;
import flash.utils.Endian;
import flash.utils.getTimer;

public class AGALMiniAssembler {

    protected static const REGEXP_OUTER_SPACES: RegExp = /^\s+|\s+$/g;

    private static var initialized: Boolean = false;

    private static const OPMAP: Dictionary = new Dictionary();

    private static const REGMAP: Dictionary = new Dictionary();

    private static const SAMPLEMAP: Dictionary = new Dictionary();

    private static const MAX_NESTING: int = 4;

    private static const MAX_OPCODES: int = 2048;

    private static const FRAGMENT: String = "fragment";

    private static const VERTEX: String = "vertex";

    private static const SAMPLER_TYPE_SHIFT: uint = 8;

    private static const SAMPLER_DIM_SHIFT: uint = 12;

    private static const SAMPLER_SPECIAL_SHIFT: uint = 16;

    private static const SAMPLER_REPEAT_SHIFT: uint = 20;

    private static const SAMPLER_MIPMAP_SHIFT: uint = 24;

    private static const SAMPLER_FILTER_SHIFT: uint = 28;

    private static const REG_WRITE: uint = 1;

    private static const REG_READ: uint = 2;

    private static const REG_FRAG: uint = 32;

    private static const REG_VERT: uint = 64;

    private static const OP_SCALAR: uint = 1;

    private static const OP_SPECIAL_TEX: uint = 8;

    private static const OP_SPECIAL_MATRIX: uint = 16;

    private static const OP_FRAG_ONLY: uint = 32;

    private static const OP_VERT_ONLY: uint = 64;

    private static const OP_NO_DEST: uint = 128;

    private static const OP_VERSION2: uint = 256;

    private static const OP_INCNEST: uint = 512;

    private static const OP_DECNEST: uint = 1024;

    private static const MOV: String = "mov";

    private static const ADD: String = "add";

    private static const SUB: String = "sub";

    private static const MUL: String = "mul";

    private static const DIV: String = "div";

    private static const RCP: String = "rcp";

    private static const MIN: String = "min";

    private static const MAX: String = "max";

    private static const FRC: String = "frc";

    private static const SQT: String = "sqt";

    private static const RSQ: String = "rsq";

    private static const POW: String = "pow";

    private static const LOG: String = "log";

    private static const EXP: String = "exp";

    private static const NRM: String = "nrm";

    private static const SIN: String = "sin";

    private static const COS: String = "cos";

    private static const CRS: String = "crs";

    private static const DP3: String = "dp3";

    private static const DP4: String = "dp4";

    private static const ABS: String = "abs";

    private static const NEG: String = "neg";

    private static const SAT: String = "sat";

    private static const M33: String = "m33";

    private static const M44: String = "m44";

    private static const M34: String = "m34";

    private static const DDX: String = "ddx";

    private static const DDY: String = "ddy";

    private static const IFE: String = "ife";

    private static const INE: String = "ine";

    private static const IFG: String = "ifg";

    private static const IFL: String = "ifl";

    private static const ELS: String = "els";

    private static const EIF: String = "eif";

    private static const TED: String = "ted";

    private static const KIL: String = "kil";

    private static const TEX: String = "tex";

    private static const SGE: String = "sge";

    private static const SLT: String = "slt";

    private static const SGN: String = "sgn";

    private static const SEQ: String = "seq";

    private static const SNE: String = "sne";

    private static const VA: String = "va";

    private static const VC: String = "vc";

    private static const VT: String = "vt";

    private static const VO: String = "vo";

    private static const VI: String = "vi";

    private static const FC: String = "fc";

    private static const FT: String = "ft";

    private static const FS: String = "fs";

    private static const FO: String = "fo";

    private static const FD: String = "fd";

    private static const D2: String = "2d";

    private static const D3: String = "3d";

    private static const CUBE: String = "cube";

    private static const MIPNEAREST: String = "mipnearest";

    private static const MIPLINEAR: String = "miplinear";

    private static const MIPNONE: String = "mipnone";

    private static const NOMIP: String = "nomip";

    private static const NEAREST: String = "nearest";

    private static const LINEAR: String = "linear";

    private static const CENTROID: String = "centroid";

    private static const SINGLE: String = "single";

    private static const IGNORESAMPLER: String = "ignoresampler";

    private static const REPEAT: String = "repeat";

    private static const WRAP: String = "wrap";

    private static const CLAMP: String = "clamp";

    private static const RGBA: String = "rgba";

    private static const DXT1: String = "dxt1";

    private static const DXT5: String = "dxt5";

    private static const VIDEO: String = "video";


    private var _agalcode: ByteArray = null;

    private var _error: String = "";

    private var debugEnabled: Boolean = false;

    public var verbose: Boolean = false;

    public function AGALMiniAssembler(param1: Boolean = false) {
        super();
        this.debugEnabled = param1;
        if (!initialized) {
            init();
        }
    }

    private static function init(): void {
        initialized = true;
        OPMAP[MOV] = new OpCode(MOV, 2, 0, 0);
        OPMAP[ADD] = new OpCode(ADD, 3, 1, 0);
        OPMAP[SUB] = new OpCode(SUB, 3, 2, 0);
        OPMAP[MUL] = new OpCode(MUL, 3, 3, 0);
        OPMAP[DIV] = new OpCode(DIV, 3, 4, 0);
        OPMAP[RCP] = new OpCode(RCP, 2, 5, 0);
        OPMAP[MIN] = new OpCode(MIN, 3, 6, 0);
        OPMAP[MAX] = new OpCode(MAX, 3, 7, 0);
        OPMAP[FRC] = new OpCode(FRC, 2, 8, 0);
        OPMAP[SQT] = new OpCode(SQT, 2, 9, 0);
        OPMAP[RSQ] = new OpCode(RSQ, 2, 10, 0);
        OPMAP[POW] = new OpCode(POW, 3, 11, 0);
        OPMAP[LOG] = new OpCode(LOG, 2, 12, 0);
        OPMAP[EXP] = new OpCode(EXP, 2, 13, 0);
        OPMAP[NRM] = new OpCode(NRM, 2, 14, 0);
        OPMAP[SIN] = new OpCode(SIN, 2, 15, 0);
        OPMAP[COS] = new OpCode(COS, 2, 16, 0);
        OPMAP[CRS] = new OpCode(CRS, 3, 17, 0);
        OPMAP[DP3] = new OpCode(DP3, 3, 18, 0);
        OPMAP[DP4] = new OpCode(DP4, 3, 19, 0);
        OPMAP[ABS] = new OpCode(ABS, 2, 20, 0);
        OPMAP[NEG] = new OpCode(NEG, 2, 21, 0);
        OPMAP[SAT] = new OpCode(SAT, 2, 22, 0);
        OPMAP[M33] = new OpCode(M33, 3, 23, OP_SPECIAL_MATRIX);
        OPMAP[M44] = new OpCode(M44, 3, 24, OP_SPECIAL_MATRIX);
        OPMAP[M34] = new OpCode(M34, 3, 25, OP_SPECIAL_MATRIX);
        OPMAP[DDX] = new OpCode(DDX, 2, 26, OP_VERSION2 | OP_FRAG_ONLY);
        OPMAP[DDY] = new OpCode(DDY, 2, 27, OP_VERSION2 | OP_FRAG_ONLY);
        OPMAP[IFE] = new OpCode(IFE, 2, 28, OP_NO_DEST | OP_VERSION2 | OP_INCNEST | OP_SCALAR);
        OPMAP[INE] = new OpCode(INE, 2, 29, OP_NO_DEST | OP_VERSION2 | OP_INCNEST | OP_SCALAR);
        OPMAP[IFG] = new OpCode(IFG, 2, 30, OP_NO_DEST | OP_VERSION2 | OP_INCNEST | OP_SCALAR);
        OPMAP[IFL] = new OpCode(IFL, 2, 31, OP_NO_DEST | OP_VERSION2 | OP_INCNEST | OP_SCALAR);
        OPMAP[ELS] = new OpCode(ELS, 0, 32, OP_NO_DEST | OP_VERSION2 | OP_INCNEST | OP_DECNEST | OP_SCALAR);
        OPMAP[EIF] = new OpCode(EIF, 0, 33, OP_NO_DEST | OP_VERSION2 | OP_DECNEST | OP_SCALAR);
        OPMAP[TED] = new OpCode(TED, 3, 38, OP_FRAG_ONLY | OP_SPECIAL_TEX | OP_VERSION2);
        OPMAP[KIL] = new OpCode(KIL, 1, 39, OP_NO_DEST | OP_FRAG_ONLY);
        OPMAP[TEX] = new OpCode(TEX, 3, 40, OP_FRAG_ONLY | OP_SPECIAL_TEX);
        OPMAP[SGE] = new OpCode(SGE, 3, 41, 0);
        OPMAP[SLT] = new OpCode(SLT, 3, 42, 0);
        OPMAP[SGN] = new OpCode(SGN, 2, 43, 0);
        OPMAP[SEQ] = new OpCode(SEQ, 3, 44, 0);
        OPMAP[SNE] = new OpCode(SNE, 3, 45, 0);
        SAMPLEMAP[RGBA] = new Sampler(RGBA, SAMPLER_TYPE_SHIFT, 0);
        SAMPLEMAP[DXT1] = new Sampler(DXT1, SAMPLER_TYPE_SHIFT, 1);
        SAMPLEMAP[DXT5] = new Sampler(DXT5, SAMPLER_TYPE_SHIFT, 2);
        SAMPLEMAP[VIDEO] = new Sampler(VIDEO, SAMPLER_TYPE_SHIFT, 3);
        SAMPLEMAP[D2] = new Sampler(D2, SAMPLER_DIM_SHIFT, 0);
        SAMPLEMAP[D3] = new Sampler(D3, SAMPLER_DIM_SHIFT, 2);
        SAMPLEMAP[CUBE] = new Sampler(CUBE, SAMPLER_DIM_SHIFT, 1);
        SAMPLEMAP[MIPNEAREST] = new Sampler(MIPNEAREST, SAMPLER_MIPMAP_SHIFT, 1);
        SAMPLEMAP[MIPLINEAR] = new Sampler(MIPLINEAR, SAMPLER_MIPMAP_SHIFT, 2);
        SAMPLEMAP[MIPNONE] = new Sampler(MIPNONE, SAMPLER_MIPMAP_SHIFT, 0);
        SAMPLEMAP[NOMIP] = new Sampler(NOMIP, SAMPLER_MIPMAP_SHIFT, 0);
        SAMPLEMAP[NEAREST] = new Sampler(NEAREST, SAMPLER_FILTER_SHIFT, 0);
        SAMPLEMAP[LINEAR] = new Sampler(LINEAR, SAMPLER_FILTER_SHIFT, 1);
        SAMPLEMAP[CENTROID] = new Sampler(CENTROID, SAMPLER_SPECIAL_SHIFT, 1);
        SAMPLEMAP[SINGLE] = new Sampler(SINGLE, SAMPLER_SPECIAL_SHIFT, 2);
        SAMPLEMAP[IGNORESAMPLER] = new Sampler(IGNORESAMPLER, SAMPLER_SPECIAL_SHIFT, 4);
        SAMPLEMAP[REPEAT] = new Sampler(REPEAT, SAMPLER_REPEAT_SHIFT, 1);
        SAMPLEMAP[WRAP] = new Sampler(WRAP, SAMPLER_REPEAT_SHIFT, 1);
        SAMPLEMAP[CLAMP] = new Sampler(CLAMP, SAMPLER_REPEAT_SHIFT, 0);
    }

    public function get error(): String {
        return this._error;
    }

    public function get agalcode(): ByteArray {
        return this._agalcode;
    }

    public function assemble2(param1: Context3D, param2: uint, param3: String, param4: String): Program3D {
        var _loc5_: ByteArray = this.assemble(VERTEX, param3, param2);
        var _loc6_: ByteArray = this.assemble(FRAGMENT, param4, param2);
        var _loc7_: Program3D;
        (_loc7_ = param1.createProgram()).upload(_loc5_, _loc6_);
        return _loc7_;
    }

    public function assemble(param1: String, param2: String, param3: uint = 1, param4: Boolean = false): ByteArray {
        var _loc9_: int = 0;
        var _loc11_: * = null;
        var _loc12_: int = 0;
        var _loc13_: int = 0;
        var _loc14_: * = null;
        var _loc15_: * = null;
        var _loc16_: * = null;
        var _loc17_: * = null;
        var _loc18_: Boolean = false;
        var _loc19_: * = 0;
        var _loc20_: * = 0;
        var _loc21_: int = 0;
        var _loc22_: Boolean = false;
        var _loc23_: * = null;
        var _loc24_: * = null;
        var _loc25_: * = null;
        var _loc26_: * = null;
        var _loc27_: * = 0;
        var _loc28_: * = 0;
        var _loc29_: * = null;
        var _loc30_: Boolean = false;
        var _loc31_: Boolean = false;
        var _loc32_: * = 0;
        var _loc33_: * = 0;
        var _loc34_: int = 0;
        var _loc35_: * = 0;
        var _loc36_: * = 0;
        var _loc37_: int = 0;
        var _loc38_: * = null;
        var _loc39_: * = null;
        var _loc40_: * = null;
        var _loc41_: * = null;
        var _loc42_: * = 0;
        var _loc43_: * = 0;
        var _loc44_: Number = NaN;
        var _loc45_: * = null;
        var _loc46_: * = null;
        var _loc47_: * = 0;
        var _loc48_: Number = 0;
        var _loc49_: * = null;
        var _loc5_: uint = getTimer();
        this._agalcode = new ByteArray();
        this._error = "";
        var _loc6_: Boolean = false;
        if (param1 == FRAGMENT) {
            _loc6_ = true;
        } else if (param1 != VERTEX) {
            this._error = "ERROR: mode needs to be \"" + FRAGMENT + "\" or \"" + VERTEX + "\" but is \"" + param1 + "\".";
        }
        this.agalcode.endian = Endian.LITTLE_ENDIAN;
        this.agalcode.writeByte(160);
        this.agalcode.writeUnsignedInt(param3);
        this.agalcode.writeByte(161);
        this.agalcode.writeByte(_loc6_ ? 1 : 0);
        this.initregmap(param3, param4);
        var _loc7_: Array = param2.replace(/[\f\n\r\v]+/g, "\n").split("\n");
        var _loc8_: int = 0;
        var _loc10_: int = _loc7_.length;
        _loc9_ = 0;
        while (_loc9_ < _loc10_ && this._error == "") {
            if ((_loc12_ = (_loc11_ = (_loc11_ = new String(_loc7_[_loc9_])).replace(REGEXP_OUTER_SPACES, "")).search("//")) != -1) {
                _loc11_ = _loc11_.slice(0, _loc12_);
            }
            if ((_loc13_ = _loc11_.search(/<.*>/g)) != -1) {
                _loc14_ = _loc11_.slice(_loc13_).match(/([\w\.\-\+]+)/gi);
                _loc11_ = _loc11_.slice(0, _loc13_);
            }
            if (!(_loc15_ = _loc11_.match(/^\w{3}/ig))) {
                if (_loc11_.length >= 3) {
                }
            } else {
                _loc16_ = OPMAP[_loc15_[0]];
                if (this.debugEnabled) {
                }
                if (_loc16_ == null) {
                    if (_loc11_.length >= 3) {
                    }
                } else {
                    _loc11_ = _loc11_.slice(_loc11_.search(_loc16_.name) + _loc16_.name.length);
                    if (Boolean(_loc16_.flags & OP_VERSION2) && param3 < 2) {
                        this._error = "error: opcode requires version 2.";
                        break;
                    }
                    if (Boolean(_loc16_.flags & OP_VERT_ONLY) && _loc6_) {
                        this._error = "error: opcode is only allowed in vertex programs.";
                        break;
                    }
                    if (Boolean(_loc16_.flags & OP_FRAG_ONLY) && !_loc6_) {
                        this._error = "error: opcode is only allowed in fragment programs.";
                        break;
                    }
                    if (this.verbose) {
                    }
                    this.agalcode.writeUnsignedInt(_loc16_.emitCode);
                    _loc8_++;
                    if (_loc8_ > MAX_OPCODES) {
                        this._error = "error: too many opcodes. maximum is " + MAX_OPCODES + ".";
                        break;
                    }
                    if (!(_loc17_ = _loc11_.match(/vc\[([vof][acostdip]?)(\d*)?(\.[xyzw](\+\d{1,3})?)?\](\.[xyzw]{1,4})?|([vof][acostdip]?)(\d*)?(\.[xyzw]{1,4})?/gi)) || _loc17_.length != _loc16_.numRegister) {
                        this._error = "error: wrong number of operands. found " + _loc17_.length + " but expected " + _loc16_.numRegister + ".";
                        break;
                    }
                    _loc18_ = false;
                    _loc19_ = 160;
                    _loc20_ = _loc17_.length;
                    _loc21_ = 0;
                    while (_loc21_ < _loc20_) {
                        _loc22_ = false;
                        if ((Boolean(_loc23_ = _loc17_[_loc21_].match(/\[.*\]/ig))) && _loc23_.length > 0) {
                            _loc17_[_loc21_] = _loc17_[_loc21_].replace(_loc23_[0], "0");
                            if (this.verbose) {
                            }
                            _loc22_ = true;
                        }
                        if (!(_loc24_ = _loc17_[_loc21_].match(/^\b[A-Za-z]{1,2}/ig))) {
                            this._error = "error: could not parse operand " + _loc21_ + " (" + _loc17_[_loc21_] + ").";
                            _loc18_ = true;
                            break;
                        }
                        _loc25_ = REGMAP[_loc24_[0]];
                        if (this.debugEnabled) {
                        }
                        if (_loc25_ == null) {
                            this._error = "error: could not find register name for operand " + _loc21_ + " (" + _loc17_[_loc21_] + ").";
                            _loc18_ = true;
                            break;
                        }
                        if (_loc6_) {
                            if (!(_loc25_.flags & REG_FRAG)) {
                                this._error = "error: register operand " + _loc21_ + " (" + _loc17_[_loc21_] + ") only allowed in vertex programs.";
                                _loc18_ = true;
                                break;
                            }
                            if (_loc22_) {
                                this._error = "error: register operand " + _loc21_ + " (" + _loc17_[_loc21_] + ") relative adressing not allowed in fragment programs.";
                                _loc18_ = true;
                                break;
                            }
                        } else if (!(_loc25_.flags & REG_VERT)) {
                            this._error = "error: register operand " + _loc21_ + " (" + _loc17_[_loc21_] + ") only allowed in fragment programs.";
                            _loc18_ = true;
                            break;
                        }
                        _loc17_[_loc21_] = _loc17_[_loc21_].slice(_loc17_[_loc21_].search(_loc25_.name) + _loc25_.name.length);
                        _loc26_ = _loc22_ ? _loc23_[0].match(/\d+/) : _loc17_[_loc21_].match(/\d+/);
                        _loc27_ = 0;
                        if (_loc26_) {
                            _loc27_ = uint(_loc26_[0]);
                        }
                        if (_loc25_.range < _loc27_) {
                            this._error = "error: register operand " + _loc21_ + " (" + _loc17_[_loc21_] + ") index exceeds limit of " + (_loc25_.range + 1) + ".";
                            _loc18_ = true;
                            break;
                        }
                        _loc28_ = 0;
                        _loc29_ = _loc17_[_loc21_].match(/(\.[xyzw]{1,4})/);
                        _loc30_ = _loc21_ == 0 && !(_loc16_.flags & OP_NO_DEST);
                        _loc31_ = _loc21_ == 2 && Boolean(_loc16_.flags & OP_SPECIAL_TEX);
                        _loc32_ = 0;
                        _loc33_ = 0;
                        _loc34_ = 0;
                        if (_loc30_ && _loc22_) {
                            this._error = "error: relative can not be destination";
                            _loc18_ = true;
                            break;
                        }
                        if (_loc29_) {
                            _loc28_ = 0;
                            _loc36_ = uint(_loc29_[0].length);
                            _loc37_ = 1;
                            while (_loc37_ < _loc36_) {
                                if ((_loc35_ = Number(_loc29_[0].charCodeAt(_loc37_)) - "x".charCodeAt(0)) > 2) {
                                    _loc35_ = 3;
                                }
                                if (_loc30_) {
                                    _loc28_ |= 1 << _loc35_;
                                } else {
                                    _loc28_ |= _loc35_ << (_loc37_ - 1 << 1);
                                }
                                _loc37_++;
                            }
                            if (!_loc30_) {
                                while (_loc37_ <= 4) {
                                    _loc28_ |= _loc35_ << (_loc37_ - 1 << 1);
                                    _loc37_++;
                                }
                            }
                        } else {
                            _loc28_ = _loc30_ ? 15 : 228;
                        }
                        if (_loc22_) {
                            _loc38_ = _loc23_[0].match(/[A-Za-z]{1,2}/ig);
                            if ((_loc39_ = REGMAP[_loc38_[0]]) == null) {
                                this._error = "error: bad index register";
                                _loc18_ = true;
                                break;
                            }
                            _loc32_ = _loc39_.emitCode;
                            if ((_loc40_ = _loc23_[0].match(/(\.[xyzw]{1,1})/)).length == 0) {
                                this._error = "error: bad index register select";
                                _loc18_ = true;
                                break;
                            }
                            if ((_loc33_ = Number(_loc40_[0].charCodeAt(1)) - "x".charCodeAt(0)) > 2) {
                                _loc33_ = 3;
                            }
                            if ((_loc41_ = _loc23_[0].match(/\+\d{1,3}/ig)).length > 0) {
                                _loc34_ = int(_loc41_[0]);
                            }
                            if (_loc34_ < 0 || _loc34_ > 255) {
                                this._error = "error: index offset " + _loc34_ + " out of bounds. [0..255]";
                                _loc18_ = true;
                                break;
                            }
                            if (this.verbose) {
                            }
                        }
                        if (this.verbose) {
                        }
                        if (_loc30_) {
                            this.agalcode.writeShort(_loc27_);
                            this.agalcode.writeByte(_loc28_);
                            this.agalcode.writeByte(_loc25_.emitCode);
                            _loc19_ -= 32;
                        } else if (_loc31_) {
                            if (this.verbose) {
                            }
                            _loc42_ = 5;
                            _loc43_ = _loc14_ == null ? 0 : _loc14_.length;
                            _loc44_ = 0;
                            _loc37_ = 0;
                            while (_loc37_ < _loc43_) {
                                if (this.verbose) {
                                }
                                if ((_loc45_ = SAMPLEMAP[_loc14_[_loc37_]]) == null) {
                                    _loc44_ = Number(_loc14_[_loc37_]);
                                    if (this.verbose) {
                                    }
                                } else {
                                    if (_loc45_.flag != SAMPLER_SPECIAL_SHIFT) {
                                        _loc42_ &= ~(15 << _loc45_.flag);
                                    }
                                    _loc42_ |= uint(_loc45_.mask) << uint(_loc45_.flag);
                                }
                                _loc37_++;
                            }
                            this.agalcode.writeShort(_loc27_);
                            this.agalcode.writeByte(int(_loc44_ * 8));
                            this.agalcode.writeByte(0);
                            this.agalcode.writeUnsignedInt(_loc42_);
                            if (this.verbose) {
                            }
                            _loc19_ -= 64;
                        } else {
                            if (_loc21_ == 0) {
                                this.agalcode.writeUnsignedInt(0);
                                _loc19_ -= 32;
                            }
                            this.agalcode.writeShort(_loc27_);
                            this.agalcode.writeByte(_loc34_);
                            this.agalcode.writeByte(_loc28_);
                            this.agalcode.writeByte(_loc25_.emitCode);
                            this.agalcode.writeByte(_loc32_);
                            this.agalcode.writeShort(_loc22_ ? _loc33_ | 32768 : 0);
                            _loc19_ -= 64;
                        }
                        _loc21_++;
                    }
                    _loc21_ = 0;
                    while (_loc21_ < _loc19_) {
                        this.agalcode.writeByte(0);
                        _loc21_ += 8;
                    }
                    if (_loc18_) {
                        break;
                    }
                }
            }
            _loc9_++;
        }
        if (this._error != "") {
            this._error += "\n  at line " + _loc9_ + " " + _loc7_[_loc9_];
            this.agalcode.length = 0;
        }
        if (this.debugEnabled) {
            _loc46_ = "generated bytecode:";
            _loc47_ = this.agalcode.length;
            _loc48_ = 0;
            while (_loc48_ < _loc47_) {
                if (!(_loc48_ % 16)) {
                    _loc46_ += "\n";
                }
                if (!(_loc48_ % 4)) {
                    _loc46_ += " ";
                }
                if ((_loc49_ = this.agalcode[_loc48_].toString(16)).length < 2) {
                    _loc49_ = "0" + _loc49_;
                }
                _loc46_ += _loc49_;
                _loc48_++;
            }
        }
        if (this.verbose) {
        }
        return this.agalcode;
    }

    private function initregmap(param1: uint, param2: Boolean): void {
        REGMAP[VA] = new Register(VA, "vertex attribute", 0, param2 ? 1024 : 7, REG_VERT | REG_READ);
        REGMAP[VC] = new Register(VC, "vertex constant", 1, param2 ? 1024 : (param1 == 1 ? 127 : 250), REG_VERT | REG_READ);
        REGMAP[VT] = new Register(VT, "vertex temporary", 2, param2 ? 1024 : (param1 == 1 ? 7 : 27), REG_VERT | REG_WRITE | REG_READ);
        REGMAP[VO] = new Register(VO, "vertex output", 3, param2 ? 1024 : 0, REG_VERT | REG_WRITE);
        REGMAP[VI] = new Register(VI, "varying", 4, param2 ? 1024 : (param1 == 1 ? 7 : 11), REG_VERT | REG_FRAG | REG_READ | REG_WRITE);
        REGMAP[FC] = new Register(FC, "fragment constant", 1, param2 ? 1024 : (param1 == 1 ? 27 : 63), REG_FRAG | REG_READ);
        REGMAP[FT] = new Register(FT, "fragment temporary", 2, param2 ? 1024 : (param1 == 1 ? 7 : 27), REG_FRAG | REG_WRITE | REG_READ);
        REGMAP[FS] = new Register(FS, "texture sampler", 5, param2 ? 1024 : 7, REG_FRAG | REG_READ);
        REGMAP[FO] = new Register(FO, "fragment output", 3, param2 ? 1024 : (param1 == 1 ? 0 : 3), REG_FRAG | REG_WRITE);
        REGMAP[FD] = new Register(FD, "fragment depth output", 6, param2 ? 1024 : (param1 == 1 ? 4294967295 : 0), REG_FRAG | REG_WRITE);
        REGMAP["op"] = REGMAP[VO];
        REGMAP["i"] = REGMAP[VI];
        REGMAP["v"] = REGMAP[VI];
        REGMAP["oc"] = REGMAP[FO];
        REGMAP["od"] = REGMAP[FD];
        REGMAP["fi"] = REGMAP[VI];
    }
}
}

class OpCode {


    private var _emitCode: uint;

    private var _flags: uint;

    private var _name: String;

    private var _numRegister: uint;

    function OpCode(param1: String, param2: uint, param3: uint, param4: uint) {
        super();
        this._name = param1;
        this._numRegister = param2;
        this._emitCode = param3;
        this._flags = param4;
    }

    public function get emitCode(): uint {
        return this._emitCode;
    }

    public function get flags(): uint {
        return this._flags;
    }

    public function get name(): String {
        return this._name;
    }

    public function get numRegister(): uint {
        return this._numRegister;
    }

    public function toString(): String {
        return "[OpCode name=\"" + this._name + "\", numRegister=" + this._numRegister + ", emitCode=" + this._emitCode + ", flags=" + this._flags + "]";
    }
}

class Register {


    private var _emitCode: uint;

    private var _name: String;

    private var _longName: String;

    private var _flags: uint;

    private var _range: uint;

    function Register(param1: String, param2: String, param3: uint, param4: uint, param5: uint) {
        super();
        this._name = param1;
        this._longName = param2;
        this._emitCode = param3;
        this._range = param4;
        this._flags = param5;
    }

    public function get emitCode(): uint {
        return this._emitCode;
    }

    public function get longName(): String {
        return this._longName;
    }

    public function get name(): String {
        return this._name;
    }

    public function get flags(): uint {
        return this._flags;
    }

    public function get range(): uint {
        return this._range;
    }

    public function toString(): String {
        return "[Register name=\"" + this._name + "\", longName=\"" + this._longName + "\", emitCode=" + this._emitCode + ", range=" + this._range + ", flags=" + this._flags + "]";
    }
}

class Sampler {


    private var _flag: uint;

    private var _mask: uint;

    private var _name: String;

    function Sampler(param1: String, param2: uint, param3: uint) {
        super();
        this._name = param1;
        this._flag = param2;
        this._mask = param3;
    }

    public function get flag(): uint {
        return this._flag;
    }

    public function get mask(): uint {
        return this._mask;
    }

    public function get name(): String {
        return this._name;
    }

    public function toString(): String {
        return "[Sampler name=\"" + this._name + "\", flag=\"" + this._flag + "\", mask=" + this.mask + "]";
    }
}
