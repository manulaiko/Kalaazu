package net.bigpoint.darkorbit.map.view3D.display3D {

import flash.geom.Vector3D;
import flash.net.SharedObject;
import flash.utils.clearInterval;

import net.bigpoint.as3toolbox.filecollection.class_66;
import net.bigpoint.darkorbit.map.view3D.class_1211;
import net.bigpoint.darkorbit.settings.Settings;

import package_11.class_65;

import package_19.class_68;
import package_19.class_70;

import package_198.class_1208;

import package_23.FileCollectionEvent;

import package_292.GeometryLoader;
import package_292.TextureLoader;
import package_292.class_1748;

public class class_1210 {

    public static const instance: class_1210 = new class_1210();

    public static const const_2789: uint = 2;

    public static const const_2984: uint = 1;

    public static const const_973: uint = 0;

    public static const const_396: Vector3D = new Vector3D();


    private var _fileCollection: class_66;

    private var var_2342: class_66;

    private var var_4120: Function;

    private var _mapView: class_1211;

    private var var_1423: LightsManager;

    private var var_4186: TextureLoader;

    private var var_2175: GeometryLoader;

    private var var_2904: class_1748;

    private var var_2115: uint;

    private var var_1234: SharedObject;

    private var var_863: Vector.<Function>;

    public const const_466: class_68 = new class_70();

    public function class_1210() {
        this.var_863 = new Vector.<Function>();
        super();
    }

    public function get name_15(): class_66 {
        return this._fileCollection;
    }

    public function get method_2936(): class_66 {
        return this.var_2342;
    }

    public function method_5176(param1: Function): void {
        this.var_4120 = param1;
        var _loc2_: String = "xml/resources_3d.xml?__cv=undefined";
        var _loc3_: String = "NaN";
        this._fileCollection = new class_66(_loc3_, true);
        this._fileCollection.method_1951("jxr", class_65);
        this._fileCollection.addEventListener(FileCollectionEvent.RESOURCE_FILE_LOADED, this.method_665);
        this._fileCollection.method_2661(_loc2_);
    }

    private function method_665(param1: FileCollectionEvent): void {
        (param1.target as class_66).removeEventListener(FileCollectionEvent.RESOURCE_FILE_LOADED, this.method_665);
        var _loc2_: String = "xml/resources_3d_particles.xml?__cv=undefined";
        var _loc3_: String = "NaN";
        this.var_2342 = new class_66(_loc3_, true, true);
        this.var_2342.addEventListener(FileCollectionEvent.RESOURCE_FILE_LOADED, this.method_1600);
        this.var_2342.method_2661(_loc2_);
    }

    private function method_1600(param1: FileCollectionEvent): void {
        (param1.target as class_66).removeEventListener(FileCollectionEvent.RESOURCE_FILE_LOADED, this.method_1600);
        this.var_4120();
        this.var_4120 = null;
    }

    public function init(param1: class_1211, param2: class_1208): void {
        this._mapView = param1;
        this.var_1423 = new LightsManager();
        this.var_4186 = new TextureLoader(param2);
        this.var_2175 = new GeometryLoader();
        this.var_2904 = new class_1748();
        clearInterval(this.var_2115);
    }

    public function method_1508(param1: String): Object {
        return this.so.data[param1];
    }

    public function method_4963(param1: String, param2: Object): void {
        this.so.data[param1] = param2;
        this.so.flush();
    }

    private function get so(): SharedObject {
        var _loc1_: * = this.var_1234 || SharedObject.getLocal("darkorbit.settings3D", "/");
        this.var_1234 = this.var_1234 || SharedObject.getLocal("darkorbit.settings3D", "/");
        return _loc1_;
    }

    public function dispose(): void {
        clearInterval(this.var_2115);
        this.reset();
        this.var_863.length = 0;
        this.var_4186 = null;
        this.var_2175 = null;
        this.var_2904 = null;
        this.var_1423.dispose();
        this.var_1423 = null;
        this._mapView = null;
    }

    public function get method_3528(): class_1211 {
        return this._mapView;
    }

    public function get name_10(): LightsManager {
        return this.var_1423;
    }

    public function get method_3562(): TextureLoader {
        return this.var_4186;
    }

    public function get method_3761(): GeometryLoader {
        return this.var_2175;
    }

    public function get method_659(): class_1748 {
        return this.var_2904;
    }

    public function reset(): void {
        this.const_466.dispatch();
        this.method_3562.reset(class_1210.const_2984);
        this.method_3761.reset(class_1210.const_2984);
        this.method_659.reset(class_1210.const_2984);
    }
}
}
