package mx.core {

import flash.events.IEventDispatcher;
import flash.events.IOErrorEvent;
import flash.system.ApplicationDomain;

import mx.events.ResourceEvent;
import mx.resources.IResourceManager;

public class ResourceModuleRSLItem extends RSLItem {

    mx_internal static const VERSION: String = "4.6.0.23201";

    public static var resourceManager: IResourceManager;


    private var appDomain: ApplicationDomain;

    public function ResourceModuleRSLItem(param1: String, param2: ApplicationDomain) {
        super(param1);
        this.appDomain = param2;
    }

    override public function load(param1: Function, param2: Function, param3: Function, param4: Function, param5: Function): void {
        var _loc7_: * = null;
        chainedProgressHandler = param1;
        chainedCompleteHandler = param2;
        chainedIOErrorHandler = param3;
        chainedSecurityErrorHandler = param4;
        chainedRSLErrorHandler = param5;
        if (!resourceManager) {
            if (!this.appDomain.hasDefinition("mx.resources::ResourceManager")) {
                return;
            }
            _loc7_ = Class(this.appDomain.getDefinition("mx.resources::ResourceManager"));
            resourceManager = IResourceManager(_loc7_["getInstance"]());
        }
        var _loc6_: IEventDispatcher;
        (_loc6_ = resourceManager.loadResourceModule(url)).addEventListener(ResourceEvent.PROGRESS, itemProgressHandler);
        _loc6_.addEventListener(ResourceEvent.COMPLETE, itemCompleteHandler);
        _loc6_.addEventListener(ResourceEvent.ERROR, this.resourceErrorHandler);
    }

    private function resourceErrorHandler(param1: ResourceEvent): void {
        var _loc2_: IOErrorEvent = new IOErrorEvent(IOErrorEvent.IO_ERROR);
        _loc2_.text = param1.errorText;
        super.itemErrorHandler(_loc2_);
    }
}
}
