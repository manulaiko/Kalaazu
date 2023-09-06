package spark.events
{
   import flash.events.Event;
   
   public class LoaderInvalidationEvent extends Event
   {
      
      public static const INVALIDATE_LOADER:String = "invalidateLoader";
       
      
      public var content;
      
      public function LoaderInvalidationEvent(param1:String, param2:*)
      {
         super(param1);
         this.content = param2;
      }
      
      override public function clone() : Event
      {
         return new LoaderInvalidationEvent(type,this.content);
      }
   }
}
