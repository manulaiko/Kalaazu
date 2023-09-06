package org.osmf.media.pluginClasses
{
   import flash.display.Loader;
   import org.osmf.media.MediaResourceBase;
   import org.osmf.media.PluginInfo;
   import org.osmf.traits.LoadTrait;
   import org.osmf.traits.LoaderBase;
   
   class PluginLoadTrait extends LoadTrait
   {
       
      
      private var _pluginInfo:PluginInfo;
      
      private var _loader:Loader;
      
      function PluginLoadTrait(param1:LoaderBase, param2:MediaResourceBase)
      {
         super(param1,param2);
      }
      
      public function get pluginInfo() : PluginInfo
      {
         return this._pluginInfo;
      }
      
      public function set pluginInfo(param1:PluginInfo) : void
      {
         this._pluginInfo = param1;
      }
      
      public function get loader() : Loader
      {
         return this._loader;
      }
      
      public function set loader(param1:Loader) : void
      {
         this._loader = param1;
      }
   }
}
