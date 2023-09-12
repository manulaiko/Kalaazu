package org.osmf.media {

import flash.events.EventDispatcher;
import flash.utils.Dictionary;

import org.osmf.elements.ProxyElement;
import org.osmf.events.MediaFactoryEvent;
import org.osmf.events.PluginManagerEvent;
import org.osmf.media.pluginClasses.PluginManager;
import org.osmf.utils.OSMFStrings;

public class MediaFactory extends EventDispatcher {


    private var pluginManager: PluginManager;

    private var allItems: Dictionary;

    public function MediaFactory() {
        super();
        this.allItems = new Dictionary();
    }

    private static function getItemsByResource(param1: MediaResourceBase, param2: Vector.<MediaFactoryItem>): Vector.<MediaFactoryItem> {
        var _loc4_: * = null;
        var _loc3_: Vector.<MediaFactoryItem> = new Vector.<MediaFactoryItem>();
        for each(_loc4_ in param2) {
            if (_loc4_.canHandleResourceFunction(param1)) {
                _loc3_.push(_loc4_);
            }
        }
        return _loc3_;
    }

    private static function getIndexOfItem(param1: String, param2: Vector.<MediaFactoryItem>): int {
        var _loc4_: * = null;
        var _loc3_: int = 0;
        while (_loc3_ < param2.length) {
            if ((_loc4_ = param2[_loc3_] as MediaFactoryItem).id == param1) {
                return _loc3_;
            }
            _loc3_++;
        }
        return -1;
    }

    public function addItem(param1: MediaFactoryItem): void {
        if (param1 == null || param1.id == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
        }
        var _loc2_: Vector.<MediaFactoryItem> = this.findOrCreateItems(param1.type);
        var _loc3_: int = getIndexOfItem(param1.id, _loc2_);
        if (_loc3_ != -1) {
            _loc2_[_loc3_] = param1;
        } else {
            _loc2_.push(param1);
        }
    }

    public function removeItem(param1: MediaFactoryItem): void {
        var _loc3_: int = 0;
        if (param1 == null || param1.id == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
        }
        var _loc2_: Vector.<MediaFactoryItem> = this.allItems[param1.type];
        if (_loc2_ != null) {
            _loc3_ = _loc2_.indexOf(param1);
            if (_loc3_ != -1) {
                _loc2_.splice(_loc3_, 1);
            }
        }
    }

    public function get numItems(): int {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc1_: int = 0;
        for each(_loc2_ in MediaFactoryItemType.ALL_TYPES) {
            _loc3_ = this.allItems[_loc2_];
            if (_loc3_ != null) {
                _loc1_ += _loc3_.length;
            }
        }
        return _loc1_;
    }

    public function getItemAt(param1: int): MediaFactoryItem {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc2_: * = null;
        if (param1 >= 0) {
            for each(_loc3_ in MediaFactoryItemType.ALL_TYPES) {
                if ((_loc4_ = this.allItems[_loc3_]) != null) {
                    if (param1 < _loc4_.length) {
                        _loc2_ = _loc4_[param1];
                        break;
                    }
                    param1 -= _loc4_.length;
                }
            }
        }
        return _loc2_;
    }

    public function getItemById(param1: String): MediaFactoryItem {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc2_: * = null;
        for each(_loc3_ in MediaFactoryItemType.ALL_TYPES) {
            if ((_loc4_ = this.allItems[_loc3_]) != null) {
                if ((_loc5_ = getIndexOfItem(param1, _loc4_)) != -1) {
                    _loc2_ = _loc4_[_loc5_];
                    break;
                }
            }
        }
        return _loc2_;
    }

    public function loadPlugin(param1: MediaResourceBase): void {
        this.createPluginManager();
        this.pluginManager.loadPlugin(param1);
    }

    public function createMediaElement(param1: MediaResourceBase): MediaElement {
        var _loc3_: * = null;
        this.createPluginManager();
        var _loc2_: MediaElement = this.createMediaElementByResource(param1, MediaFactoryItemType.STANDARD);
        if (_loc2_ != null) {
            _loc3_ = this.createMediaElementByResource(_loc2_.resource, MediaFactoryItemType.PROXY, _loc2_);
            _loc2_ = _loc3_ != null ? _loc3_ : _loc2_;
            dispatchEvent(new MediaFactoryEvent(MediaFactoryEvent.MEDIA_ELEMENT_CREATE, false, false, null, _loc2_));
        }
        return _loc2_;
    }

    protected function resolveItems(param1: MediaResourceBase, param2: Vector.<MediaFactoryItem>): MediaFactoryItem {
        var _loc5_: * = null;
        if (param1 == null || param2 == null) {
            return null;
        }
        var _loc3_: * = null;
        var _loc4_: int = 0;
        while (_loc4_ < param2.length) {
            if ((_loc5_ = param2[_loc4_] as MediaFactoryItem).id.indexOf("org.osmf") == -1) {
                return _loc5_;
            }
            if (_loc3_ == null) {
                _loc3_ = _loc5_;
            }
            _loc4_++;
        }
        return _loc3_;
    }

    private function findOrCreateItems(param1: String): Vector.<MediaFactoryItem> {
        if (this.allItems[param1] == null) {
            this.allItems[param1] = new Vector.<MediaFactoryItem>();
        }
        return this.allItems[param1] as Vector.<MediaFactoryItem>;
    }

    private function createMediaElementByResource(param1: MediaResourceBase, param2: String, param3: MediaElement = null): MediaElement {
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: int = 0;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc4_: * = null;
        var _loc5_: Vector.<MediaFactoryItem> = getItemsByResource(param1, this.allItems[param2]);
        if (param2 == MediaFactoryItemType.STANDARD) {
            if ((_loc6_ = this.resolveItems(param1, _loc5_) as MediaFactoryItem) != null) {
                _loc4_ = this.invokeMediaElementCreationFunction(_loc6_);
            }
        } else if (param2 == MediaFactoryItemType.PROXY) {
            _loc7_ = param3;
            _loc8_ = _loc5_.length;
            while (_loc8_ > 0) {
                _loc9_ = _loc5_[_loc8_ - 1] as MediaFactoryItem;
                if ((_loc10_ = this.invokeMediaElementCreationFunction(_loc9_) as ProxyElement) != null) {
                    _loc10_.proxiedElement = _loc7_;
                    _loc7_ = _loc10_;
                }
                _loc8_--;
            }
            _loc4_ = _loc7_;
        }
        if (_loc4_ != null) {
            _loc4_.resource = param1;
        }
        return _loc4_;
    }

    private function onPluginLoad(param1: PluginManagerEvent): void {
        dispatchEvent(new MediaFactoryEvent(MediaFactoryEvent.PLUGIN_LOAD, false, false, param1.resource));
    }

    private function onPluginLoadError(param1: PluginManagerEvent): void {
        dispatchEvent(new MediaFactoryEvent(MediaFactoryEvent.PLUGIN_LOAD_ERROR, false, false, param1.resource));
    }

    private function invokeMediaElementCreationFunction(param1: MediaFactoryItem): MediaElement {
        var item: MediaFactoryItem = param1;
        var mediaElement: MediaElement = null;
        try {
            mediaElement = item.mediaElementCreationFunction();
        } catch (error: Error) {
        }
        return mediaElement;
    }

    private function createPluginManager(): void {
        if (this.pluginManager == null) {
            this.pluginManager = new PluginManager(this);
            this.pluginManager.addEventListener(PluginManagerEvent.PLUGIN_LOAD, this.onPluginLoad);
            this.pluginManager.addEventListener(PluginManagerEvent.PLUGIN_LOAD_ERROR, this.onPluginLoadError);
        }
    }
}
}
