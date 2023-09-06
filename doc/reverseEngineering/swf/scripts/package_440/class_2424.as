package package_440
{
   import flash.events.Event;
   
   public class class_2424 extends Event
   {
      
      public static const FILE_LOADED:String = "fileLoaded";
       
      
      public var file:class_2601;
      
      public function class_2424(param1:String, param2:class_2601 = null, param3:Boolean = false, param4:Boolean = false)
      {
         this.file = param2;
         super(param1,param3,param4);
      }
      
      override public function clone() : Event
      {
         return new class_2424(type,this.file,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return "[FZipEvent type=\"" + type + "\" filename=\"" + this.file.method_4082 + "\" bubbles=" + bubbles + " cancelable=" + cancelable + " eventPhase=" + eventPhase + "]";
      }
   }
}
