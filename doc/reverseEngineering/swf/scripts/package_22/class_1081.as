package package_22
{
   public class class_1081 extends class_168
   {
       
      
      private var var_3222:String;
      
      private var var_2641:int = 1;
      
      private var _offsetX:int = 0;
      
      private var _offsetY:int = 0;
      
      private var var_2985:String;
      
      public function class_1081(param1:int, param2:String, param3:String, param4:int, param5:int, param6:int, param7:String)
      {
         super(param1,param2);
         this.var_3222 = param3;
         this.var_2641 = param4 || true;
         this._offsetX = param5;
         this._offsetY = param6;
         this.var_2985 = param7;
      }
      
      public function get method_5349() : String
      {
         return this.var_3222;
      }
      
      public function get robotsNum() : int
      {
         return this.var_2641;
      }
      
      public function get offsetX() : int
      {
         return this._offsetX;
      }
      
      public function get offsetY() : int
      {
         return this._offsetY;
      }
      
      public function get asset3D() : String
      {
         return this.var_2985;
      }
   }
}
