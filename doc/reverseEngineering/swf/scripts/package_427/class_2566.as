package package_427 {

import com.bigpoint.utils.class_73;

import flash.display.Bitmap;
import flash.display.BitmapData;

import net.bigpoint.darkorbit.map.common.class_80;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.mvc.display.class_1709;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo.AtlasResourceVO;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.view.IAnimatedViewContainer;
import net.bigpoint.darkorbit.settings.Settings;

import package_17.class_62;

import package_266.DOTexturesProxy;
import package_266.class_1713;

import package_9.class_50;

public class class_2566 implements class_80 {


    private var _container: class_1709;

    private var _position: class_73;

    private var _map: Bitmap;

    private var _mask: Bitmap;

    public function class_2566(param1: IAnimatedViewContainer, param2: class_73) {
        super();
        this._position = param2;
        var _loc3_: AtlasResourceVO = param1.dto.searchForAtlasResourceVO("portal");
        var _loc4_: DOTexturesProxy;
        var _loc5_: class_1713 = (_loc4_ = class_62.getInstance().retrieveProxy(DOTexturesProxy.NAME) as DOTexturesProxy).getTextureResource(_loc3_.textureResource, _loc3_.atlasResources);
        this.method_2575(_loc5_);
        this.hScroll = 0.5;
        this.vScroll = 0.5;
        this._container = class_1709(param1.getViewById("map_preview"));
        this._container.addUntypedChild(this._map);
        this._container.addUntypedChild(this._mask);
    }

    public function updateObj(param1: Number): void {
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        var _loc2_: class_86 = class_50.getInstance().map.hero;
        if (_loc2_ != null && this._mask != null && Settings.autoQualityReduction.value < Settings.AQ_NO_PORTAL_TARGET_PREVIEW_LIMIT) {
            _loc3_ = class_50.method_6533() + 100;
            _loc4_ = class_50.method_1269() + 100;
            this.hScroll = Math.max(0, Math.min((_loc2_.x - (Number(this._position.x) - _loc3_ / 2)) / _loc3_, 1));
            this.vScroll = Math.max(0, Math.min((_loc2_.y - (Number(this._position.y) - _loc4_ / 2)) / _loc4_, 1));
        }
    }

    public function set hScroll(param1: Number): void {
        this._map.x = -(Number(this._map.width) - Number(this._mask.width)) * param1;
    }

    public function method_2575(param1: class_1713): void {
        this._map = new Bitmap(param1.atlas.getTexture(param1.texture as BitmapData, "map_preview"));
        this._mask = new Bitmap(param1.atlas.getTexture(param1.texture as BitmapData, "map_mask"));
        this._map.mask = this._mask;
        this._mask.cacheAsBitmap = true;
        this._map.cacheAsBitmap = true;
    }

    public function set vScroll(param1: Number): void {
        this._map.y = -(Number(this._map.height) - Number(this._mask.height)) * param1;
    }
}
}
