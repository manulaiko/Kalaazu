package org.osmf.elements {

import flash.events.Event;

import org.osmf.elements.proxyClasses.LoadFromDocumentLoadTrait;
import org.osmf.events.LoadEvent;
import org.osmf.media.MediaResourceBase;
import org.osmf.traits.LoadState;
import org.osmf.traits.LoadTrait;
import org.osmf.traits.LoaderBase;
import org.osmf.traits.MediaTraitType;
import org.osmf.utils.OSMFStrings;

public class LoadFromDocumentElement extends ProxyElement {


    private var _resource: MediaResourceBase;

    private var loadTrait: LoadFromDocumentLoadTrait;

    private var loader: LoaderBase;

    public function LoadFromDocumentElement(param1: MediaResourceBase = null, param2: LoaderBase = null) {
        super(null);
        this.loader = param2;
        this.resource = param1;
        if (param2 == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
        }
    }

    override public function set resource(param1: MediaResourceBase): void {
        if (this._resource != param1 && param1 != null) {
            this._resource = param1;
            this.loadTrait = new LoadFromDocumentLoadTrait(this.loader, this.resource);
            this.loadTrait.addEventListener(LoadEvent.LOAD_STATE_CHANGE, this.onLoadStateChange, false, int.MAX_VALUE);
            if (super.getTrait(MediaTraitType.LOAD) != null) {
                super.removeTrait(MediaTraitType.LOAD);
            }
            super.addTrait(MediaTraitType.LOAD, this.loadTrait);
        }
    }

    override public function get resource(): MediaResourceBase {
        return this._resource;
    }

    private function onLoaderStateChange(param1: Event): void {
        removeTrait(MediaTraitType.LOAD);
        proxiedElement = this.loadTrait.mediaElement;
    }

    private function onLoadStateChange(param1: LoadEvent): void {
        var proxiedLoadTrait: LoadTrait = null;
        var onProxiedElementLoadStateChange: Function = null;
        var var_6: LoadEvent = param1;
        if (var_6.loadState == LoadState.READY) {
            onProxiedElementLoadStateChange = function (param1: LoadEvent): void {
                if (param1.loadState == LoadState.LOADING) {
                    param1.stopImmediatePropagation();
                } else {
                    proxiedLoadTrait.removeEventListener(LoadEvent.LOAD_STATE_CHANGE, onProxiedElementLoadStateChange);
                }
            };
            var_6.stopImmediatePropagation();
            removeTrait(MediaTraitType.LOAD);
            proxiedLoadTrait = this.loadTrait.mediaElement.getTrait(MediaTraitType.LOAD) as LoadTrait;
            proxiedLoadTrait.addEventListener(LoadEvent.LOAD_STATE_CHANGE, onProxiedElementLoadStateChange, false, int.MAX_VALUE);
            proxiedElement = this.loadTrait.mediaElement;
            if (proxiedLoadTrait.loadState == LoadState.UNINITIALIZED) {
                proxiedLoadTrait.load();
            }
        }
    }
}
}
