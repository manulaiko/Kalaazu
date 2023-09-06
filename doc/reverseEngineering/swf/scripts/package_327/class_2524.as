package package_327
{
   public class class_2524
   {
       
      
      private var var_3643:Vector.<int>;
      
      private var var_1310:int;
      
      private var var_2967:int;
      
      private var var_323:Boolean;
      
      private var _active:Boolean;
      
      public function class_2524(param1:Vector.<int>)
      {
         super();
         this.var_3643 = param1;
      }
      
      public function get counter() : int
      {
         return this.var_1310;
      }
      
      public function set counter(param1:int) : void
      {
         this.var_1310 = param1;
      }
      
      public function get method_1078() : int
      {
         return this.var_2967;
      }
      
      public function set method_1078(param1:int) : void
      {
         this.var_2967 = param1;
      }
      
      public function get method_217() : Boolean
      {
         return this.var_323;
      }
      
      public function set method_217(param1:Boolean) : void
      {
         this.var_323 = param1;
      }
      
      public function method_2098(param1:int) : Boolean
      {
         var _loc2_:int = int(this.var_3643.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.var_3643[_loc3_] == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function get method_4796() : Vector.<int>
      {
         return this.var_3643;
      }
      
      public function set active(param1:Boolean) : void
      {
         this._active = param1;
      }
      
      public function get active() : Boolean
      {
         return this._active;
      }
   }
}
