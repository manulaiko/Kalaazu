package package_22
{
   public class FullResourcePattern
   {
       
      
      private var _id:int;
      
      private var var_4247:String;
      
      private var _resKey:String;
      
      private var var_1579:String;
      
      public function FullResourcePattern(param1:int, param2:String, param3:String, param4:String = null)
      {
         super();
         this._id = param1;
         this.var_4247 = param2;
         this._resKey = param3;
         this.var_1579 = param4;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get srcKey() : String
      {
         return this.var_4247;
      }
      
      public function get resKey() : String
      {
         return this._resKey;
      }
      
      public function toString() : String
      {
         return "FullResourcePattern" + ["id",this._id,"scr",this.var_4247,"res",this._resKey];
      }
      
      public function get method_5986() : String
      {
         return this.var_1579;
      }
   }
}
