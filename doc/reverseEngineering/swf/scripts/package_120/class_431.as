package package_120
{
   import com.bigpoint.utils.class_73;
   import flash.geom.Rectangle;
   import package_10.class_1173;
   import package_10.class_1179;
   import package_10.class_19;
   import package_10.class_20;
   import package_29.class_85;
   
   public class class_431 extends class_85
   {
      
      public static const const_2513:String = "NOA";
      
      public static const const_1780:String = "HEA";
      
      public static const const_1212:String = "TRG";
      
      public static const const_32:String = "DMG";
      
      public static const const_62:String = "RAD";
      
      public static const const_1104:String = "HZ";
      
      public static const const_16:String = "SZ";
      
      public static const const_2821:String = "BST";
      
      public static const const_1709:String = "AZ";
      
      public static const const_1881:String = "AZO";
      
      public static const const_1382:String = "EQ";
      
      public static const const_941:String = "CAMERA";
      
      public static const const_1783:String = "CIR";
      
      public static const const_900:String = "REC";
      
      public static const const_2027:String = "POL";
      
      public static const const_1304:uint = 384;
      
      private static const const_2337:Vector.<String> = Vector.<String>([const_2821,const_1104,const_16,const_62,const_1881]);
       
      
      public const zoneTypeSpecification:class_1173 = new class_1173();
      
      public const zoneTargetTypeSpecification:class_1173 = new class_1173();
      
      private var var_1990:String;
      
      private var var_897:int;
      
      private var var_2635:Boolean;
      
      private var _bounds:Rectangle;
      
      private var var_2275:class_20;
      
      private var _rotationSpeed:class_1179;
      
      private var _scaling:class_1179;
      
      private var _pulseSpeed:class_1179;
      
      private var _movingSpeedX:class_1179;
      
      private var _movingSpeedY:class_1179;
      
      private var var_2842:class_19;
      
      public function class_431(param1:int, param2:class_73, param3:String, param4:Boolean, param5:int, param6:Rectangle)
      {
         this.var_2275 = new class_20(100000);
         this._rotationSpeed = new class_1179(0);
         this._scaling = new class_1179(0);
         this._pulseSpeed = new class_1179(0);
         this._movingSpeedX = new class_1179(0);
         this._movingSpeedY = new class_1179(0);
         super(param1,param2);
         this.var_1990 = param3;
         this.var_897 = param5;
         this.var_2635 = param4;
         this._bounds = param6;
         addTrait(new class_1494());
      }
      
      public function get method_3350() : int
      {
         return this.var_897;
      }
      
      public function get name_149() : Boolean
      {
         return this.var_2635;
      }
      
      public function get method_807() : String
      {
         return this.var_1990;
      }
      
      public function get bounds() : Rectangle
      {
         return this._bounds;
      }
      
      protected function method_5472() : Boolean
      {
         return const_2337.indexOf(this.method_807) != -1 || this.method_3350 > 0 && this.method_807 == const_2513;
      }
      
      public function get method_4219() : class_20
      {
         return this.var_2275;
      }
      
      public function get rotationSpeed() : class_1179
      {
         return this._rotationSpeed;
      }
      
      public function get scaling() : class_1179
      {
         return this._scaling;
      }
      
      public function get pulseSpeed() : class_1179
      {
         return this._pulseSpeed;
      }
      
      public function get useCustomShader() : class_19
      {
         return this.var_2842;
      }
      
      public function set useCustomShader(param1:class_19) : void
      {
         this.var_2842 = param1;
      }
      
      public function get movingSpeedX() : class_1179
      {
         return this._movingSpeedX;
      }
      
      public function get movingSpeedY() : class_1179
      {
         return this._movingSpeedY;
      }
   }
}
