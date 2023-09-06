package net.bigpoint.darkorbit.map.model.traits
{
   import package_10.class_20;
   import package_29.class_267;
   import package_38.class_930;
   
   public class class_287 extends class_267
   {
      
      public static const const_1101:int = 1;
      
      public static const const_914:int = 2;
      
      public static const const_1969:int = 3;
      
      public static const const_2607:int = 4;
       
      
      public const lockType:class_20 = new class_20(const_1101);
      
      public var explosionTypeID:int = -1;
      
      public function class_287(param1:int = 1, param2:int = -1)
      {
         super();
         this.lockType.value = param1;
         this.explosionTypeID = param2;
      }
      
      public static function method_5240(param1:int) : int
      {
         switch(param1)
         {
            case class_930.const_425:
            case class_930.NONE:
               return const_1101;
            case class_930.const_1930:
               return const_2607;
            case class_930.const_754:
               return const_914;
            default:
               return const_1101;
         }
      }
   }
}
