package package_174
{
   import com.bigpoint.utils.class_129;
   
   public class class_1060
   {
       
      
      private var var_1008:int = 0;
      
      private var var_2013:int = 0;
      
      private var var_1006:int = 0;
      
      private var _status:uint = 0;
      
      private var var_4368:Number = 0;
      
      private var var_1970:Number = 0;
      
      private var var_3264:String = "";
      
      private var var_2508:String = "";
      
      private var var_1369:int;
      
      private var var_2648:Number;
      
      public function class_1060(param1:int, param2:int, param3:int, param4:uint, param5:Number, param6:Number, param7:String, param8:String, param9:int)
      {
         super();
         this.var_1008 = param1;
         this.var_2013 = param2;
         this.var_1006 = param3;
         this._status = param4;
         this.var_4368 = param5;
         this.var_1970 = param6;
         this.var_3264 = param7;
         this.var_2508 = param8;
         this.var_1369 = param9;
         this.var_2648 = new Date().getTime();
      }
      
      public function get mapId() : int
      {
         return this.var_1008;
      }
      
      public function get name_146() : int
      {
         return this.var_2013;
      }
      
      public function get name_102() : int
      {
         return this.var_1006;
      }
      
      public function get status() : uint
      {
         return this._status;
      }
      
      public function get clanName() : String
      {
         return this.var_3264;
      }
      
      public function get name_8() : String
      {
         return this.var_2508;
      }
      
      public function get method_3318() : int
      {
         return this.var_1369;
      }
      
      public function get name_135() : Number
      {
         return this.var_4368;
      }
      
      public function get method_3701() : String
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         if(this.var_4368)
         {
            _loc1_ = new Date().getTime() - Number(this.var_2648);
            _loc2_ = this.var_1970 + _loc1_;
            _loc3_ = int(_loc2_ / 60000);
            return class_129.method_3157(_loc3_,true);
         }
         return "-";
      }
   }
}
