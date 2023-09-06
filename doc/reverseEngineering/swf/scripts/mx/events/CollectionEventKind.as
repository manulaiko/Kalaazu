package mx.events
{
   import mx.core.mx_internal;
   
   public final class CollectionEventKind
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      public static const ADD:String = "add";
      
      public static const MOVE:String = "move";
      
      public static const REFRESH:String = "refresh";
      
      public static const REMOVE:String = "remove";
      
      public static const REPLACE:String = "replace";
      
      mx_internal static const EXPAND:String = "expand";
      
      public static const RESET:String = "reset";
      
      public static const UPDATE:String = "update";
       
      
      public function CollectionEventKind()
      {
         super();
      }
   }
}
