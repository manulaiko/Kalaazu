package package_208
{
   import net.bigpoint.darkorbit.class_81;
   import package_38.class_455;
   import package_72.class_190;
   
   public class class_1324 extends class_1231
   {
       
      
      public function class_1324()
      {
         super();
      }
      
      public static function run(param1:class_455) : void
      {
         var _loc2_:int = int(param1.var_2168);
         var _loc3_:int = int(param1.var_2473);
         switch(_loc3_)
         {
            case class_455.START:
               method_5154(_loc2_);
               break;
            case class_455.END:
               method_6317(_loc2_);
         }
      }
      
      private static function method_5154(param1:int) : void
      {
         var _loc2_:class_190 = class_1231.method_4924(param1);
         _loc2_.var_3850 = 0;
         _loc2_.var_1443 = false;
         class_1231.method_4720(param1);
      }
      
      private static function method_6317(param1:int) : void
      {
         var _loc2_:* = null;
         if(false && class_81.var_121.var_3580 != null)
         {
            _loc2_ = class_81.var_121.var_3580[param1] as class_190;
            if(_loc2_ != null)
            {
               delete class_81.var_121.var_3580[param1];
               var_574.method_4489().method_1917(param1);
            }
         }
      }
   }
}
