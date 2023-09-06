package net.bigpoint.darkorbit.fui.system.loader
{
   import net.bigpoint.darkorbit.fui.system.loader.parser.IUILoaderLibParser;
   
   public interface IUISystemLoader extends IAssetLoader
   {
       
      
      function addParser(param1:String, param2:IUILoaderLibParser) : void;
      
      function loadAndCall(param1:Object, param2:String = "xml", param3:Function = null, param4:Array = null) : void;
      
      function set assetLoader(param1:IAssetLoader) : void;
      
      function get assetLoader() : IAssetLoader;
   }
}
