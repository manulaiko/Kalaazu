package org.osmf.elements {

import flash.display.Bitmap;
import flash.display.Loader;

import org.osmf.elements.loaderClasses.LoaderLoadTrait;
import org.osmf.elements.loaderClasses.LoaderUtils;
import org.osmf.media.LoadableElementBase;
import org.osmf.media.MediaResourceBase;
import org.osmf.media.URLResource;
import org.osmf.traits.DisplayObjectTrait;
import org.osmf.traits.LoadTrait;
import org.osmf.traits.LoaderBase;
import org.osmf.traits.MediaTraitType;

public class ImageElement extends LoadableElementBase {


    private var _smoothing: Boolean;

    public function ImageElement(param1: URLResource = null, param2: ImageLoader = null) {
        if (param2 == null) {
            param2 = new ImageLoader();
        }
        super(param1, param2);
    }

    public function get smoothing(): Boolean {
        return this._smoothing;
    }

    public function set smoothing(param1: Boolean): void {
        if (this._smoothing != param1) {
            this._smoothing = param1;
            this.applySmoothingSetting();
        }
    }

    override protected function createLoadTrait(param1: MediaResourceBase, param2: LoaderBase): LoadTrait {
        return new LoaderLoadTrait(param2, param1);
    }

    override protected function processReadyState(): void {
        var _loc1_: LoaderLoadTrait = getTrait(MediaTraitType.LOAD) as LoaderLoadTrait;
        addTrait(MediaTraitType.DISPLAY_OBJECT, LoaderUtils.createDisplayObjectTrait(_loc1_.loader, this));
        this.applySmoothingSetting();
    }

    override protected function processUnloadingState(): void {
        removeTrait(MediaTraitType.DISPLAY_OBJECT);
    }

    private function applySmoothingSetting(): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc1_: DisplayObjectTrait = getTrait(MediaTraitType.DISPLAY_OBJECT) as DisplayObjectTrait;
        if (_loc1_) {
            _loc2_ = _loc1_.displayObject as Loader;
            if (_loc2_ != null) {
                _loc3_ = _loc2_.content as Bitmap;
                if (_loc3_ != null) {
                    _loc3_.smoothing = this._smoothing;
                }
            }
        }
    }
}
}
