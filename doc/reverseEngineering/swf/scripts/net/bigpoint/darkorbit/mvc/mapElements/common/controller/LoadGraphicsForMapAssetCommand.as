package net.bigpoint.darkorbit.mvc.mapElements.common.controller {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;

import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;
import net.bigpoint.darkorbit.mvc.mapElements.common.model.assetProxy.MapAssetLoadVo;
import net.bigpoint.darkorbit.settings.Settings;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_11.class_38;
import package_11.class_39;

import package_181.class_1104;

import package_84.class_243;

public class LoadGraphicsForMapAssetCommand extends class_243 {


    public function LoadGraphicsForMapAssetCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        super.execute(param1);
        var _loc2_: MapAssetLoadVo = param1.getBody() as MapAssetLoadVo;
        var _loc3_: AssetsProxy = facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
        if (_loc3_.isLoaded(_loc2_.sourceKey)) {
            switch (_loc2_.expectedClass) {
                case Bitmap:
                    if ((_loc4_ = ((_loc5_ = _loc3_.getLib(_loc2_.sourceKey, _loc2_.instanceId)) as class_39).getEmbeddedBitmap(_loc2_.embedKeys[0]) as _loc2_.expectedClass) is _loc2_.expectedClass) {
                        _loc2_.callBack(_loc4_ as _loc2_.expectedClass);
                        break;
                    }
                    this.error(_loc2_);
                    break;
                case MovieClip:
                case Sprite:
                case Shape:
                case DisplayObject:
                case DisplayObjectContainer:
                    if ((_loc4_ = ((_loc5_ = _loc3_.getLib(_loc2_.sourceKey, _loc2_.instanceId)) as class_39).method_2545(_loc2_.embedKeys[0])) is Class) {
                        _loc4_ = new _loc4_();
                    }
                    if (_loc4_ is BitmapData) {
                        _loc4_ = new Bitmap(_loc4_ as BitmapData);
                    }
                    _loc2_.callBack(_loc4_);
                    break;
                case BitmapData:
                    _loc5_ = _loc3_.getLib(_loc2_.sourceKey, _loc2_.instanceId);
                    _loc7_ = new Vector.<BitmapData>();
                    for each(_loc8_ in _loc2_.embedKeys) {
                        if (_loc6_ = (_loc5_ as class_39).getEmbeddedBitmapData(_loc8_) as BitmapData) {
                            _loc7_.push(_loc6_);
                        }
                    }
                    if (_loc7_.length) {
                        _loc2_.callBack(_loc7_.length == 1 ? _loc7_[0] : _loc7_);
                        break;
                    }
                    this.error(_loc2_);
                    break;
                case class_1104:
                    if ((Boolean(_loc4_ = ((_loc5_ = _loc3_.getLib(_loc2_.sourceKey, _loc2_.instanceId)) as class_39).method_2545(_loc2_.embedKeys[0]) as MovieClip)) && _loc4_ is MovieClip) {
                        (_loc9_ = new class_1104(_loc4_ as MovieClip, _loc2_.sourceKey + _loc2_.embedKeys[0])).play();
                        _loc2_.callBack(_loc9_);
                        break;
                    }
                    this.error(_loc2_);
                    break;
            }
            if (_loc2_.unloadeResources && false) {
                this.addFinisherToUnloadList(_loc5_);
            }
        } else {
            sendNotification(MapAssetNotification.RETRY_LOAD, [_loc2_.sourceKey, _loc2_.instanceId, param1]);
        }
    }

    private function addFinisherToUnloadList(param1: class_38): void {
        sendNotification(AssetNotifications.ADD_UNLOAD_FINISHER, param1);
    }

    private function error(param1: MapAssetLoadVo): void {
    }
}
}
