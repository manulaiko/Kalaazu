package package_200
{
   import package_10.class_19;
   import package_10.class_2233;
   
   public class class_1781 extends class_1770
   {
      
      private static var var_242:int = 1;
       
      
      public const uid:int = var_242++;
      
      public const size:class_2233 = new class_2233(512);
      
      public const const_2024:class_19 = new class_19(true);
      
      public const const_2205:class_19 = new class_19(true);
      
      public const const_556:class_19 = new class_19(true);
      
      public const smoothing:class_19 = new class_19(true);
      
      public const mipMapping:class_19 = new class_19(true);
      
      public function class_1781(param1:uint, param2:Boolean, param3:Boolean)
      {
         super();
         this.size.value = param1;
         this.smoothing.value = param2;
         this.mipMapping.value = param3;
      }
      
      public function save(param1:Object) : void
      {
         param1.version = 2;
         param1.size = this.size.value;
         param1.smoothing = this.smoothing.value;
         param1.mipMapping = this.mipMapping.value;
      }
      
      public function method_3921(param1:Object) : void
      {
         var _loc2_:uint = uint(param1.version);
         if(_loc2_ == 1)
         {
            this.size.value = method_983(param1.textureSize,this.size.value);
         }
         else if(_loc2_ == 2)
         {
            this.size.value = method_983(param1.size,this.size.value);
         }
         this.smoothing.value = param1.smoothing === undefined ? true : Boolean(param1.smoothing);
         this.mipMapping.value = param1.mipMapping === undefined ? true : Boolean(param1.mipMapping);
      }
   }
}
