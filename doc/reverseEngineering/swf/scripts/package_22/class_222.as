package package_22
{
   public class class_222 extends class_221
   {
      
      public static const const_273:int = 0;
      
      public static const const_1974:int = 1;
      
      public static const const_964:int = 2;
      
      public static const const_2635:int = 3;
      
      public static const const_2465:int = 4;
      
      public static const const_1011:int = 5;
       
      
      private var var_5036:Boolean;
      
      private var var_1719:int = -1;
      
      private var var_1483:Boolean;
      
      private var var_1179:Boolean;
      
      private var var_4274:Boolean = true;
      
      private var var_4834:int;
      
      public function class_222(param1:int, param2:int, param3:String, param4:Boolean)
      {
         super(param2,param3);
         this.var_4834 = param1;
         this.var_4274 = param4;
      }
      
      public function get useBitmapClip() : Boolean
      {
         return this.var_5036;
      }
      
      public function get precache() : Boolean
      {
         return this.var_1483;
      }
      
      public function get rotatable() : Boolean
      {
         return this.var_1179;
      }
      
      public function get shockwaveId() : int
      {
         return this.var_1719;
      }
      
      public function get method_2768() : int
      {
         return this.var_4834;
      }
      
      public function set useBitmapClip(param1:Boolean) : void
      {
         this.var_5036 = param1;
      }
      
      public function set precache(param1:Boolean) : void
      {
         this.var_1483 = param1;
      }
      
      public function set rotatable(param1:Boolean) : void
      {
         this.var_1179 = param1;
      }
      
      public function set shockwaveId(param1:int) : void
      {
         this.var_1719 = param1;
      }
      
      public function get has3D() : Boolean
      {
         return this.var_4274;
      }
   }
}
