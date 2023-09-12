package package_303 {

import flash.utils.Dictionary;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.map.view3D.class_1211;

import package_35.Effect;
import package_35.EffectManager;
import package_35.class_338;

import package_380.class_2158;
import package_380.class_2197;

import package_381.RepairRobotEffect3D;
import package_381.class_2161;
import package_381.class_2162;
import package_381.class_2163;
import package_381.class_2164;
import package_381.class_2165;
import package_381.class_2166;
import package_381.class_2167;
import package_381.class_2168;
import package_381.class_2169;
import package_381.class_2170;
import package_381.class_2171;
import package_381.class_2172;
import package_381.class_2173;
import package_381.class_2174;
import package_381.class_2175;
import package_381.class_2177;
import package_381.class_2178;
import package_381.class_2179;
import package_381.class_2180;
import package_381.class_2181;
import package_381.class_2182;
import package_381.class_2183;
import package_381.class_2184;
import package_381.class_2185;
import package_381.class_2186;
import package_381.class_2187;
import package_381.class_2188;
import package_381.class_2189;
import package_381.class_2191;
import package_381.class_2192;
import package_381.class_2193;
import package_381.class_2194;
import package_381.class_2195;
import package_381.class_2196;
import package_381.class_2198;
import package_381.class_2199;
import package_381.class_2200;
import package_381.class_2201;
import package_381.class_2202;
import package_381.class_2203;
import package_381.class_2204;
import package_381.class_2205;
import package_381.class_2206;
import package_381.class_2207;
import package_381.class_2208;
import package_381.class_2210;
import package_381.class_2211;
import package_381.class_2212;
import package_381.class_2213;
import package_381.class_2214;
import package_381.class_2215;
import package_381.class_2216;
import package_381.class_2217;
import package_381.class_2218;
import package_381.class_2219;
import package_381.class_2220;
import package_381.class_2221;
import package_381.class_2223;

import package_382.class_2176;
import package_382.class_2209;

public class class_1765 {

    private static const MAP: Object = {};

    {
        MAP[class_338.const_2456] = class_2163;
        MAP[class_338.const_2837] = class_2185;
        MAP[class_338.const_1620] = class_2201;
        MAP[class_338.const_2285] = class_2199;
        MAP[class_338.LASER] = class_2209;
        MAP[class_338.const_3171] = class_2176;
        MAP[class_338.ROCKET] = class_2197;
        MAP[class_338.const_3080] = class_2158;
        MAP[class_338.const_2445] = class_2223;
        MAP[class_338.const_3216] = class_2187;
        MAP[class_338.const_2332] = class_2173;
        MAP[class_338.const_1707] = class_2194;
        MAP[class_338.const_356] = class_2218;
        MAP[class_338.const_1875] = class_2200;
        MAP[class_338.const_1669] = class_2167;
        MAP[class_338.const_3083] = class_2177;
        MAP[class_338.const_2505] = class_2178;
        MAP[class_338.const_3279] = class_2216;
        MAP[class_338.EMP] = class_2161;
        MAP[class_338.const_1085] = class_2202;
        MAP[class_338.const_547] = class_2172;
        MAP[class_338.const_3003] = class_2189;
        MAP[class_338.const_3] = class_2175;
        MAP[class_338.const_557] = class_2182;
        MAP[class_338.const_1305] = class_2210;
        MAP[class_338.const_818] = class_2186;
        MAP[class_338.const_215] = class_2214;
        MAP[class_338.const_2918] = class_2188;
        MAP[class_338.const_2643] = class_2168;
        MAP[class_338.const_3320] = class_2179;
        MAP[class_338.const_1105] = class_2183;
        MAP[class_338.SKULL] = class_2213;
        MAP[class_338.const_1733] = class_2205;
        MAP[class_338.const_2390] = class_2221;
        MAP[class_338.const_1766] = class_2212;
        MAP[class_338.INVINCIBILITY] = class_2180;
        MAP[class_338.const_2567] = class_2164;
        MAP[class_338.const_1444] = class_2217;
        MAP[class_338.const_1034] = class_2206;
        MAP[class_338.const_658] = class_2174;
        MAP[class_338.const_2606] = class_2171;
        MAP[class_338.const_3069] = class_2215;
        MAP[class_338.const_841] = class_2170;
        MAP[class_338.const_2447] = class_2195;
        MAP[class_338.const_2323] = class_2211;
        MAP[class_338.const_2316] = class_2191;
        MAP[class_338.DAMAGE] = class_2169;
        MAP[class_338.RAGE] = class_2170;
        MAP[class_338.const_1531] = class_2170;
        MAP[class_338.const_3170] = class_2170;
        MAP[class_338.const_909] = class_2192;
        MAP[class_338.const_458] = class_2220;
        MAP[class_338.const_2047] = class_2196;
        MAP[class_338.const_1636] = class_2170;
        MAP[class_338.const_3248] = class_2198;
        MAP[class_338.const_2558] = class_2203;
        MAP[class_338.const_511] = class_2208;
        MAP[class_338.const_1506] = class_2204;
        MAP[class_338.const_1081] = RepairRobotEffect3D;
        MAP[class_338.const_1322] = RepairRobotEffect3D;
        MAP[class_338.const_1278] = class_2193;
        MAP[class_338.const_314] = class_2184;
        MAP[class_338.const_1961] = class_2207;
        MAP[class_338.const_2138] = class_2162;
        MAP[class_338.const_920] = class_2219;
        MAP[class_338.const_2409] = class_2165;
        MAP[class_338.const_3063] = class_2181;
        MAP[class_338.const_2508] = class_2166;
    }

    private var var_4256: Dictionary;

    private var _manager: EffectManager;

    private var _view: class_1211;

    public function class_1765(param1: class_1211) {
        this.var_4256 = new Dictionary(true);
        super();
        this._view = param1;
    }

    public function set map(param1: class_90): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (this._manager) {
            this._manager.const_1806.remove(this.method_3292);
            this._manager.const_727.remove(this.method_534);
            for (_loc2_ in this.var_4256) {
                this.method_534(_loc2_ as Effect);
            }
        }
        this._manager = !!param1 ? param1.effects : null;
        if (this._manager) {
            this._manager.const_1806.add(this.method_3292);
            this._manager.const_727.add(this.method_534);
            for each(_loc3_ in this._manager.effects) {
                this.method_3292(_loc3_);
            }
        }
    }

    private function method_3292(param1: Effect): void {
        var _loc3_: * = null;
        var _loc2_: Class = MAP[param1.id] as Class;
        if (_loc2_ != null) {
            _loc3_ = new _loc2_(this._view, param1);
            if (Boolean(param1.method_1664) || Boolean(param1.timeout)) {
                this.var_4256[param1] = _loc3_;
            }
        }
    }

    private function method_534(param1: Effect): void {
        var _loc2_: Object = this.var_4256[param1];
        if (_loc2_ != null) {
            if (_loc2_ is IDisposable) {
                IDisposable(_loc2_).disposeView();
            }
            this.var_4256[param1] = null;
        }
    }
}
}
