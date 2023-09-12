package org.osmf.media.pluginClasses {

import org.osmf.media.MediaFactory;
import org.osmf.media.MediaResourceBase;
import org.osmf.media.PluginInfo;
import org.osmf.media.PluginInfoResource;
import org.osmf.traits.LoadState;
import org.osmf.traits.LoadTrait;

class StaticPluginLoader extends PluginLoader {


    function StaticPluginLoader(param1: MediaFactory, param2: String) {
        super(param1, param2);
    }

    override public function canHandleResource(param1: MediaResourceBase): Boolean {
        return param1 is PluginInfoResource;
    }

    override protected function executeLoad(param1: LoadTrait): void {
        updateLoadTrait(param1, LoadState.LOADING);
        var _loc2_: PluginInfoResource = param1.resource as PluginInfoResource;
        var _loc3_: PluginInfo = _loc2_.pluginInfo;
        loadFromPluginInfo(param1, _loc3_);
    }

    override protected function executeUnload(param1: LoadTrait): void {
        var _loc2_: PluginLoadTrait = param1 as PluginLoadTrait;
        var _loc3_: PluginInfo = _loc2_.pluginInfo;
        updateLoadTrait(param1, LoadState.UNLOADING);
        unloadFromPluginInfo(_loc3_);
        updateLoadTrait(param1, LoadState.UNINITIALIZED);
    }
}
}
