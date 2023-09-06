package package_440
{
   import flash.events.Event;
   
   public class class_2600 extends Event
   {
      
      public static const PARSE_ERROR:String = "parseError";
       
      
      public var text:String;
      
      public function class_2600(param1:String, param2:String = "", param3:Boolean = false, param4:Boolean = false)
      {
         this.text = param2;
         super(param1,param3,param4);
      }
      
      override public function clone() : Event
      {
         return new class_2600(type,this.text,bubbles,cancelable);
      }
   }
}
