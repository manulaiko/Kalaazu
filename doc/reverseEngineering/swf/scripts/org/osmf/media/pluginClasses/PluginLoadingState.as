package org.osmf.media.pluginClasses
{
   class PluginLoadingState
   {
      
      public static const LOADING:PluginLoadingState = new PluginLoadingState("Loading");
      
      public static const LOADED:PluginLoadingState = new PluginLoadingState("Loaded");
       
      
      private var _state:String;
      
      function PluginLoadingState(param1:String)
      {
         super();
         this._state = param1;
      }
      
      public function get state() : String
      {
         return this._state;
      }
   }
}
