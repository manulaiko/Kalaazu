package package_124
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.net.class_112;
   import net.bigpoint.darkorbit.net.class_1486;
   import net.bigpoint.darkorbit.net.class_74;
   import package_37.class_170;
   import package_38.class_603;
   import package_45.class_1805;
   import package_9.class_50;
   
   public class class_1403 extends class_170
   {
       
      
      public function class_1403()
      {
         super();
      }
      
      public static function run(param1:class_603) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         switch(param1.var_2632)
         {
            case class_126.const_1952:
               _loc2_ = ["0",class_74.const_74,class_74.const_3307,class_74.const_3166,param1.var_2632,param1.var_4266];
               for each(_loc4_ in param1.var_21)
               {
                  _loc2_.push(_loc4_);
               }
               class_112.getInstance().method_3891(_loc2_);
               break;
            case class_126.const_1361:
               _loc3_ = class_50.getInstance().map.method_327(param1.var_4266) as class_1805;
               if(_loc3_)
               {
                  _loc3_.method_3779();
                  break;
               }
               break;
            default:
               class_1486.getInstance().method_1485(param1);
         }
      }
   }
}
