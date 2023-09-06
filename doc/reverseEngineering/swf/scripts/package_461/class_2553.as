package package_461
{
   import flash.events.Event;
   
   public class class_2553 extends Event
   {
      
      public static var UPDATE:String = "update";
       
      
      public var time:Number;
      
      public function class_2553(param1:String, param2:Number = NaN, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.time = param2;
      }
      
      override public function clone() : Event
      {
         return new class_2553(type,this.time,bubbles,cancelable);
      }
   }
}
