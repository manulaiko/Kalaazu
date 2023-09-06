package package_184
{
   public class class_1654
   {
      
      public static const const_1328:uint = 0;
      
      public static const const_474:uint = 1;
      
      public static const const_2032:uint = 2;
       
      
      private var var_1374:uint;
      
      private var var_2444:String;
      
      private var var_725:int;
      
      private var var_3273:int;
      
      private var var_4467:String;
      
      private var var_3906:String;
      
      private var _rewards:Vector.<Vector.<String>>;
      
      public function class_1654(param1:uint, param2:String, param3:int, param4:int, param5:String, param6:String, param7:Vector.<Vector.<String>>)
      {
         super();
         this.var_1374 = param1;
         this.var_2444 = param2;
         this.var_725 = param3;
         this.var_3273 = param4;
         this.var_4467 = param5;
         this.var_3906 = param6;
         this._rewards = param7;
      }
      
      public function get method_2733() : uint
      {
         return this.var_1374;
      }
      
      public function get name_158() : String
      {
         return this.var_2444;
      }
      
      public function get method_3326() : int
      {
         return this.var_725;
      }
      
      public function get method_4396() : int
      {
         return this.var_3273;
      }
      
      public function get method_6194() : String
      {
         return this.var_4467;
      }
      
      public function get method_277() : String
      {
         return this.var_3906;
      }
      
      public function get rewards() : Vector.<Vector.<String>>
      {
         return this._rewards;
      }
   }
}
