package net.bigpoint.darkorbit.fui.builder.xml.creators {

import flash.display.DisplayObject;

import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.fui.builder.xml.factories.SkinLayerFactory;
import net.bigpoint.darkorbit.fui.builder.xml.factories.TransitionEffectFactory;
import net.bigpoint.darkorbit.fui.components.core.Coreponent;
import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
import net.bigpoint.darkorbit.fui.components.core.transitions.ITransitionEffect;
import net.bigpoint.darkorbit.fui.components.image.ImageSlideShow;
import net.bigpoint.darkorbit.fui.components.image.ImageSlideShowElement;

public class ImageSlideShowCreator extends ContainerCreator implements IXMLNodeCreator {


    public function ImageSlideShowCreator() {
        super();
    }

    override public function create(param1: XML): ICoreponent {
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc14_: * = null;
        var _loc15_: Number = NaN;
        var _loc2_: ImageSlideShow = new ImageSlideShow();
        mapXMLNodeAttributes(_loc2_, param1);
        if (param1.slides == null) {
            UISystem.log("Created ImageSlideShow instance, but you haven´t defined a slideshow list.", UISystem.LOG_LEVEL_WARN);
            return _loc2_;
        }
        var _loc3_: String = param1.attribute(AbstractCreator.ATTRIBUTENAME_LIBRARY);
        var _loc4_: String = param1.@transitionEffect;
        _loc2_.repeat = isBoolean(param1.@repeat);
        var _loc5_: Vector.<ImageSlideShowElement> = new Vector.<ImageSlideShowElement>();
        var _loc6_: XMLList = param1.slides.children();
        var _loc7_: Number = 0;
        for each(_loc8_ in _loc6_) {
            if ((_loc9_ = _loc8_.attribute(AbstractCreator.ATTRIBUTENAME_LIBRARYID)) == null) {
                UISystem.log("Can´t create image without a specified {libID}.", UISystem.LOG_LEVEL_WARN);
                break;
            }
            if ((_loc10_ = _loc8_.@classname) == null) {
                UISystem.log("Can´t create image without a referenced {skin} class.", UISystem.LOG_LEVEL_WARN);
                break;
            }
            if ((_loc11_ = _loc8_.@transitionEffect).length == 0) {
                if (_loc4_.length <= 0) {
                    UISystem.log("You have to specify a {transitiontype} either in the {slide}- or in the {imageslideshow} node.", UISystem.LOG_LEVEL_WARN);
                    break;
                }
                _loc11_ = _loc4_;
            }
            _loc12_ = new ImageSlideShowElement();
            _loc13_ = SkinLayerFactory.create(_loc8_, _loc3_) as DisplayObject;
            _loc14_ = TransitionEffectFactory.create(_loc11_);
            if ((_loc15_ = Number(_loc8_.@fadeTime)) > 0) {
                _loc14_.fadeTime = _loc8_.@fadeTime;
            } else {
                _loc14_.fadeInTime = _loc8_.@fadeInTime;
                _loc14_.fadeOutTime = _loc8_.@fadeOutTime;
            }
            _loc12_.target = _loc13_;
            _loc12_.transitionEffect = _loc14_;
            _loc12_.duration = _loc8_.@duration;
            _loc5_.push(_loc12_);
            _loc7_++;
        }
        if (_loc7_ > 0) {
            _loc2_.playlist = _loc5_;
        }
        return _loc2_;
    }

    override protected function initializeAttributeMapping(): void {
        super.initializeAttributeMapping();
        this.attributeToMethodMap["library"] = this.handleLibraryAttribute;
    }

    protected function handleLibraryAttribute(param1: Coreponent, param2: String): void {
    }
}
}
