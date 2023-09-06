package package_184
{
   public class class_2283
   {
      
      public static const const_2863:int = 0;
      
      public static const const_2666:int = 1;
       
      
      private var _message:String;
      
      private var _duration:uint;
      
      private var var_1773:int;
      
      private var var_2321:int;
      
      public function class_2283(param1:String, param2:uint, param3:int = 0, param4:int = -1)
      {
         super();
         this.var_2321 = param4;
         this.var_1773 = param3;
         this._duration = param2;
         this._message = param1;
      }
      
      public static function method_6348(param1:class_2283, param2:class_2283) : int
      {
         return Number(param2.method_2152) - Number(param1.method_2152);
      }
      
      public function get duration() : uint
      {
         return this._duration;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get method_2152() : int
      {
         return this.var_1773;
      }
      
      public function toString() : String
      {
         return "message:" + this._message + " duration:" + this._duration + " prio:" + this.var_1773 + "\n";
      }
      
      public function get soundID() : int
      {
         return this.var_2321;
      }
   }
}
