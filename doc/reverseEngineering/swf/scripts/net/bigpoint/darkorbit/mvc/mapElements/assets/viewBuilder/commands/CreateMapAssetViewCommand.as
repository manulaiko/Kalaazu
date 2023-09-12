package net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.commands {

import flash.utils.Dictionary;

import net.bigpoint.darkorbit.mvc.display.class_1704;
import net.bigpoint.darkorbit.mvc.display.class_1709;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.FactoryViewProxy;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.ViewCreateDTO;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo.AnimationVO;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo.AssetDescriptionVO;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo.AtlasResourceVO;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo.FactoryTweenVO;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.view.IAnimatedViewContainer;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.view.StandartViewContainer;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_266.DOTexturesProxy;
import package_266.class_1713;

public class CreateMapAssetViewCommand extends AsyncCommand {


    public function CreateMapAssetViewCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc5_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc14_: * = null;
        super.execute(param1);
        var _loc2_: ViewCreateDTO = param1.getBody() as ViewCreateDTO;
        var _loc3_: class_1709 = _loc2_.viewBuilder.method_2524();
        var _loc4_: Dictionary = new Dictionary();
        var _loc6_: DOTexturesProxy = facade.retrieveProxy(DOTexturesProxy.NAME) as DOTexturesProxy;
        for each(_loc7_ in _loc2_.assetDescriptionVOList) {
            _loc5_ = _loc2_.searchForAtlasResourceVO(_loc7_.atlas);
            switch (_loc7_.type) {
                case "textfield":
                    _loc12_ = _loc2_.viewBuilder.method_1130();
                    break;
                default:
                    if ((_loc12_ = _loc2_.viewBuilder.method_1332(!!_loc5_ ? _loc6_.getTextureResource(_loc5_.textureResource, _loc5_.atlasResources) : null, _loc7_.subTexture)) != null) {
                        break;
                    }
                    continue;
            }
            _loc13_ = _loc7_.props;
            for (_loc14_ in _loc13_) {
                _loc12_[_loc14_] = _loc13_[_loc14_];
            }
            _loc7_.view = _loc12_;
            _loc4_[_loc7_.id] = _loc12_;
            _loc3_.method_5266(_loc12_);
        }
        _loc8_ = new Dictionary();
        _loc9_ = new Vector.<AnimationVO>();
        for each(_loc10_ in _loc2_.animationVo) {
            this.setChildrenView(_loc10_.children, _loc4_);
            if (_loc10_.id) {
                _loc8_[_loc10_.id] = _loc10_;
            }
            _loc9_.push(_loc10_);
        }
        _loc11_ = new StandartViewContainer(_loc2_, _loc4_, _loc8_, _loc9_, _loc3_, _loc2_.assetDescriptionVOList);
        _loc2_.callback(_loc11_);
        commandComplete();
    }

    private function setChildrenView(param1: Vector.<Object>, param2: Dictionary): void {
        var _loc4_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: int = 0;
        var _loc9_: * = null;
        var _loc10_: int = 0;
        var _loc11_: * = null;
        var _loc3_: int = param1.length;
        var _loc5_: int = 0;
        while (_loc5_ < _loc3_) {
            if ((_loc4_ = param1[_loc5_]) is FactoryTweenVO) {
                if ((_loc8_ = (_loc7_ = (_loc6_ = _loc4_ as FactoryTweenVO).viewId.split(",")).length) > 1) {
                    _loc9_ = new Vector.<Object>();
                    _loc10_ = 0;
                    while (_loc10_ < _loc8_) {
                        (_loc9_ as Vector.<Object>).push(param2[_loc7_[_loc10_]]);
                        _loc10_++;
                    }
                    _loc9_ = new FactoryViewProxy(_loc9_ as Vector.<Object>);
                } else {
                    _loc9_ = param2[_loc6_.viewId];
                }
                _loc6_.view = _loc9_;
            } else if (_loc4_ is AnimationVO) {
                _loc11_ = _loc4_ as AnimationVO;
                this.setChildrenView(_loc11_.children, param2);
            }
            _loc5_++;
        }
    }
}
}
