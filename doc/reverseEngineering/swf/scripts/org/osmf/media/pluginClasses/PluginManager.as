package org.osmf.media.pluginClasses {

import flash.events.EventDispatcher;
import flash.utils.Dictionary;

import org.osmf.events.LoadEvent;
import org.osmf.events.MediaErrorEvent;
import org.osmf.events.MediaFactoryEvent;
import org.osmf.events.PluginManagerEvent;
import org.osmf.media.MediaElement;
import org.osmf.media.MediaFactory;
import org.osmf.media.MediaFactoryItem;
import org.osmf.media.MediaResourceBase;
import org.osmf.media.PluginInfoResource;
import org.osmf.media.URLResource;
import org.osmf.traits.LoadState;
import org.osmf.traits.LoadTrait;
import org.osmf.traits.MediaTraitType;
import org.osmf.utils.OSMFStrings;
import org.osmf.utils.Version;

public class PluginManager extends EventDispatcher {

    private static const STATIC_PLUGIN_MEDIA_INFO_ID: String = "org.osmf.plugins.StaticPluginLoader";

    private static const DYNAMIC_PLUGIN_MEDIA_INFO_ID: String = "org.osmf.plugins.DynamicPluginLoader";


    private var _mediaFactory: MediaFactory;

    private var _pluginFactory: MediaFactory;

    private var _pluginMap: Dictionary;

    private var _pluginList: Vector.<PluginEntry>;

    private var notificationFunctions: Vector.<Function>;

    private var createdElements: Dictionary;

    private var minimumSupportedFrameworkVersion: String;

    private var staticPluginLoader: StaticPluginLoader;

    private var dynamicPluginLoader: DynamicPluginLoader;

    public function PluginManager(param1: MediaFactory) {
        super();
        this._mediaFactory = param1;
        this._mediaFactory.addEventListener(MediaFactoryEvent.MEDIA_ELEMENT_CREATE, this.onMediaElementCreate);
        this.minimumSupportedFrameworkVersion = Version.lastAPICompatibleVersion;
        this.initPluginFactory();
        this._pluginMap = new Dictionary();
        this._pluginList = new Vector.<PluginEntry>();
    }

    public function loadPlugin(param1: MediaResourceBase): void {
        var identifier: Object = null;
        var pluginEntry: PluginEntry = null;
        var onLoadStateChange: Function = null;
        var onMediaError: Function = null;
        var pluginElement: MediaElement = null;
        var loadTrait: LoadTrait = null;
        var resource: MediaResourceBase = param1;
        onLoadStateChange = function (param1: LoadEvent): void {
            var _loc2_: * = null;
            if (param1.loadState == LoadState.READY) {
                pluginEntry.state = PluginLoadingState.LOADED;
                _pluginList.push(pluginEntry);
                _loc2_ = pluginElement.getTrait(MediaTraitType.LOAD) as PluginLoadTrait;
                if (_loc2_.pluginInfo.mediaElementCreationNotificationFunction != null) {
                    invokeMediaElementCreationNotificationForCreatedMediaElements(_loc2_.pluginInfo.mediaElementCreationNotificationFunction);
                    if (notificationFunctions == null) {
                        notificationFunctions = new Vector.<Function>();
                    }
                    notificationFunctions.push(_loc2_.pluginInfo.mediaElementCreationNotificationFunction);
                }
                dispatchEvent(new PluginManagerEvent(PluginManagerEvent.PLUGIN_LOAD, false, false, resource));
            } else if (param1.loadState == LoadState.LOAD_ERROR) {
                delete _pluginMap[identifier];
                dispatchEvent(new PluginManagerEvent(PluginManagerEvent.PLUGIN_LOAD_ERROR, false, false, resource));
            }
        };
        onMediaError = function (param1: MediaErrorEvent): void {
            dispatchEvent(param1.clone());
        };
        if (resource == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
        }
        identifier = this.getPluginIdentifier(resource);
        pluginEntry = this._pluginMap[identifier] as PluginEntry;
        if (pluginEntry != null) {
            dispatchEvent(new PluginManagerEvent(PluginManagerEvent.PLUGIN_LOAD, false, false, resource));
        } else {
            pluginElement = this._pluginFactory.createMediaElement(resource);
            if (pluginElement != null) {
                pluginEntry = new PluginEntry(pluginElement, PluginLoadingState.LOADING);
                this._pluginMap[identifier] = pluginEntry;
                loadTrait = pluginElement.getTrait(MediaTraitType.LOAD) as LoadTrait;
                if (loadTrait != null) {
                    loadTrait.addEventListener(LoadEvent.LOAD_STATE_CHANGE, onLoadStateChange);
                    loadTrait.addEventListener(MediaErrorEvent.MEDIA_ERROR, onMediaError);
                    loadTrait.load();
                } else {
                    dispatchEvent(new PluginManagerEvent(PluginManagerEvent.PLUGIN_LOAD_ERROR, false, false, resource));
                }
            } else {
                dispatchEvent(new PluginManagerEvent(PluginManagerEvent.PLUGIN_LOAD_ERROR, false, false, resource));
            }
        }
    }

    public function get mediaFactory(): MediaFactory {
        return this._mediaFactory;
    }

    private function getPluginIdentifier(param1: MediaResourceBase): Object {
        var _loc2_: * = null;
        if (param1 is URLResource) {
            _loc2_ = (param1 as URLResource).url;
        } else if (param1 is PluginInfoResource) {
            _loc2_ = (param1 as PluginInfoResource).pluginInfo;
        }
        return _loc2_;
    }

    private function initPluginFactory(): void {
        this._pluginFactory = new MediaFactory();
        this.staticPluginLoader = new StaticPluginLoader(this.mediaFactory, this.minimumSupportedFrameworkVersion);
        this.dynamicPluginLoader = new DynamicPluginLoader(this.mediaFactory, this.minimumSupportedFrameworkVersion);
        var _loc1_: MediaFactoryItem = new MediaFactoryItem(STATIC_PLUGIN_MEDIA_INFO_ID, this.staticPluginLoader.canHandleResource, this.createStaticPluginElement);
        this._pluginFactory.addItem(_loc1_);
        var _loc2_: MediaFactoryItem = new MediaFactoryItem(DYNAMIC_PLUGIN_MEDIA_INFO_ID, this.dynamicPluginLoader.canHandleResource, this.createDynamicPluginElement);
        this._pluginFactory.addItem(_loc2_);
    }

    private function createStaticPluginElement(): MediaElement {
        return new PluginElement(this.staticPluginLoader);
    }

    private function createDynamicPluginElement(): MediaElement {
        return new PluginElement(this.dynamicPluginLoader);
    }

    private function onMediaElementCreate(param1: MediaFactoryEvent): void {
        this.invokeMediaElementCreationNotifications(param1.mediaElement);
        if (this.createdElements == null) {
            this.createdElements = new Dictionary(true);
        }
        this.createdElements[param1.mediaElement] = true;
    }

    private function invokeMediaElementCreationNotifications(param1: MediaElement): void {
        var _loc2_: * = null;
        for each(_loc2_ in this.notificationFunctions) {
            this.invokeMediaElementCreationNotificationFunction(_loc2_, param1);
        }
    }

    private function invokeMediaElementCreationNotificationFunction(param1: Function, param2: MediaElement): void {
        var func: Function = param1;
        var mediaElement: MediaElement = param2;
        try {
            func.call(null, mediaElement);
        } catch (error: Error) {
        }
    }

    private function invokeMediaElementCreationNotificationForCreatedMediaElements(param1: Function): void {
        var _loc2_: * = null;
        for (_loc2_ in this.createdElements) {
            this.invokeMediaElementCreationNotificationFunction(param1, _loc2_ as MediaElement);
        }
    }
}
}
