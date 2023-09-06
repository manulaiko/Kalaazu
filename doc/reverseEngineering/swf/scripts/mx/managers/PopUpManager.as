package mx.managers
{
   import flash.display.DisplayObject;
   import mx.core.IFlexDisplayObject;
   import mx.core.IFlexModuleFactory;
   import mx.core.Singleton;
   import mx.core.mx_internal;
   
   public class PopUpManager
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static var implClassDependency:PopUpManagerImpl;
      
      private static var _impl:IPopUpManager;
       
      
      public function PopUpManager()
      {
         super();
      }
      
      private static function get impl() : IPopUpManager
      {
         if(!_impl)
         {
            _impl = IPopUpManager(Singleton.getInstance("mx.managers::IPopUpManager"));
         }
         return _impl;
      }
      
      public static function createPopUp(param1:DisplayObject, param2:Class, param3:Boolean = false, param4:String = null, param5:IFlexModuleFactory = null) : IFlexDisplayObject
      {
         return impl.createPopUp(param1,param2,param3,param4,param5);
      }
      
      public static function addPopUp(param1:IFlexDisplayObject, param2:DisplayObject, param3:Boolean = false, param4:String = null, param5:IFlexModuleFactory = null) : void
      {
         impl.addPopUp(param1,param2,param3,param4,param5);
      }
      
      public static function centerPopUp(param1:IFlexDisplayObject) : void
      {
         impl.centerPopUp(param1);
      }
      
      public static function removePopUp(param1:IFlexDisplayObject) : void
      {
         impl.removePopUp(param1);
      }
      
      public static function bringToFront(param1:IFlexDisplayObject) : void
      {
         impl.bringToFront(param1);
      }
   }
}
