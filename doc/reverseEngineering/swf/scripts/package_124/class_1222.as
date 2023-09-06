package package_124
{
   import package_37.class_170;
   import package_38.class_315;
   import package_38.class_388;
   import package_39.class_100;
   
   public class class_1222 extends class_170
   {
       
      
      public function class_1222()
      {
         super();
      }
      
      public static function run(param1:class_388) : void
      {
         var _loc3_:* = null;
         var _loc2_:class_100 = class_100.getInstance();
         if(_loc2_.method_503)
         {
            _loc2_.method_4332();
            var_574.name_47.method_3528.method_70(1,0);
         }
         var_574.method_6154().method_752().method_4820(param1);
         if(param1.var_2708 != null)
         {
            for each(_loc3_ in param1.var_2708)
            {
               class_392.run(_loc3_);
            }
         }
      }
   }
}
