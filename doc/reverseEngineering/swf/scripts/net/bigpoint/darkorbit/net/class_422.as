package net.bigpoint.darkorbit.net {

import com.bigpoint.utils.class_122;

import flash.display.Bitmap;
import flash.display.InteractiveObject;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.as3toolbox.filecollection.class_66;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.gui.BitmapFont;
import net.bigpoint.darkorbit.settings.Settings;

import package_11.class_39;

import package_112.class_1491;
import package_112.class_1492;

import package_138.class_421;

import package_182.class_1105;
import package_182.class_1106;
import package_182.class_1107;
import package_182.class_1490;

import package_19.class_68;
import package_19.class_70;

import package_22.class_1083;
import package_22.class_198;
import package_22.class_414;

import package_26.class_333;
import package_26.class_94;

import package_27.class_82;

import package_30.class_91;

import package_33.class_93;

import package_37.ICommand;

import package_38.class_415;
import package_38.class_424;
import package_38.class_933;

import package_39.class_1052;

import package_46.class_131;

import package_70.SimpleWindowEvent;

import package_76.class_215;

import package_9.ResourceManager;

public class class_422 {


    private const const_991: String = "ore";

    private const const_1917: String = "npc";

    public const const_694: class_68 = new class_70();

    public const const_3200: class_68 = new class_70(int, Bitmap);

    public const const_873: class_68 = new class_70(ICommand);

    private var var_841: class_131;

    private var var_3171: Array;

    private var var_12: class_53;

    public function class_422(param1: class_53, param2: class_131) {
        this.var_3171 = new Array();
        super();
        this.var_841 = param2;
        this.var_12 = param1;
    }

    public function init(param1: Boolean, param2: Boolean): void {
        var _loc3_: class_93 = this.method_1413();
        if (!_loc3_.method_89(class_91.const_2029).getChildAt(0).hasEventListener(MouseEvent.CLICK)) {
            _loc3_.method_89(class_91.const_2514).getChildAt(0).addEventListener(MouseEvent.CLICK, this.method_6334);
            _loc3_.method_89(class_91.const_2029).getChildAt(0).addEventListener(MouseEvent.CLICK, this.method_2779);
            _loc3_.method_89(class_91.const_844).getChildAt(0).addEventListener(MouseEvent.CLICK, this.method_4382);
            _loc3_.method_89(class_91.const_2327).getChildAt(0).addEventListener(MouseEvent.CLICK, this.method_5859);
            this.var_841.addEventListener(SimpleWindowEvent.const_2430, this.method_1316);
        }
        if (!param1) {
            this.method_6367();
        }
        if (param2) {
            this.method_5978(true);
        }
        _loc3_.visible = true;
        this.method_2597(-1);
    }

    public function method_5095(): void {
        var _loc1_: class_93 = this.method_1413();
        var _loc2_: class_1105 = _loc1_.method_89(class_91.const_989).getChildAt(0) as class_1105;
        if (!_loc2_.hasEventListener(MouseEvent.CLICK)) {
            _loc2_.addEventListener(MouseEvent.CLICK, this.method_3854);
        }
        this.method_2573(false);
    }

    private function method_2779(param1: MouseEvent = null): void {
        this.method_2573(false);
        var _loc2_: class_93 = this.method_1413();
        if (!Sprite(_loc2_.method_89(class_91.const_989).getChildAt(0)).hasEventListener(MouseEvent.CLICK)) {
            _loc2_.method_89(class_91.const_989).getChildAt(0).addEventListener(MouseEvent.CLICK, this.method_3854);
        }
        this.method_5286(class_415.const_3089);
    }

    private function method_3854(param1: MouseEvent): void {
        this.method_3918();
    }

    public function method_3918(): void {
        var _loc1_: class_93 = this.method_1413();
        var _loc2_: class_1105 = Sprite(_loc1_.method_89(class_91.const_989)).getChildAt(0) as class_1105;
        var _loc3_: class_1107 = this.method_5606(this.var_841).var_2998;
        this.method_1099();
        _loc3_.toggleVisibility();
        this.method_128(_loc2_.var_1227);
    }

    private function method_128(param1: MovieClip): void {
        var _loc2_: int = 1;
        if (param1.currentFrame == _loc2_) {
            _loc2_ = 2;
        }
        param1.gotoAndStop(_loc2_);
    }

    private function method_4382(param1: MouseEvent = null): void {
        if (param1 != null) {
            this.method_5286(class_415.DEACTIVATE);
        }
    }

    private function method_5859(param1: MouseEvent): void {
        class_59.referToURL("internalDock", "seo_tittle_pet", null, true, "petGear");
    }

    private function method_6334(param1: MouseEvent): void {
        this.method_5286(class_415.const_569);
    }

    public function method_1413(): class_93 {
        var _loc1_: * = null;
        if (this.var_841 != null) {
            _loc1_ = this.var_841.method_3694(class_93.const_1181);
        }
        return _loc1_;
    }

    public function method_5286(param1: int): void {
        var _loc2_: class_415 = new class_415(param1);
        this.sendRequest(_loc2_);
    }

    public function sendRequest(param1: ICommand): void {
        this.const_873.dispatch(param1);
    }

    private function method_2597(param1: int): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc7_: int = 0;
        var _loc8_: * = null;
        var _loc2_: class_93 = this.method_1413();
        _loc3_ = _loc2_.method_89(class_91.const_629).getChildAt(0) as Sprite;
        if (_loc3_.numChildren > 0) {
            _loc7_ = 0;
            while (_loc7_ < _loc3_.numChildren) {
                _loc3_.removeChildAt(_loc7_);
                _loc7_++;
            }
        }
        var _loc5_: class_66;
        var _loc6_: class_39 = (_loc5_ = ResourceManager.name_15).getFinisher("ui") as class_39;
        if (param1 > -1) {
            this.method_1614(_loc3_, param1);
            _loc4_ = _loc6_.getEmbeddedBitmap("pet_level_" + param1 + ".jpg");
            _loc3_.addChild(_loc4_);
            (_loc8_ = new BitmapFont()).setText(param1.toString());
            _loc8_.x = _loc4_.width - _loc8_.width - 5;
            _loc8_.y = _loc4_.height - 10;
            _loc8_.scaleY = 1.5;
            _loc8_.scaleX = 1.5;
            _loc3_.alpha = 1;
            _loc3_.addChild(_loc8_);
        } else {
            _loc4_ = _loc6_.getEmbeddedBitmap("pet_level_0.jpg");
            _loc3_.addChild(_loc4_);
            _loc3_.alpha = 0.4;
        }
    }

    private function method_1614(param1: InteractiveObject, param2: int): void {
        var _loc3_: class_333 = class_94.getInstance().method_6181(param1);
        if (_loc3_) {
            _loc3_.method_1455(class_88.getItem("title_pet") + " " + class_88.getItem("ttip_level").replace("%COUNT%", param2));
        } else {
            class_94.getInstance().method_1211(param1, class_88.getItem("title_pet") + " " + class_88.getItem("ttip_level").replace("%COUNT%", param2));
        }
    }

    private function method_3973(param1: String): void {
        var _loc2_: class_93 = this.method_1413();
        var _loc3_: TextField = _loc2_.method_89(class_91.var_2786).getChildAt(0) as TextField;
        _loc3_.text = param1;
    }

    public function method_5054(param1: int, param2: int, param3: int): void {
        var _loc5_: class_1052;
        var _loc4_: class_93;
        (_loc5_ = (_loc4_ = this.method_1413()).method_89(param1).getChildAt(0) as class_1052).update(param2, param3);
    }

    private function method_1316(param1: Event = null): void {
        var _loc2_: class_1105 = this.var_841.method_3694(class_93.const_1181).method_89(class_91.const_989).getChildAt(0) as class_1105;
        var _loc3_: class_1107 = this.method_5606(this.var_841).var_2998;
        _loc3_.visible = false;
        _loc2_.var_1227.gotoAndStop(1);
        this.method_1099();
    }

    private function method_5606(param1: class_131): class_1106 {
        var _loc2_: * = null;
        if (param1.getChildAt(Number(this.var_841.numChildren) - 2) is class_1106) {
            _loc2_ = param1.getChildAt(Number(this.var_841.numChildren) - 2) as class_1106;
        } else {
            _loc2_ = param1.getChildAt(this.var_841.numChildren - 1) as class_1106;
        }
        return _loc2_;
    }

    private function method_1099(param1: Event = null): void {
        var _loc3_: * = null;
        var _loc2_: class_1106 = this.method_5606(this.var_841);
        for each(_loc3_ in _loc2_.var_3345) {
            if (_loc3_ != null) {
                _loc3_.hide();
            }
        }
    }

    public function method_5978(param1: Boolean): void {
        var _loc2_: class_93 = this.method_1413();
        MovieClip(_loc2_.method_89(class_91.const_2514).getChildAt(0)).gotoAndStop(1);
        _loc2_.method_89(class_91.const_2514).getChildAt(0).visible = param1;
        _loc2_.method_89(class_91.const_844).getChildAt(0).visible = !param1;
        _loc2_.method_89(class_91.const_2029).getChildAt(0).visible = !param1;
    }

    public function method_6367(): void {
        var _loc1_: class_93 = this.method_1413();
        _loc1_.method_89(class_91.const_844).getChildAt(0).visible = false;
        _loc1_.method_89(class_91.const_2029).getChildAt(0).visible = false;
        _loc1_.method_89(class_91.const_2514).getChildAt(0).visible = false;
        MovieClip(_loc1_.method_89(class_91.const_2327).getChildAt(0)).gotoAndStop(1);
    }

    public function method_3621(): void {
        var _loc1_: class_93 = this.method_1413();
        _loc1_.method_89(class_91.const_844).getChildAt(0).visible = true;
        _loc1_.method_89(class_91.const_2029).getChildAt(0).visible = true;
        _loc1_.method_89(class_91.const_2514).getChildAt(0).visible = false;
        MovieClip(_loc1_.method_89(class_91.const_2327).getChildAt(0)).gotoAndStop(1);
    }

    private function method_2573(param1: Boolean): void {
        var _loc2_: class_93 = this.method_1413();
        MovieClip(_loc2_.method_89(class_91.const_2029).getChildAt(0)).gotoAndStop(1);
        MovieClip(_loc2_.method_89(class_91.const_844).getChildAt(0)).gotoAndStop(1);
        MovieClip(_loc2_.method_89(class_91.const_2029).getChildAt(0)).visible = param1;
        MovieClip(_loc2_.method_89(class_91.const_844).getChildAt(0)).visible = !param1;
        MovieClip(_loc2_.method_89(class_91.const_2514).getChildAt(0)).visible = false;
    }

    public function method_5777(): void {
        this.var_841.method_3694(class_93.const_1181).method_89(class_91.const_643).visible = true;
        var _loc1_: class_91 = this.var_841.method_3694(class_93.const_267).method_89(class_91.const_659);
        if (_loc1_ != null && _loc1_.numChildren > 0) {
            _loc1_.removeChildAt(0);
        }
        var _loc2_: class_93 = this.var_841.method_3694(class_93.const_267);
        _loc2_.removeAllElements();
    }

    public function method_4850(): Boolean {
        if (this.method_1413() != null) {
            this.method_4899();
            this.method_5235();
            this.method_1316();
            this.method_2573(true);
            return true;
        }
        return false;
    }

    private function method_5235(): void {
        this.method_1033(0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, "");
        this.method_5189();
    }

    public function method_1033(param1: int, param2: int, param3: int, param4: int, param5: int, param6: int, param7: int, param8: int, param9: int, param10: int, param11: int, param12: String): void {
        this.method_3973(param12);
        this.method_5054(class_91.var_391, param5, param6);
        this.method_5054(class_91.var_4109, param7, param8);
        this.method_5054(class_91.var_532, param9, param10);
        this.method_5054(class_91.var_4782, param3, param4);
        this.method_2597(param2);
    }

    public function method_2480(param1: int): void {
        delete this.var_3171[param1];
        var _loc2_: class_1106 = this.method_5606(this.var_841);
        var _loc3_: class_1490 = _loc2_.var_2998.getElementByID(param1);
        if (_loc3_ != null) {
            _loc2_.var_2998.removeElement(_loc3_);
            if (_loc2_.method_2188(param1) != null) {
                _loc2_.method_4677(param1);
            }
        }
    }

    public function method_1602(param1: Boolean, param2: int): void {
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc3_: class_93 = this.method_1413();
        var _loc4_: class_91;
        var _loc5_: MovieClip = (_loc4_ = _loc3_.method_89(class_91.const_2514)).getChildAt(0) as MovieClip;
        class_94.getInstance().method_4247(_loc4_);
        class_94.getInstance().method_4247(_loc5_);
        if (param1) {
            _loc5_.gotoAndStop(1);
            if (param2 == 0) {
                _loc6_ = "ttip_repair_pet_free";
                _loc7_ = class_88.getItem(_loc6_);
            } else {
                _loc6_ = "ttip_repair_pet";
                _loc7_ = class_88.getItem(_loc6_).replace("%COUNT%", class_122.method_98(param2));
            }
            _loc8_ = _loc5_;
        } else {
            _loc5_.gotoAndStop(3);
            _loc6_ = "ttip_pet_repair_disabled_through_money";
            _loc7_ = class_88.getItem(_loc6_);
            _loc8_ = _loc4_;
        }
        _loc5_.mouseChildren = param1;
        _loc5_.mouseEnabled = param1;
        class_94.getInstance().method_1211(_loc8_, _loc7_);
    }

    public function method_5189(): void {
        var _loc1_: class_1105 = this.var_841.method_3694(class_93.const_1181).method_89(class_91.const_989).getChildAt(0) as class_1105;
        var _loc2_: class_1106 = this.method_5606(this.var_841);
        _loc2_.var_2998.removeAllElements();
        _loc2_.method_4790();
        _loc1_.setIcon(null);
        _loc1_.method_1021("");
    }

    private function method_4899(): void {
        var _loc2_: * = null;
        var _loc1_: class_93 = this.method_1413();
        if (_loc1_ != null) {
            _loc2_ = _loc1_.method_89(class_91.const_989).getChildAt(0) as class_1105;
            if (_loc2_.hasEventListener(MouseEvent.CLICK)) {
                _loc2_.removeEventListener(MouseEvent.CLICK, this.method_3854);
            }
        }
    }

    public function method_1963(): void {
        this.method_5235();
        this.method_5978(true);
        this.method_4899();
    }

    private function method_221(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (this.var_841) {
            _loc1_ = this.method_1413();
            _loc1_.method_89(class_91.const_2029).method_5714(0.25);
            _loc1_.method_89(class_91.const_844).method_5714(0.25);
            _loc1_.method_89(class_91.const_2327).method_5714(0.25);
            _loc2_ = this.var_841.method_3694(class_93.const_1181).method_89(class_91.const_989).getChildAt(0) as class_1105;
            _loc2_.method_5714(0.25);
            _loc2_.removeEventListener(MouseEvent.CLICK, this.method_3854);
        }
    }

    private function method_6512(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (this.var_841 != null) {
            _loc1_ = this.method_1413();
            _loc1_.method_89(class_91.const_2514).method_118();
            _loc1_.method_89(class_91.const_2029).method_118();
            _loc1_.method_89(class_91.const_844).method_118();
            _loc1_.method_89(class_91.const_2327).method_118();
            _loc2_ = this.var_841.method_3694(class_93.const_1181).method_89(class_91.const_989).getChildAt(0) as class_1105;
            _loc2_.method_118();
            if (!_loc2_.hasEventListener(MouseEvent.CLICK)) {
                _loc2_.addEventListener(MouseEvent.CLICK, this.method_3854);
            }
        }
    }

    public function name_84(param1: Boolean): void {
        if (param1) {
            this.method_221();
        } else {
            this.method_6512();
        }
    }

    public function method_253(param1: Boolean, param2: class_424): void {
        var _loc3_: class_1490 = this.method_611(param2.var_2008);
        if (_loc3_) {
            _loc3_.setEnabled(param1);
        }
    }

    public function method_3161(param1: int, param2: Vector.<int>): void {
        var _loc3_: * = null;
        var _loc5_: * = null;
        var _loc7_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc4_: String = "";
        var _loc6_: class_126 = class_126.getInstance();
        var _loc8_: class_1107;
        if ((_loc8_ = (_loc7_ = this.method_5606(this.var_841)).method_2188(param1)) == null) {
            (_loc8_ = new class_1107(param1)).x = _loc7_.var_2998.width + 10;
            _loc8_.y = this.method_611(param1).y;
            _loc7_.method_4401(_loc8_);
            this.method_611(param1).method_5624();
            this.method_4123(param1);
        } else {
            _loc8_.removeAllElements();
        }
        var _loc9_: class_1083 = class_198.var_3933[param1];
        switch (_loc9_.var_4706) {
            case "npc":
                _loc12_ = _loc6_.method_1789;
                _loc11_ = _loc6_.method_3582;
                break;
            case "ore":
                _loc12_ = _loc6_.method_6484;
                _loc11_ = _loc6_.method_1158;
                break;
            default:
                return;
        }
        var _loc13_: int = 0;
        while (_loc13_ < param2.length) {
            _loc4_ = _loc12_[param2[_loc13_]];
            _loc10_ = _loc11_[int(param2[_loc13_])] + _loc9_.suffix;
            _loc3_ = class_39(ResourceManager.name_15.getFinisher("icons")).getEmbeddedBitmap(_loc10_) as Bitmap;
            if (_loc3_ == null) {
                _loc3_ = class_39(ResourceManager.name_15.getFinisher("icons")).getEmbeddedBitmap("npc_unknown_placeholder_icon.png");
            }
            (_loc5_ = new class_1490(param2[_loc13_], _loc4_, _loc3_, _loc7_.var_2998.width - 1)).addEventListener(class_1490.CLICKED, this.method_4928);
            _loc8_.addElement(_loc5_);
            _loc13_++;
        }
    }

    private function method_4123(param1: int): void {
        var _loc2_: class_1490 = this.method_611(param1);
        if (_loc2_ != null) {
            _loc2_.addEventListener(class_1490.MOUSE_OVER, this.method_3268);
        }
    }

    private function method_3268(param1: Event): void {
        var _loc2_: class_1107 = this.method_2188(class_1490(param1.target).gearID);
        if (_loc2_ != null) {
            _loc2_.show();
        }
    }

    private function method_2188(param1: int): class_1107 {
        var _loc2_: class_1106 = this.method_5606(this.var_841);
        return _loc2_.method_2188(param1);
    }

    private function method_4928(param1: Event): void {
        var _loc2_: class_1490 = class_1490(param1.target);
        var _loc3_: int = int(class_1490(param1.target).parentgearID);
        var _loc4_: class_1490 = this.method_611(_loc3_);
        this.setSelectedItem(_loc2_.icon, _loc4_.title, _loc3_, _loc2_.gearID.toString());
        this.method_3918();
    }

    private function setSelectedItem(param1: Bitmap, param2: String, param3: int, param4: String = "", param5: Boolean = true): void {
        var _loc6_: class_93;
        var _loc7_: class_1105 = (_loc6_ = this.method_1413()).method_89(class_91.const_989).getChildAt(0) as class_1105;
        var _loc8_: class_1083 = class_198.var_3933[param3];
        this.method_1099();
        var _loc9_: Bitmap = new Bitmap(param1.bitmapData);
        var _loc10_: Bitmap;
        (_loc10_ = new Bitmap(param1.bitmapData)).scaleX = _loc9_.scaleX = param1.scaleX;
        _loc10_.scaleX = _loc9_.scaleY = param1.scaleY;
        _loc7_.setIcon(_loc9_);
        _loc7_.method_1021(param2);
        this.const_694.dispatch();
        this.const_3200.dispatch(_loc8_.effect, _loc10_);
        if (param5) {
            this.method_1429(param3, param4);
        }
        if (false) {
            class_82.playSoundEffect(class_126.const_1814);
        }
    }

    private function method_1429(param1: int, param2: String): void {
        var _loc3_: class_933 = new class_933();
        _loc3_.var_4128.var_2008 = param1;
        _loc3_.var_1107 = int(param2);
        this.sendRequest(_loc3_);
    }

    private function method_611(param1: int): class_1490 {
        var _loc2_: class_1107 = this.method_5606(this.var_841).var_2998;
        return _loc2_.getElementByID(param1);
    }

    private function method_1654(param1: Event): void {
        var _loc2_: class_1490 = class_1490(param1.target);
        var _loc3_: String = "";
        var _loc4_: class_1107;
        if ((_loc4_ = this.method_2188(_loc2_.gearID)) != null) {
            if (_loc4_.method_89(0) != null) {
                _loc3_ = _loc4_.method_89(0).gearID.toString();
            }
        }
        this.setSelectedItem(_loc2_.icon, _loc2_.title, _loc2_.gearID, _loc3_);
        this.method_3918();
    }

    private function method_837(param1: int): class_1490 {
        var _loc2_: class_1106 = this.method_5606(this.var_841);
        return _loc2_.var_2998.getElementByID(param1);
    }

    public function method_6164(param1: int, param2: Vector.<int>): void {
        var _loc3_: int = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        if (param2 != null && param2.length > 0) {
            _loc3_ = param2[0];
        }
        var _loc4_: class_1106 = this.method_5606(this.var_841);
        var _loc5_: class_1490 = this.method_837(param1);
        if ((_loc5_ = _loc4_.var_2998.getElementByID(param1)) == null) {
            return;
        }
        if (_loc3_ > -1) {
            if ((_loc7_ = _loc4_.method_2188(param1)) != null) {
                _loc6_ = _loc7_.getElementByID(_loc3_);
            }
        }
        if (_loc6_ == null) {
            this.setSelectedItem(_loc5_.icon, _loc5_.title, param1, "", false);
        } else {
            this.setSelectedItem(_loc6_.icon, _loc5_.title, param1, _loc3_.toString(), false);
        }
    }

    public function method_4042(param1: int, param2: int, param3: int, param4: Boolean): void {
        this.var_3171.push(param1);
        var _loc5_: class_1491 = class_1492.method_5814(param1, param2, param3);
        var _loc6_: Bitmap = class_39(ResourceManager.name_15.getFinisher("ui")).getEmbeddedBitmap(_loc5_.pattern.resKey);
        var _loc7_: class_1107 = this.method_5882();
        var _loc8_: class_1490;
        (_loc8_ = new class_1490(param1, _loc5_.pattern.var_2807, _loc6_, _loc7_.width - 1)).setEnabled(param4);
        _loc8_.addEventListener(class_1490.MOUSE_OVER, this.method_1099);
        _loc8_.addEventListener(class_1490.CLICKED, this.method_1654);
        _loc7_.addElement(_loc8_);
    }

    private function method_5882(): class_1107 {
        return this.method_5606(this.var_841).var_2998;
    }

    public function method_6129(param1: int): class_421 {
        var _loc5_: * = null;
        var _loc2_: class_93 = this.method_1413();
        var _loc3_: Sprite = _loc2_.method_89(class_91.const_2035).getChildAt(0) as Sprite;
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_.numChildren) {
            if ((_loc5_ = _loc3_.getChildAt(_loc4_) as class_421) != null && _loc5_.id == param1) {
                return _loc5_;
            }
            _loc4_++;
        }
        return null;
    }

    public function method_4998(param1: int): class_421 {
        var _loc2_: class_414 = class_198.var_1357[param1];
        if (_loc2_ == null) {
            return null;
        }
        var _loc3_: class_421 = new class_421(_loc2_);
        var _loc4_: class_333 = class_94.getInstance().method_1211(_loc3_, class_88.getItem(_loc2_.languageKey));
        _loc3_.tooltip = _loc4_;
        var _loc5_: class_93 = this.method_1413();
        var _loc6_: Sprite;
        (_loc6_ = Sprite(_loc5_.method_89(class_91.const_2035).getChildAt(0))).addChild(_loc3_);
        this.method_3990();
        return _loc3_;
    }

    public function method_2508(param1: class_421): void {
        this.method_1922(param1.id);
    }

    public function method_1384(): void {
        var _loc4_: * = null;
        var _loc1_: class_93 = this.method_1413();
        var _loc2_: Sprite = _loc1_.method_89(class_91.const_2035).getChildAt(0) as Sprite;
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_.numChildren) {
            if ((_loc4_ = _loc2_.getChildAt(_loc3_) as class_421) != null) {
                this.method_2508(_loc4_);
            }
            _loc3_++;
        }
    }

    public function method_1922(param1: int): void {
        var _loc4_: * = null;
        var _loc2_: class_93 = this.method_1413();
        var _loc3_: Sprite = _loc2_.method_89(class_91.const_2035).getChildAt(0) as Sprite;
        var _loc5_: int = 0;
        while (_loc5_ < _loc3_.numChildren) {
            if ((_loc4_ = _loc3_.getChildAt(_loc5_) as class_421) != null && _loc4_.id == param1) {
                class_94.getInstance().method_4247(_loc4_ as InteractiveObject);
                class_215.removeDisplayObject(_loc4_);
            }
            _loc5_++;
        }
        this.method_3990();
    }

    private function method_3990(): void {
        var _loc3_: * = null;
        var _loc1_: class_93 = this.method_1413();
        var _loc2_: Sprite = _loc1_.method_89(class_91.const_2035).getChildAt(0) as Sprite;
        var _loc5_: int = 0;
        while (_loc5_ < _loc2_.numChildren) {
            _loc3_ = _loc2_.getChildAt(_loc5_) as class_421;
            _loc3_.setPosition(_loc5_ * Number(_loc3_.getChildAt(0).width) + 15, 15);
            _loc5_++;
        }
    }

    public function method_4518(): void {
        var _loc1_: Array = this.var_3171;
        var _loc2_: int = int(this.var_3171.length);
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            this.method_2480(_loc1_[_loc3_]);
            _loc3_++;
        }
    }
}
}
