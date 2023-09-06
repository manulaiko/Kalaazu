package mx.collections
{
   import mx.core.mx_internal;
   import mx.rpc.IResponder;
   
   public class ItemResponder implements IResponder
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var _resultHandler:Function;
      
      private var _faultHandler:Function;
      
      private var _token:Object;
      
      public function ItemResponder(param1:Function, param2:Function, param3:Object = null)
      {
         super();
         this._resultHandler = param1;
         this._faultHandler = param2;
         this._token = param3;
      }
      
      public function result(param1:Object) : void
      {
         this._resultHandler(param1,this._token);
      }
      
      public function fault(param1:Object) : void
      {
         this._faultHandler(param1,this._token);
      }
   }
}
