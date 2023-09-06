package package_116
{
   import com.bigpoint.utils.class_73;
   import flash.utils.Dictionary;
   
   public class class_397
   {
      
      public static const STANDARD:int = 0;
      
      public static const const_3158:int = 1;
      
      public static const const_1290:int = 2;
      
      public static const const_2193:int = 3;
      
      public static const const_633:int = 4;
      
      public static const const_732:int = 5;
      
      public static const const_2725:int = 6;
      
      public static const DIAMOND:int = 7;
      
      public static const const_2296:int = 8;
      
      public static const const_375:int = 9;
      
      public static const const_1777:int = 10;
      
      public static const const_631:int = 11;
      
      public static const const_1865:int = 12;
      
      public static const BAT:int = 13;
      
      public static const const_2478:int = 14;
      
      public static const X:int = 42;
      
      public static var var_63:Dictionary = new Dictionary(true);
      
      public static var var_912:Dictionary = new Dictionary(true);
       
      
      private var var_4681:Array;
      
      public var var_4773:Array;
      
      public var scale:Number;
      
      public var id:int;
      
      public var name:String;
      
      public var rotationGroups:Array;
      
      public function class_397(param1:Array, param2:Array, param3:Number, param4:int, param5:String)
      {
         this.var_4681 = [];
         this.var_4773 = [];
         super();
         this.var_4681 = param1;
         this.var_4773 = param2;
         this.scale = param3;
         this.id = param4;
         this.name = param5;
      }
      
      public function method_4473(param1:int, param2:int) : class_73
      {
         return this.var_4681[this.var_4773[param1][param2] - 1] as class_73;
      }
   }
}
