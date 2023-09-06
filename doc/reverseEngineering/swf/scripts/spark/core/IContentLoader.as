package spark.core
{
   import flash.events.IEventDispatcher;
   
   public interface IContentLoader extends IEventDispatcher
   {
       
      
      function load(param1:Object, param2:String = null) : ContentRequest;
   }
}
