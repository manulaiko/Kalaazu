package org.osmf.media {

import org.osmf.events.LoadEvent;
import org.osmf.traits.LoadState;
import org.osmf.traits.LoadTrait;
import org.osmf.traits.LoaderBase;
import org.osmf.traits.MediaTraitType;

public class LoadableElementBase extends MediaElement {


    private var _loader: LoaderBase;

    public function LoadableElementBase(param1: MediaResourceBase = null, param2: LoaderBase = null) {
        super();
        this._loader = param2;
        this.resource = param1;
    }

    override public function set resource(param1: MediaResourceBase): void {
        super.resource = param1;
        this.updateLoadTrait();
    }

    protected final function get loader(): LoaderBase {
        return this._loader;
    }

    protected final function set loader(param1: LoaderBase): void {
        this._loader = param1;
    }

    protected function createLoadTrait(param1: MediaResourceBase, param2: LoaderBase): LoadTrait {
        return new LoadTrait(this._loader, param1);
    }

    protected function processLoadingState(): void {
    }

    protected function processReadyState(): void {
    }

    protected function processUnloadingState(): void {
    }

    protected function getLoaderForResource(param1: MediaResourceBase, param2: Vector.<LoaderBase>): LoaderBase {
        var _loc4_: Boolean = false;
        var _loc5_: * = null;
        var _loc3_: LoaderBase = this.loader;
        if (param1 != null && (this.loader == null || this.loader.canHandleResource(param1) == false)) {
            _loc4_ = false;
            for each(_loc5_ in param2) {
                if (this.loader == null || this.loader != _loc5_) {
                    if (_loc5_.canHandleResource(param1)) {
                        _loc3_ = _loc5_;
                        break;
                    }
                }
            }
            if (_loc3_ == null && param2 != null) {
                _loc3_ = param2[param2.length - 1];
            }
        }
        return _loc3_;
    }

    private function onLoadStateChange(param1: LoadEvent): void {
        if (param1.loadState == LoadState.LOADING) {
            this.processLoadingState();
        } else if (param1.loadState == LoadState.READY) {
            this.processReadyState();
        } else if (param1.loadState == LoadState.UNLOADING) {
            this.processUnloadingState();
        }
    }

    private function updateLoadTrait(): void {
        var _loc1_: LoadTrait = getTrait(MediaTraitType.LOAD) as LoadTrait;
        if (_loc1_ != null) {
            if (_loc1_.loadState == LoadState.READY) {
                _loc1_.unload();
            }
            _loc1_.removeEventListener(LoadEvent.LOAD_STATE_CHANGE, this.onLoadStateChange);
            removeTrait(MediaTraitType.LOAD);
        }
        if (this.loader != null) {
            _loc1_ = this.createLoadTrait(resource, this.loader);
            _loc1_.addEventListener(LoadEvent.LOAD_STATE_CHANGE, this.onLoadStateChange, false, 10);
            addTrait(MediaTraitType.LOAD, _loc1_);
        }
    }
}
}
