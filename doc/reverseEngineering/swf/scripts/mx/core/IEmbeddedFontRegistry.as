package mx.core
{
   import mx.managers.ISystemManager;
   
   public interface IEmbeddedFontRegistry
   {
       
      
      function registerFont(param1:EmbeddedFont, param2:IFlexModuleFactory) : void;
      
      function deregisterFont(param1:EmbeddedFont, param2:IFlexModuleFactory) : void;
      
      function isFontRegistered(param1:EmbeddedFont, param2:IFlexModuleFactory) : Boolean;
      
      function getAssociatedModuleFactory(param1:String, param2:Boolean, param3:Boolean, param4:Object, param5:IFlexModuleFactory, param6:ISystemManager, param7:* = undefined) : IFlexModuleFactory;
      
      function getFonts() : Array;
      
      function getFontStyle(param1:Boolean, param2:Boolean) : String;
   }
}
