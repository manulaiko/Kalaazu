package package_226
{
   import package_37.class_170;
   import package_38.class_445;
   import package_38.class_786;
   import package_45.class_1820;
   import package_9.class_50;
   
   public class class_1355 extends class_170
   {
       
      
      public function class_1355()
      {
         super();
      }
      
      public static function run(param1:class_786) : void
      {
         var _loc2_:* = null;
         if(param1.type.var_2008 == class_445.const_3251)
         {
            _loc2_ = new class_1820(param1.uid,param1.x,param1.y,param1.var_448.var_2008);
            class_50.getInstance().map.method_4903(_loc2_);
         }
      }
   }
}
