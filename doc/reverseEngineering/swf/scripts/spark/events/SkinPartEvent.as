package spark.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class SkinPartEvent extends Event
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      public static const PART_ADDED:String = "partAdded";
      
      public static const PART_REMOVED:String = "partRemoved";
       
      
      public var instance:Object;
      
      public var partName:String;
      
      public function SkinPartEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:String = null, param5:Object = null)
      {
         super(param1,param2,param3);
         this.partName = param4;
         this.instance = param5;
      }
      
      override public function clone() : Event
      {
         return new SkinPartEvent(type,bubbles,cancelable,this.partName,this.instance);
      }
   }
}
