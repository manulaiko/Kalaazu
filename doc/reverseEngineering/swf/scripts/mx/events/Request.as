package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class Request extends Event
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      public static const GET_PARENT_FLEX_MODULE_FACTORY_REQUEST:String = "getParentFlexModuleFactoryRequest";
       
      
      public var value:Object;
      
      public function Request(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Object = null)
      {
         super(param1,param2,param3);
         this.value = param4;
      }
      
      override public function clone() : Event
      {
         return new Request(type,bubbles,cancelable,this.value);
      }
   }
}
