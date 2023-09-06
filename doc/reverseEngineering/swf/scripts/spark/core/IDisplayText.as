package spark.core
{
   import flash.events.IEventDispatcher;
   
   public interface IDisplayText extends IEventDispatcher
   {
       
      
      function get text() : String;
      
      function set text(param1:String) : void;
      
      function get isTruncated() : Boolean;
   }
}
