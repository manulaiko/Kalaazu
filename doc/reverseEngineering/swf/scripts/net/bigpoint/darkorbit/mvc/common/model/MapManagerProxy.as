package net.bigpoint.darkorbit.mvc.common.model
{
   import flash.events.Event;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.mvc.gui.abstract.model.DOAbstractProxy;
   import package_11.class_262;
   import package_76.XMLUtils;
   import package_9.ResourceManager;
   
   public class MapManagerProxy extends DOAbstractProxy
   {
      
      public static const NAME:String = "MapManagerProxy";
       
      
      private var _loader:URLLoader;
      
      private var _callback:Function;
      
      private var _dynamicMapsXML:XML;
      
      public function MapManagerProxy()
      {
         super(NAME);
      }
      
      public function loadConfig(param1:String, param2:Function = null) : void
      {
         this._callback = param2;
         this._loader = new URLLoader();
         this._loader.addEventListener(Event.COMPLETE,this.handleDynamicConfigLoadComplete);
         this._loader.load(new URLRequest(param1));
      }
      
      private function handleDynamicConfigLoadComplete(param1:Event) : void
      {
         this._dynamicMapsXML = new XML(this._loader.data);
         this._loader.removeEventListener(Event.COMPLETE,this.handleDynamicConfigLoadComplete);
         this._loader.close();
         this._loader = null;
         ResourceManager.name_15.load("maps-config",this.handleStaticMapsXMLLoaded);
      }
      
      private function handleStaticMapsXMLLoaded(param1:class_262) : void
      {
         class_90.init(this._dynamicMapsXML,XMLUtils.method_5922(param1.method_4925()));
         this._dynamicMapsXML = null;
         param1.dispose();
         this._callback();
         this._callback = null;
      }
   }
}
