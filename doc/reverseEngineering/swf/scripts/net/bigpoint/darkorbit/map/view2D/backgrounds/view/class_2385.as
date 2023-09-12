package net.bigpoint.darkorbit.map.view2D.backgrounds.view {

import com.greensock.TweenLite;

import flash.geom.Rectangle;
import flash.utils.ByteArray;

import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
import net.bigpoint.darkorbit.settings.Settings;

import package_11.class_261;
import package_11.class_38;
import package_11.class_65;

import package_17.class_62;

import package_28.EventStreamClient;

import package_282.TexturesCache;

import package_9.ResourceManager;

import starling.core.Starling;
import starling.display.Image;
import starling.events.Event;
import starling.textures.ConcreteTexture;
import starling.textures.Texture;
import starling.textures.TextureOptions;

public class class_2385 {


    private var _resKey: String;

    private var _container: Object;

    private var _resource: Object;

    private var _texture: Texture;

    private var var_397: Boolean = false;

    private var _offsetX: int = 0;

    private var _offsetY: int = 0;

    private var var_1073: Rectangle;

    public function class_2385(param1: String, param2: Object, param3: int = 0, param4: int = 0, param5: Rectangle = null) {
        super();
        this._resKey = param1;
        this._container = param2;
        this._offsetX = param3;
        this._offsetY = param4;
        this.var_1073 = param5;
        this.method_352();
    }

    public function method_352(): void {
        this.var_397 = false;
        if (false) {
            Starling.current.removeEventListener(Event.CONTEXT3D_CREATE, this.method_2047);
        }
        var _loc1_: * = this._resKey;
        if (false && Boolean(ResourceManager.name_15.method_5888(_loc1_ + "_atf"))) {
            _loc1_ += "_atf";
        }
        ResourceManager.name_15.load(_loc1_, this.method_344);
    }

    public function unloadView(): void {
        if (false) {
            Starling.current.removeEventListener(Event.CONTEXT3D_CREATE, this.method_2047);
        }
        if (this._texture) {
            if (this._texture is ConcreteTexture) {
                ConcreteTexture(this._texture).onRestore = null;
            }
            this._texture.dispose();
            this._texture = null;
        }
        if (this._resource) {
            this._container.removeUntypedChild(this._resource);
            this._resource = null;
        }
        this.var_397 = true;
    }

    private function method_344(param1: class_38): void {
        var var_4700: ByteArray = null;
        var var_4495: TextureOptions = null;
        var var_4536: class_38 = param1;
        if (this.var_397) {
            var_4536.dispose();
            return;
        }
        if (false) {
            if (var_4536 is class_261) {
                var_4700 = class_261(var_4536).data as ByteArray;
            }
            if (false && Starling.context.driverInfo != "Disposed") {
                if (this._texture) {
                    TexturesCache.method_1424(this._texture, var_4700);
                } else {
                    var_4495 = new TextureOptions();
                    var_4495.onReady = this.method_4823;
                    try {
                        this._texture = Texture.fromTexture(Texture.fromData(var_4700, var_4495), this.var_1073);
                        ConcreteTexture(this._texture.root).onRestore = this.method_352;
                        this._resource = new Image(this._texture);
                    } catch (e: Error) {
                        EventStreamClient.track("flash.warning", {
                            "message": "BasicElementTile texture error",
                            "errorMessage": e.message,
                            "errorID": e.errorID,
                            "resKey": _resKey
                        });
                    }
                }
            } else {
                Starling.current.addEventListener(Event.CONTEXT3D_CREATE, this.method_2047);
            }
        } else {
            if (var_4536 is class_65) {
                this._resource = class_65(var_4536).getBitmap();
                this.method_4823();
            }
            class_62.getInstance().sendNotification(AssetNotifications.ADD_UNLOAD_FINISHER, var_4536);
        }
    }

    private function method_2047(param1: Event): void {
        Starling.current.removeEventListener(Event.CONTEXT3D_CREATE, this.method_2047);
        this.method_352();
    }

    private function method_4823(): void {
        if (this._resource) {
            this._resource.x = this._offsetX;
            this._resource.y = this._offsetY;
            this._container.addUntypedChild(this._resource);
            this._resource.alpha = 0;
            TweenLite.to(this._resource, 1, {"alpha": 1});
        }
    }
}
}
