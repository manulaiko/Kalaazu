package package_124
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.net.class_116;
   import package_35.class_338;
   import package_37.class_170;
   import package_38.class_744;
   import package_9.class_50;
   
   public class class_1417 extends class_170
   {
       
      
      public function class_1417()
      {
         super();
      }
      
      public static function run(param1:class_744) : void
      {
         var _loc2_:int = 0;
         switch(param1.var_2632)
         {
            case class_126.const_437:
               for each(_loc2_ in param1.var_21)
               {
                  class_116.getInstance().method_5080(["0","n","MAL","REM",_loc2_]);
               }
               break;
            case class_126.const_3104:
               for each(_loc2_ in param1.var_21)
               {
                  class_50.getInstance().map.effects.method_3217(_loc2_,class_338.const_1085);
               }
         }
      }
   }
}
