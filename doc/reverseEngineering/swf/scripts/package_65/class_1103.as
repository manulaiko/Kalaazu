package package_65 {

import com.bigpoint.utils.class_122;

import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.events.MouseEvent;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_18;

import package_11.class_39;

import package_26.class_94;

import package_9.ResourceManager;

public class class_1103 extends Sprite {

    public static const const_833: int = 15;

    public static const const_2234: int = 15;

    public static const const_2446: String = "sizeChanged";


    public var quest: class_203;

    private var var_1240: TextField;

    private var var_4989: MovieClip;

    private var var_2607: uint;

    private var var_3442: uint;

    private var var_4006: uint;

    private var var_3935: int;

    private var var_17: int;

    private var var_137: Array;

    private var var_4747: Array;

    private var var_3998: Array;

    private var var_198: Array;

    private var var_3231: Number;

    private var var_3386: MovieClip;

    private var var_3473: Sprite;

    private var var_989: class_39;

    private var var_3052: class_39;

    public function class_1103() {
        this.var_137 = [];
        this.var_4747 = [];
        this.var_3998 = [];
        this.var_198 = [];
        super();
        this.method_4397();
        this.method_2024();
        this.var_989 = class_39(ResourceManager.name_15.getFinisher("questSystem"));
        this.var_3052 = class_39(ResourceManager.name_15.getFinisher("icons"));
    }

    private function method_2024(): void {
        var _loc2_: * = null;
        this.var_3386 = new MovieClip();
        var _loc1_: TextFormat = new TextFormat(class_18.const_2843.font, class_18.const_2843.size, 15327936);
        _loc2_ = new TextField();
        _loc2_.defaultTextFormat = _loc1_;
        _loc2_.embedFonts = class_18.var_5039;
        _loc2_.antiAliasType = AntiAliasType.ADVANCED;
        _loc2_.mouseEnabled = true;
        _loc2_.selectable = false;
        _loc2_.multiline = true;
        _loc2_.wordWrap = true;
        _loc2_.autoSize = TextFieldAutoSize.LEFT;
        _loc2_.width = 164;
        _loc2_.x = 8;
        _loc2_.y = 8;
        _loc2_.text = class_88.getItem("msg_no_quest_running");
        this.var_3386.addChild(_loc2_);
        var _loc3_: TextField = new TextField();
        _loc3_.defaultTextFormat = _loc1_;
        _loc3_.embedFonts = class_18.var_5039;
        _loc3_.antiAliasType = AntiAliasType.ADVANCED;
        _loc3_.mouseEnabled = false;
        _loc3_.selectable = false;
        _loc3_.multiline = true;
        _loc3_.wordWrap = true;
        _loc3_.autoSize = TextFieldAutoSize.LEFT;
        _loc3_.width = _loc2_.width;
        _loc3_.x = _loc2_.x;
        _loc3_.y = _loc2_.y + _loc2_.height + 8;
        _loc3_.text = class_88.getItem("msg_maybe_quest_at_nyx");
        this.var_3386.addChild(_loc3_);
    }

    public function set isDefaultVisible(param1: Boolean): void {
        if (param1 && !contains(this.var_3386)) {
            addChild(this.var_3386);
            dispatchEvent(new Event(const_2446, true));
        } else if (!param1 && Boolean(contains(this.var_3386))) {
            removeChild(this.var_3386);
        }
    }

    public function get isDefaultVisible(): Boolean {
        return contains(this.var_3386);
    }

    public function get method_2172(): Boolean {
        return this.quest.type.method_6399(class_1096.const_1484);
    }

    public function method_6137(param1: String): void {
        this.method_6004();
        this.var_1240.text = param1;
    }

    public function method_1322(): void {
        var _loc1_: Boolean = false;
        if (this.var_4989.contains(this.var_1240)) {
            _loc1_ = Boolean(class_122.method_2867(this.quest.title, this.var_1240));
            if (_loc1_) {
                class_94.getInstance().method_1211(this.var_1240, this.quest.title);
            }
        }
    }

    public function clearContent(): void {
        if (this.var_4989 != null) {
            if (contains(this.var_4989)) {
                removeChild(this.var_4989);
            }
        }
        this.var_137 = [];
        this.var_4747 = [];
        this.var_3998 = [];
        this.var_3231 = 4;
        this.var_17 = 4;
        this.var_4989 = new MovieClip();
        addChild(this.var_4989);
    }

    public function method_2655(param1: int, param2: Boolean): void {
        var _loc4_: * = null;
        var _loc5_: Boolean = false;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc3_: class_1570 = class_1570(this.var_137[param1]);
        if (_loc3_) {
            _loc4_ = class_236(_loc3_.method_6482);
            _loc3_.method_2557.text = _loc4_.method_1303 + _loc4_.name_94;
            _loc3_.updateLayout();
            if (_loc4_.runstate != _loc3_.runstate || _loc4_.completed != _loc3_.completed || param2) {
                _loc5_ = true;
                if (_loc4_.runstate) {
                    _loc3_.method_5828.state = class_1571.const_2746;
                    _loc3_.method_455.textColor = this.var_2607;
                } else {
                    if (_loc4_.completed) {
                        _loc3_.method_5828.state = class_1571.const_1713;
                        _loc3_.method_455.textColor = this.var_3442;
                    } else {
                        _loc3_.method_5828.state = class_1571.const_1744;
                        _loc3_.method_455.textColor = this.var_4006;
                    }
                    _loc3_.completed = _loc4_.completed;
                }
                _loc3_.method_2557.textColor = _loc3_.method_455.textColor;
                _loc3_.method_2557.text = _loc4_.method_1303 + _loc4_.name_94;
                _loc3_.method_455.text = _loc4_.description;
                if (_loc4_.children.length > 0) {
                    _loc6_ = 0;
                    while (_loc6_ < _loc4_.children.length) {
                        _loc7_ = class_236(_loc4_.children[_loc6_]);
                        this.method_2655(_loc7_.id, param2);
                        _loc6_++;
                    }
                }
            }
        }
        if (_loc5_) {
            this.method_1707();
        }
    }

    public function setSize(param1: int, param2: int): void {
    }

    private function method_4397(): void {
        this.var_2607 = 15327936;
        this.var_3442 = 8969608;
        this.var_4006 = 12169872;
    }

    public function update(param1: Boolean = true): void {
        this.clearContent();
        if (param1) {
            this.method_6004();
        }
        this.var_3231 += !!this.var_1240 ? this.var_1240.height : 3;
        this.var_3935 = this.var_3231;
        this.method_6110(this.quest.method_2963(), 0, true);
        this.isDefaultVisible = false;
    }

    private function method_6004(): void {
        var _loc1_: TextFormat = new TextFormat(class_18.const_2843.font, class_18.const_2843.size, 15327936);
        this.var_1240 = new TextField();
        this.var_1240.defaultTextFormat = _loc1_;
        this.var_1240.embedFonts = class_18.var_5039;
        this.var_1240.antiAliasType = AntiAliasType.ADVANCED;
        this.var_1240.mouseEnabled = true;
        this.var_1240.selectable = false;
        this.var_1240.width = 200;
        this.var_4989.addChild(this.var_1240);
        if (this.quest.title == "") {
            this.var_1240.text = "";
        } else {
            this.method_1322();
        }
        this.var_1240.height = 18;
        this.var_1240.y = this.var_3231;
    }

    private function method_6110(param1: class_1093, param2: int, param3: Boolean = false): class_1570 {
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: int = 0;
        var _loc12_: * = null;
        var _loc4_: class_1570;
        (_loc4_ = new class_1570(class_1567.const_1706)).completed = param1.completed;
        _loc4_.runstate = param1.active;
        var _loc5_: int = 0;
        var _loc6_: String = "";
        if (param1.ordered) {
            _loc5_ = 4;
            _loc7_ = this.method_2808();
            (_loc8_ = this.method_4339(class_1567.const_1706)).id = param1.id;
            _loc4_.method_4941(_loc7_, _loc8_);
            _loc4_.method_6482 = param1;
            _loc4_.method_4785 = param1.method_3882;
            this.var_4989.addChild(_loc7_);
            _loc9_ = _loc8_ as DisplayObject;
            _loc7_.x = param2;
            _loc7_.y = this.var_3935;
            if (_loc9_) {
                this.var_4989.addChild(_loc9_);
                _loc9_.x = _loc7_.x;
                _loc9_.y = _loc7_.y + 4;
            }
            _loc8_.selected = !param1.method_3882;
            (_loc10_ = TextField(_loc7_.getChildByName("txtLabel"))).x = 11;
            _loc10_.autoSize = TextFieldAutoSize.LEFT;
            _loc10_.multiline = true;
            _loc10_.width = 128;
            _loc10_.antiAliasType = AntiAliasType.ADVANCED;
            _loc10_.mouseEnabled = false;
            _loc10_.selectable = false;
            if (param1.active) {
                _loc8_.state = class_1571.const_2746;
                _loc10_.textColor = this.var_2607;
            } else {
                _loc8_.state = class_1571.const_1744;
                if (param1.completed) {
                    _loc8_.state = class_1571.const_1713;
                    _loc10_.textColor = this.var_3442;
                } else {
                    _loc8_.state = class_1571.const_1744;
                    _loc10_.textColor = this.var_4006;
                }
            }
            _loc10_.text = class_88.getItem("q2_condition_CASE_sequence");
            this.var_3935 += _loc7_.height;
            this.var_4747[param1.id] = _loc4_;
            this.var_3998.push(_loc4_);
        } else if (param1.method_3320 != param1.method_1918) {
            _loc5_ = 4;
            _loc7_ = this.method_2808();
            (_loc8_ = this.method_4339(class_1567.const_1706)).id = param1.id;
            _loc4_.method_4941(_loc7_, _loc8_);
            _loc4_.method_6482 = param1;
            _loc4_.method_4785 = param1.method_3882;
            this.var_4747[param1.id] = _loc4_;
            this.var_3998.push(_loc4_);
            this.var_4989.addChild(_loc7_);
            _loc7_.x = param2;
            _loc7_.y = this.var_3935;
            if (_loc9_ = _loc8_ as DisplayObject) {
                this.var_4989.addChild(_loc9_);
                _loc9_.x = _loc7_.x;
                _loc9_.y = _loc7_.y + 4;
            }
            _loc8_.selected = !param1.method_3882;
            (_loc10_ = TextField(_loc7_.getChildByName("txtLabel"))).x = 11;
            _loc10_.autoSize = TextFieldAutoSize.LEFT;
            _loc10_.multiline = true;
            _loc10_.width = 128;
            _loc10_.antiAliasType = AntiAliasType.ADVANCED;
            _loc10_.mouseEnabled = false;
            _loc10_.selectable = false;
            if (param1.active) {
                _loc8_.state = class_1571.const_2746;
                _loc10_.textColor = this.var_2607;
            } else {
                _loc8_.state = class_1571.const_1744;
                if (param1.completed) {
                    _loc8_.state = class_1571.const_1713;
                    _loc10_.textColor = this.var_3442;
                } else {
                    _loc8_.state = class_1571.const_1744;
                    _loc10_.textColor = this.var_4006;
                }
            }
            _loc6_ = (_loc6_ = class_88.getItem("q2_condition_CASE_mandatory")).replace(/%count%/, param1.method_1918);
            _loc10_.text = _loc6_;
            this.var_3935 += _loc7_.height;
        }
        _loc4_.visible = param3;
        if (param3 && !param1.method_3882) {
            param3 = false;
        }
        if (param1.children.length > 0) {
            _loc11_ = 0;
            while (_loc11_ < param1.children.length) {
                if (param1.children[_loc11_] is class_1092) {
                    _loc12_ = this.method_6110(param1.children[_loc11_], param2 + _loc5_, param3);
                } else {
                    _loc12_ = this.method_1208(param1.children[_loc11_], param2 + _loc5_, _loc11_ + 1);
                    this.method_2699(_loc12_, param3);
                }
                if (!param1.method_3882 || !param3) {
                    this.var_3935 -= _loc12_.method_2247.height;
                }
                _loc11_++;
            }
            if (_loc9_) {
                _loc9_.addEventListener(MouseEvent.CLICK, this.method_3181);
            }
        }
        return _loc4_;
    }

    private function method_189(): class_1568 {
        return new class_1569();
    }

    private function method_1208(param1: class_236, param2: int, param3: int): class_1570 {
        var _loc5_: * = null;
        var _loc11_: int = 0;
        var _loc12_: * = null;
        var _loc4_: MovieClip = this.method_2808();
        if (param1.children.length > 0) {
            (_loc5_ = this.method_4339(class_1567.const_2473)).id = param1.id;
            _loc5_.selected = !param1.method_3882;
        } else {
            (_loc5_ = this.method_4641(param1)).number = param3;
        }
        var _loc6_: MovieClip = this.method_2808();
        var _loc7_: DisplayObject = param1.method_937;
        var _loc8_: class_1570;
        (_loc8_ = new class_1570(class_1567.const_2473)).method_4941(_loc4_, _loc5_, _loc6_, _loc7_);
        _loc8_.method_6482 = param1;
        _loc8_.method_4785 = param1.method_3882;
        _loc8_.completed = param1.completed;
        _loc8_.runstate = param1.runstate;
        this.var_137[param1.id] = _loc8_;
        this.var_3998.push(_loc8_);
        this.var_4989.addChild(_loc4_);
        if (_loc5_ is DisplayObject) {
            this.var_4989.addChild(_loc5_ as DisplayObject);
        }
        this.var_198[param1.id] = _loc6_;
        this.var_4989.addChild(_loc6_);
        _loc4_.x = param2;
        _loc4_.y = this.var_3935;
        DisplayObject(_loc5_).x = _loc4_.x;
        DisplayObject(_loc5_).y = _loc4_.y + 4;
        _loc6_.x = 250;
        _loc6_.y = _loc4_.y;
        var _loc9_: TextField;
        (_loc9_ = TextField(_loc4_.getChildByName("txtLabel"))).x = 11;
        _loc9_.wordWrap = true;
        _loc9_.multiline = true;
        _loc9_.autoSize = TextFieldAutoSize.LEFT;
        _loc9_.antiAliasType = AntiAliasType.ADVANCED;
        _loc9_.mouseEnabled = false;
        _loc9_.selectable = false;
        _loc9_.text = param1.description;
        var _loc10_: TextField;
        (_loc10_ = TextField(_loc6_.getChildByName("txtLabel"))).x = -100;
        _loc10_.autoSize = TextFieldAutoSize.RIGHT;
        _loc10_.antiAliasType = AntiAliasType.ADVANCED;
        _loc10_.mouseEnabled = false;
        _loc10_.selectable = false;
        _loc10_.text = param1.method_1303 + param1.name_94;
        if (_loc7_) {
            _loc7_.x = _loc6_.x - _loc10_.width - _loc7_.width - Number(const_833);
            _loc7_.y = _loc9_.y - _loc7_.height * 0.5 + _loc9_.height * 0.5;
            _loc9_.width = _loc7_.x - _loc4_.x - Number(const_2234);
            this.var_4989.addChild(_loc7_);
        } else {
            _loc9_.width = _loc6_.x - _loc10_.width - _loc4_.x - _loc9_.x - Number(const_2234);
        }
        if (param1.runstate) {
            _loc5_.state = class_1571.const_2746;
            _loc9_.textColor = this.var_2607;
        } else if (param1.completed) {
            _loc5_.state = class_1571.const_1713;
            _loc9_.textColor = this.var_3442;
        } else {
            _loc5_.state = class_1571.const_1744;
            _loc9_.textColor = this.var_4006;
        }
        _loc10_.textColor = _loc9_.textColor;
        this.var_3935 += _loc4_.height;
        if (param1.children.length > 0) {
            _loc11_ = 0;
            while (_loc11_ < param1.children.length) {
                if (param1.children[_loc11_] != null) {
                    _loc12_ = this.method_1208(param1.children[_loc11_], param2 + 4, _loc11_ + 1);
                    this.method_2699(_loc12_, param1.method_3882);
                    if (!param1.method_3882) {
                        this.var_3935 -= _loc12_.method_2247.height;
                    }
                }
                _loc11_++;
            }
            (_loc5_ as IEventDispatcher).addEventListener(MouseEvent.CLICK, this.method_3045);
        }
        return _loc8_;
    }

    private function method_3045(param1: MouseEvent): void {
        var _loc2_: class_1568 = class_1568(param1.target);
        var _loc3_: class_1570 = class_1570(this.var_137[_loc2_.id]);
        _loc3_.method_5828.selected = _loc3_.method_4785;
        _loc3_.method_4785 = !_loc3_.method_4785;
        _loc3_.method_6482.method_3882 = _loc3_.method_4785;
        var _loc4_: class_236 = class_236(_loc3_.method_6482);
        this.method_2504(_loc4_.children, Boolean(_loc3_.method_4785) && Boolean(_loc4_.method_3882));
        this.method_1707();
    }

    private function method_2699(param1: class_1570, param2: Boolean): void {
        param1.visible = param2;
    }

    private function method_2504(param1: Array, param2: Boolean): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        for (_loc6_ in param1) {
            if (param1[_loc6_] is class_236) {
                _loc3_ = param1[_loc6_];
                _loc4_ = null;
            } else if (param1[_loc6_] is class_1092) {
                _loc3_ = null;
                _loc4_ = param1[_loc6_];
            }
            if (_loc3_ != null && this.var_137[_loc3_.id] != null) {
                _loc5_ = this.var_137[_loc3_.id];
                this.method_2699(_loc5_, param2);
            }
            if (_loc4_ != null && this.var_4747[_loc4_.id] != null) {
                (_loc5_ = class_1570(this.var_4747[_loc4_.id])).visible = param2;
                this.method_2504(_loc4_.children, param2 && Boolean(_loc5_.method_4785));
            }
        }
    }

    private function method_3181(param1: MouseEvent): void {
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc2_: class_1568 = class_1568(param1.target);
        var _loc3_: class_1570 = class_1570(this.var_4747[_loc2_.id]);
        var _loc4_: class_1093 = class_1093(_loc3_.method_6482);
        _loc3_.method_5828.selected = _loc3_.method_4785;
        _loc3_.method_4785 = !_loc3_.method_4785;
        _loc3_.method_6482.method_3882 = _loc3_.method_4785;
        var _loc5_: Array = _loc4_.children;
        for (_loc6_ in _loc5_) {
            if (_loc5_[_loc6_] is class_1092) {
                _loc7_ = class_1093(_loc5_[_loc6_]);
                if (this.var_4747[_loc7_.id] is class_1570) {
                    class_1570(this.var_4747[_loc7_.id]).visible = _loc3_.method_4785;
                }
                this.method_2504(_loc7_.children, Boolean(_loc3_.method_4785) && Boolean(_loc7_.method_3882));
            } else {
                _loc8_ = class_236(_loc5_[_loc6_]);
                if (this.var_137[_loc8_.id] is class_1570) {
                    class_1570(this.var_137[_loc8_.id]).visible = _loc3_.method_4785;
                }
                this.method_2504(_loc8_.children, Boolean(_loc3_.method_4785) && Boolean(_loc8_.method_3882));
            }
        }
        this.method_1707();
    }

    public function method_1707(): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        this.var_3935 = this.var_3231;
        var _loc1_: int = 0;
        while (_loc1_ < this.var_3998.length) {
            _loc2_ = this.var_3998[_loc1_] as class_1570;
            if (_loc2_.visible) {
                if (_loc2_.method_3572 != null) {
                    _loc2_.method_3572.y = this.var_3935;
                    _loc2_.method_2247.y = this.var_3935 + Number(_loc2_.method_3572.height) * 0.5 - Number(_loc2_.method_2247.height) * 0.5;
                } else {
                    _loc2_.method_2247.y = this.var_3935;
                }
                _loc3_ = _loc2_.method_5828 as DisplayObject;
                if (_loc3_) {
                    _loc3_.y = _loc2_.method_2247.y;
                }
                if (_loc2_.method_46 != null) {
                    _loc2_.method_46.y = _loc2_.method_2247.y;
                }
                this.var_3935 += Math.max(_loc2_.method_2247.height, !!_loc2_.method_3572 ? Number(_loc2_.method_3572.height) : 0);
            }
            _loc1_++;
        }
        dispatchEvent(new Event(const_2446, true));
    }

    private function method_4641(param1: class_236): class_1571 {
        var _loc2_: * = null;
        if (!param1.method_1547) {
            _loc2_ = "failable_subcon";
        } else if (param1.children.length > 0) {
            _loc2_ = "casecon_open";
        } else if (param1.method_4201()) {
            _loc2_ = "subcondition";
        } else {
            _loc2_ = "condition";
        }
        return this.method_1718(_loc2_);
    }

    private function method_2808(): MovieClip {
        var _loc1_: MovieClip = new MovieClip();
        var _loc2_: TextField = new TextField();
        _loc2_.name = "txtLabel";
        var _loc3_: TextFormat = class_18.const_2667;
        _loc3_.align = TextFormatAlign.LEFT;
        _loc2_.defaultTextFormat = _loc3_;
        _loc2_.embedFonts = class_18.var_4694;
        _loc1_.addChild(_loc2_);
        return _loc1_;
    }

    private function method_4339(param1: int = 1): class_1572 {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc4_: String = "casecon_open";
        _loc5_ = this.var_989.getEmbeddedBitmapData(_loc4_ + "_running.gif");
        _loc6_ = this.var_989.getEmbeddedBitmapData(_loc4_ + "_upcoming.gif");
        _loc7_ = this.var_989.getEmbeddedBitmapData(_loc4_ + "_completed.gif");
        var _loc8_: class_1572;
        (_loc8_ = new class_1572()).init(_loc5_, _loc6_, _loc7_);
        _loc4_ = "casecon_closed";
        _loc5_ = this.var_989.getEmbeddedBitmapData(_loc4_ + "_running.gif");
        _loc6_ = this.var_989.getEmbeddedBitmapData(_loc4_ + "_upcoming.gif");
        _loc7_ = this.var_989.getEmbeddedBitmapData(_loc4_ + "_completed.gif");
        _loc8_.method_3332(_loc5_, _loc6_, _loc7_);
        return _loc8_;
    }

    private function method_1718(param1: String): class_1571 {
        var _loc2_: BitmapData = this.var_989.getEmbeddedBitmapData(param1 + "_running.gif");
        var _loc3_: BitmapData = this.var_989.getEmbeddedBitmapData(param1 + "_upcoming.gif");
        var _loc4_: BitmapData = this.var_989.getEmbeddedBitmapData(param1 + "_completed.gif");
        var _loc5_: class_1571;
        (_loc5_ = new class_1571()).init(_loc2_, _loc3_, _loc4_);
        _loc5_.state = class_1571.const_2746;
        return _loc5_;
    }

    public function get method_2789(): int {
        return this.var_3935;
    }
}
}
