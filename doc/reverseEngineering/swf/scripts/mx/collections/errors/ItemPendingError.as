package mx.collections.errors
{
   import mx.core.mx_internal;
   import mx.rpc.IResponder;
   
   public class ItemPendingError extends Error
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var _responders:Array;
      
      public function ItemPendingError(param1:String)
      {
         super(param1);
      }
      
      public function get responders() : Array
      {
         return this._responders;
      }
      
      public function addResponder(param1:IResponder) : void
      {
         if(!this._responders)
         {
            this._responders = [];
         }
         this._responders.push(param1);
      }
   }
}
